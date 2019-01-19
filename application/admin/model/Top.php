<?php

namespace app\admin\model;

use think\Model;

class Top extends Model
{
    // 表名
    protected $name = 'top';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';

    // 定义时间戳字段名
    protected $createTime = 'createtime';
    protected $updateTime = false;
    
    // 追加属性
    protected $append = [

    ];

    public function menu()
    {
        return $this->belongsTo('Menu','menu_id')->setEagerlyType(0);
    }
    

    







}