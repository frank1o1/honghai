<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019\1\13 0013
 * Time: 10:25
 */

namespace app\api\controller;


use app\common\controller\Api;
use think\Db;

/**
 * 案例
 * Class Cases
 * @package app\api\controller
 */
class Cases extends Api
{
    protected $noNeedLogin = ['*'];
    protected $noNeedRight = ['*'];

    /**
     * 详情
     * @param int $id 案例id
     */
    public function detail()
    {
        $id = input('id/d');
        $result = Db::table('fa_document')->find($id);
        $result['image'] = $this->request->domain() . $result['image'];
        $otherService = Db::table('fa_document')->where('id', '<>', $id)->field('id,title,image,summary')->limit(3)->select();
        if (!empty($otherService)) {
            foreach ($otherService as &$value) {
                $value['image'] = $this->request->domain() . $value['image'];
            }
        }
        $result['other_document'] = $otherService;

        $this->success('获取成功', $result);
    }

    /**
     * 换一批
     */
    public function change()
    {
        $result =  Db::table('fa_document')->field('id,title,image,summary')->orderRaw('rand()')->limit(3)->select();
        if(!empty($result)){
            foreach($result as &$value){
                $value['image'] = $this->request->domain() . $value['image'];
            }
        }

        $this->success('获取成功',$result);
    }

}