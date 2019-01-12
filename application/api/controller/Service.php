<?php
/**
 * Created by PhpStorm.
 * User: SNB-HH
 * Date: 2019/1/12
 * Time: 18:29
 */

namespace app\api\controller;


use app\common\controller\Api;
use think\Db;

class Service extends Api
{
    protected $noNeedLogin = ['*'];
    protected $noNeedRight = ['*'];

    public function detail()
    {
        $id = input('id/d');
        $result = Db::table('fa_service')->find($id);
        $result['image'] = $this->request->domain() . $result['image'];

    }
}