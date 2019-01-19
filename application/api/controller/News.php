<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019\1\13 0013
 * Time: 10:40
 */

namespace app\api\controller;


use app\common\controller\Api;
use think\Db;

/**
 * 新闻
 * Class News
 * @package app\api\controller
 */
class News extends Api
{
    protected $noNeedLogin = ['*'];
    protected $noNeedRight = ['*'];

    /**
     * 详情
     * @param int $id 新闻id
     */
    public function detail()
    {
        $id = input('id/d');
        Db::table('fa_news_trends')->where('id', $id)->setInc('favor', rand(10, 20));
        $result = Db::table('fa_news_trends')->find($id);
        if (!empty($result)) {
            $result['image'] = $this->request->domain() . $result['image'];
            $result['createtime'] = date('Y-m-d', $result['createtime']);
        }
        $otherService = Db::table('fa_news_trends')->where('id', '<>', $id)->field('id,title,summary')->limit(4)->select();
        $result['other_news'] = $otherService;
        $result['previous'] = Db::table('fa_news_trends')->where('id', '<', $id)->order('id','desc')->field('id,title,summary')->find();
        $result['next'] = Db::table('fa_news_trends')->where('id', '>', $id)->field('id,title,summary')->find();

        $this->success('获取成功', $result);
    }

}