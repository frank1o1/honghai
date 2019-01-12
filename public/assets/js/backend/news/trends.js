define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'news/trends/index',
                    add_url: 'news/trends/add',
                    edit_url: 'news/trends/edit',
                    del_url: 'news/trends/del',
                    multi_url: 'news/trends/multi',
                    table: 'news_trends',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'id',
                columns: [
                    [
                        {checkbox: true},
                        {field: 'id', title: __('Id')},
                        {
                            field: 'category.name', title: __('Category_id'), addClass: 'selectpage',
                            data: 'data-source="news/category/index" data-field="name" data-primary-key="name"'
                        },
                        {field: 'title', title: __('Title')},
                        {field: 'image', title: __('Image'), formatter: Table.api.formatter.image},
                        {
                            field: 'status_switch',
                            title: __('Satus_switch'),
                            searchList: {"0": __('Satus_switch 0'), "1": __('Satus_switch 1')},
                            formatter: Table.api.formatter.toggle
                        },
                        {
                            field: 'createtime',
                            title: __('Createtime'),
                            operate: 'RANGE',
                            addclass: 'datetimerange',
                            formatter: Table.api.formatter.datetime
                        },
                        {
                            field: 'operate',
                            title: __('Operate'),
                            table: table,
                            events: Table.api.events.operate,
                            formatter: Table.api.formatter.operate
                        }
                    ]
                ]
            });

            // 为表格绑定事件
            Table.api.bindevent(table);
        },
        add: function () {
            Controller.api.bindevent();
        },
        edit: function () {
            Controller.api.bindevent();
        },
        api: {
            bindevent: function () {
                Form.api.bindevent($("form[role=form]"));
            }
        }
    };
    return Controller;
});