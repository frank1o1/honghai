<?php
/**
 * 重写后台管理类
 * 修改部分方法，增加行为钩子
 * Company:深圳市三牛犇科技有限公司
 * User: bruce·mi
 * Date: 2018/9/5/005
 * Time: 9:46
 */

namespace controller;

use app\common\controller\Backend;

/**
 * Class BasicAdmin
 * @package controller
 * @method  paramFilter 过滤列表参数
 * @method  dataFilter 修改列表数据
 * @method  showResult 修改显示结果
 * @method  saveFilter 修改保存参数
 * @method  saveResult 修改保存结果
 * @method  deleteFilter 删除前
 * @method  deleteResult 删除后
 * @method  multiResult 批量更新后
 */
class BasicAdmin extends Backend
{
    /**
     * 查看
     */
    public function index()
    {
        //设置过滤方法
        $this->request->filter(['strip_tags']);
        if ($this->request->isAjax()) {
            //如果发送的来源是Selectpage，则转发到Selectpage
            if ($this->request->request('keyField')) {
                return $this->selectpage();
            }
            list($where, $sort, $order, $offset, $limit) = $this->buildparams();
            $param = [
                'where' => $where,
                'sort' => $sort,
                'order' => $order,
                'offset' => $offset,
                'limit' => $limit
            ];
            /*参数过滤*/
            if (false === $this->callback('paramFilter', $param)) {
                $this->error(__('param filter failure'));
            }
            $list = $this->model
                ->where($param['where'])
                ->order($param['sort'], $param['order'])
                ->limit($param['offset'], $param['limit'])
                ->select();
            $total = $this->model
                ->where($param['where'])
                ->order($param['sort'], $param['order'])
                ->count();
            if (false !== $this->callback('dataFilter', $list)) {
                $list = collection($list)->toArray();
                $result = array("total" => $total, "rows" => $list);
                return json($result);
            } else {
                $this->error(__('data filter failure'));
            }
        }
        return $this->view->fetch();
    }

    /**
     * 添加|修改
     * @param null $ids
     * @return string
     * @throws \think\Exception
     * @throws \think\exception\DbException
     */
    public function save($ids = null)
    {
        $adminIds = $this->getDataLimitAdminIds();
        /*修改*/
        if (!empty($ids)) {
            $row = $this->model->get($ids);
            if (!$row) {
                $this->error(__('No Results were found'));
            }
            if ($this->request->isGet()) {
                if (false !== $this->callback('showResult', $row)) {
                    $this->view->assign("row", $row);
                }
            }
            if (is_array($adminIds)) {
                if (!in_array($row[$this->dataLimitField], $adminIds)) {
                    $this->error(__('You have no permission'));
                }
            }
        }
        if ($this->request->isGet()) {
            if (false !== $this->callback('showResult', $row)) {
                $this->view->assign("row", $row);
                return $this->view->fetch();
            }
        }
        $params = $this->request->post("row/a");
        if (empty($params)) {
            $this->error(__('Parameter %s can not be empty', ''));
        }
        $pk = $this->model->getPk();
        /*添加*/
        if (empty($ids)) {
            if ($this->dataLimit && $this->dataLimitFieldAutoFill) {
                $params[$this->dataLimitField] = $this->auth->id;
            }
        } else {
            $params[$pk] = $ids;
            $this->model->isUpdate(true);
        }
        try {
            //是否采用模型验证
            if ($this->modelValidate) {
                $name = basename(str_replace('\\', '/', get_class($this->model)));
                $act = request()->action();
                $validate = is_bool($this->modelValidate) ? ($this->modelSceneValidate ? $name . '.' . $act : true) : $this->modelValidate;
                $this->model->validate($validate);
            }
            /*过滤参数*/
            if (false !== $this->callback('saveFilter', $params)) {
                $result = $this->model->allowField(true)->save($params);
                if ($result !== false) {
                    $params = $this->model->getData();
                    /*保存成功后，行为钩子*/
                    if (false !== $this->callback('saveResult', $params)) {
                        $this->success();
                    } else {
                        $this->error(__('save fail!'));
                    }
                } else {
                    $this->error($this->model->getError());
                }
            }
        } catch (\think\exception\PDOException $e) {
            $this->error($e->getMessage());
        }
    }

    /**
     * 添加
     * @throws \think\Exception
     * @throws \think\exception\DbException
     */
    public function add()
    {
        return $this->save();
    }

    /**
     * 编辑
     * @param null $ids
     * @return string
     * @throws \think\Exception
     * @throws \think\exception\DbException
     */
    public function edit($ids = null)
    {
        return $this->save($ids);
    }

    public function del($ids = "")
    {
        if ($ids) {
            $pk = $this->model->getPk();
            $adminIds = $this->getDataLimitAdminIds();
            if (is_array($adminIds)) {
                $count = $this->model->where($this->dataLimitField, 'in', $adminIds);
            }
            $list = $this->model->where($pk, 'in', $ids)->select();
            //删除前，行为钩子
            if (false === $this->callback('deleteFilter', $list)) {
                $this->error(__('delete fail!'));
            }
            $count = 0;
            foreach ($list as $k => $v) {
                $count += $v->delete();
            }
            if ($count) {
                //删除后，行为钩子
                if (false !== $this->callback('deleteResult', $result)) {
                    $this->success();
                } else {
                    $this->error(__('delete fail!'));
                }
            } else {
                $this->error(__('No rows were deleted'));
            }
        }
        $this->error(__('Parameter %s can not be empty', 'ids'));
    }

    /**
     * 批量更新
     */
    public function multi($ids = "")
    {
        $ids = $ids ? $ids : $this->request->param("ids");
        if ($ids) {
            if ($this->request->has('params')) {
                parse_str($this->request->post("params"), $values);
                $values = array_intersect_key($values,
                    array_flip(is_array($this->multiFields) ? $this->multiFields : explode(',', $this->multiFields)));
                if ($values) {
                    $adminIds = $this->getDataLimitAdminIds();

                    if (is_array($adminIds)) {
                        $this->model->where($this->dataLimitField, 'in', $adminIds);
                    }
                    $count = 0;
                    $list = $this->model->where($this->model->getPk(), 'in', $ids)->select();

                    foreach ($list as $index => $item) {
                        $c = $item->allowField(true)->isUpdate(true)->save($values);
                        if ($c) {
                            $data = $item->toArray();
                            $data = array_merge($data, $values);
                            $this->callback('multiResult', $data);
                        }
                        $count += $c;

                    }
                    if ($count) {
                        $this->success();
                    } else {
                        $this->error(__('No rows were updated'));
                    }
                } else {
                    $this->error(__('You have no permission'));
                }
            }
        }
        $this->error(__('Parameter %s can not be empty', 'ids'));
    }

    /**
     * 当前对象回调成员方法
     * @param string $method
     * @param array|bool $data
     * @return bool
     */
    protected function callback($method, &$data, $params=null)
    {
        foreach ([$method, ucfirst($this->request->action()) . "{$method}"] as $_method) {
            if (method_exists($this, $_method) && false === $this->$_method($data,$params)) {
                return false;
            }
        }
        return true;
    }

}
