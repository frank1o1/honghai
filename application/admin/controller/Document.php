<?php

namespace app\admin\controller;

use app\common\controller\Backend;
use controller\BasicAdmin;

/**
 * 案例介绍
 *
 * @icon fa fa-circle-o
 */
class Document extends BasicAdmin
{
    
    /**
     * Document模型对象
     * @var \app\admin\model\Document
     */
    protected $model = null;
    protected $relationSearch = true;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\admin\model\Document;

    }
    
    /**
     * 默认生成的控制器所继承的父类中有index/add/edit/del/multi五个基础方法、destroy/restore/recyclebin三个回收站方法
     * 因此在当前控制器中可不用编写增删改查的代码,除非需要自己控制这部分逻辑
     * 需要将application/admin/library/traits/Backend.php中对应的方法复制到当前控制器,然后进行修改
     */

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
                ->with(['category'])
                ->where($param['where'])
                ->order($param['sort'], $param['order'])
                ->limit($param['offset'], $param['limit'])
                ->select();
            $total = $this->model
                ->with(['category'])
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
    

}
