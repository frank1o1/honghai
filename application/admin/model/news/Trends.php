<?php

namespace app\admin\model\news;

use think\Model;

class Trends extends Model
{
    // 表名
    protected $name = 'news_trends';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';

    // 定义时间戳字段名
    protected $createTime = 'createtime';
    protected $updateTime = false;
    
    // 追加属性
    protected $append = [
        'satus_switch_text'
    ];
    

    
    public function getSatusSwitchList()
    {
        return ['0' => __('Satus_switch 0'),'1' => __('Satus_switch 1')];
    }     


    public function getSatusSwitchTextAttr($value, $data)
    {        
        $value = $value ? $value : (isset($data['satus_switch']) ? $data['satus_switch'] : '');
        $list = $this->getSatusSwitchList();
        return isset($list[$value]) ? $list[$value] : '';
    }

    public function category()
    {
        return $this->belongsTo('Category','category_id')->setEagerlyType(0);
    }




}
