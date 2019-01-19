<?php

namespace app\api\controller;

use app\common\controller\Api;
use think\Db;

/**
 * 首页接口
 */
class Index extends Api
{

    protected $noNeedLogin = ['*'];
    protected $noNeedRight = ['*'];

    /**
     * 首页
     *
     */
    public function index()
    {
        //轮播图
        $banner = Db::table('fa_banner')->field('image')->select();
        if (!empty($banner)) {
            foreach ($banner as &$value) {
                $value['image'] = $this->request->domain() . $value['image'];
            }
        }

        //服务范围
        $service = Db::table('fa_service')->field('id,title,image,summary')->order('weigh', 'desc')->limit(6)->select();
        if (!empty($service)) {
            foreach ($service as &$value) {
                $value['image'] = $this->request->domain() . $value['image'];
            }
        }

        //优势
        $advantages = Db::table('fa_advantages')->field('image,title,content')->select();
        if (!empty($advantages)) {
            foreach ($advantages as &$value) {
                $value['image'] = $this->request->domain() . $value['image'];
            }
        }

        //案例
        $cases = Db::table('fa_document')->field('id,title,image,summary')->order('weigh', 'desc')->limit(8)->select();
        if (!empty($cases)) {
            foreach ($cases as &$value) {
                $value['image'] = $this->request->domain() . $value['image'];
            }
        }

        //新闻动态
        $news = Db::table('fa_news_trends')->where('status_switch',
            1)->field('id,title,image,summary,createtime')->order('createtime', 'desc')->limit(5)->select();
        if (!empty($news)) {
            foreach ($news as &$value) {
                $value['image'] = $this->request->domain() . $value['image'];
                $value['createtime'] = date('Y-m-d', $value['createtime']);
            }
        }

        //关于我们
        $about = Db::table('fa_about')->whereNotNull('id')->field('title,image,content')->find();
        if (!empty($about)) {
            $about['image'] = $this->request->domain() . $about['image'];
        }

        $this->success('请求成功', array(
            'banner' => $banner,
            'service' => $service,
            'advantages' => $advantages,
            'news' => $news,
            'about' => $about
        ));
    }

    /**
     * 新闻列表
     * @param int $category 分类id
     * @param int $page 页数
     * @param int $pageSize 页面大小
     */
    public function news()
    {
        $category = input('category/d', '');
        $page = input('page/d', 1);
        $pageSize = input('pageSize/d', 10);

        if (!empty($category)) {
            $list = Db::table('fa_news_trends')->where('category_id', $category)->where('status_switch', 1)->page($page,
                $pageSize)->field('id,title,image,summary,createtime')->select();
            $total = Db::table('fa_news_trends')->where('category_id', $category)->where('status_switch', 1)->count();
        } else {
            $list = Db::table('fa_news_trends')->where('status_switch', 1)->page($page,
                $pageSize)->field('id,title,image,summary,createtime')->select();
            $total = Db::table('fa_news_trends')->where('status_switch', 1)->count();
        }
        $categoryList = Db::table('fa_news_category')->select();
        if (!empty($list)) {
            foreach ($list as &$value) {
                $value['image'] = $this->request->domain() . $value['image'];
                $value['createtime'] = date('Y-m-d', $value['createtime']);
            }
        }

        $this->success('请求成功', array(
            'category' => $category,
            'page' => $page,
            'pageSize' => $pageSize,
            'news' => $list,
            'categoryList' => $categoryList,
            'total' => $total
        ));
    }

    /**
     * 服务范围列表
     * @param int $page 页数
     * @param int $pageSize 页面大小
     */
    public function service()
    {
        $page = input('page/d', 1);
        $pageSize = input('pageSize/d', 10);

        $service = Db::table('fa_service')->field('id,title,image,summary')->order('weigh', 'desc')->page($page,
            $pageSize)->select();
        if (!empty($service)) {
            foreach ($service as &$value) {
                $value['image'] = $this->request->domain() . $value['image'];
            }
        }

        $this->success('请求成功', array(
            'page' => $page,
            'pageSize' => $pageSize,
            'service' => $service,
            'total' => Db::table('fa_service')->count()
        ));

    }

    /**
     * 案例介绍
     * @param int $category 分类id
     * @param int $page 页数
     * @param int $pageSize 页面大小
     */
    public function cases()
    {
        $category = input('category/d', '');
        $page = input('page/d', 1);
        $pageSize = input('pageSize/d', 10);

        if (!empty($category)) {
            $document = Db::table('fa_document')->where('category_id',
                $category)->field('id,title,image,summary')->order('weigh', 'desc')->page($page,
                $pageSize)->select();
        } else {
            $document = Db::table('fa_document')->field('id,title,image,summary')->order('weigh', 'desc')->page($page,
                $pageSize)->select();
        }

        $categoryList = Db::table('fa_categorys')->select();
        if (!empty($document)) {
            foreach ($document as &$value) {
                $value['image'] = $this->request->domain() . $value['image'];
            }
        }

        $this->success('请求成功', array(
            'category' => $category,
            'page' => $page,
            'pageSize' => $pageSize,
            'cases' => $document,
            'categoryList' => $categoryList,
            'total' => Db::table('fa_document')->count()
        ));

    }

    /**
     * 联系我们
     */
    public function contact()
    {
        $contact = Db::table('fa_contact')->whereNotNull('id')->field('email,mobile,address,longitude,latitude')->find();
        $linkerList = Db::table('fa_link')->order('weigh', 'desc')->select();
        if (!empty($linkerList)) {
            foreach ($linkerList as &$value) {
                $value['image'] = $this->request->domain() . $value['image'];
            }
        }

        $this->success('请求成功', array(
            'contact' => $contact,
            'linker' => $linkerList
        ));
    }

    /**
     * 关于我们
     */
    public function about()
    {
        $top = Db::table('fa_introduce_top')->whereNotNull('id')->find();
        $block = Db::table('fa_introduce_block')->order('weigh', 'desc')->select();
        $team = Db::table('fa_introduce_team')->whereNotNull('id')->find();
        $member = Db::table('fa_introduce_member')->order('weigh', 'desc')->select();
        if (!empty($member)) {
            foreach ($member as &$value) {
                $value['avatar'] = $this->request->domain() . $value['avatar'];
            }
        }
        $videos = Db::table('fa_introduce_videos')->select();
        if (!empty($videos)) {
            foreach ($videos as &$value) {
                $value['file'] = $this->request->domain() . $value['file'];
            }
        }
        $development = Db::table('fa_introduce_development')->whereNotNull('id')->find();
        $series = Db::table('fa_introduce_series')->order('occur_date', 'desc')->select();
        if (!empty($series)) {
            foreach ($series as &$value) {
                $value['image'] = $this->request->domain() . $value['image'];
                $value['occur_date'] = date('Y年m月d日', strtotime($value['occur_date']));
            }
        }

        $this->success('请求成功', array(
            'top' => $top,
            'block' => $block,
            'team' => $team,
            'member' => $member,
            'videos' => $videos,
            'development' => $development,
            'series' => $series
        ));
    }

    /**
     * 导航栏
     */
    public function menu()
    {
        $list = Db::table('fa_menu')->select();
        $this->success('获取成功', $list);
    }

    /**
     * 导航顶部图
     * @param int $id 菜单栏id
     */
    public function menuImage()
    {
        $id = input('id/d');
        $image = Db::table('fa_top')->where('menu_id', $id)->value('image');
        $image = $this->request->domain() . $image;

        $this->success('获取成功', array('image' => $image));
    }

}
