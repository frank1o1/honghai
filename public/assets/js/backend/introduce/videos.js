define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'introduce/videos/index',
                    add_url: 'introduce/videos/add',
                    edit_url: 'introduce/videos/edit',
                    del_url: 'introduce/videos/del',
                    multi_url: 'introduce/videos/multi',
                    table: 'introduce_videos',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'weigh',
                columns: [
                    [
                        {checkbox: true},
                        {field: 'id', title: __('Id')},
                        {field: 'title', title: __('Title')},
                        {field: 'weigh', title: __('Weigh')},
                        {
                            field: 'file', title: __('File'), formatter: function (value, row, index) {
                                return "<a href='" + value + "' target='_self'  class='btn btn-dialog'><img src=\"https://tool.fastadmin.net/icon/mp4.png\" onerror=\"this.src='https://tool.fastadmin.net/icon/'+'/uploads/20190112/56d1b97b9d43bbb4c3287c3e60815acb.mp4'.split('.').pop()+'.png';this.onerror=null;\" style='width: 50%;height: 50%;'></a>";
                            }
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