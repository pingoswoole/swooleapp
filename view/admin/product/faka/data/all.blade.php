@extends('layouts.admin_frame')

@section('header_style')
 
@endsection

@section('body')

<fieldset class="table-search-fieldset">
    <legend>搜索信息</legend>
    <div style="margin: 10px 10px 10px 10px">
        <form class="layui-form layui-form-pane" action="">
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">用户姓名</label>
                    <div class="layui-input-inline">
                        <input type="text" name="username" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">用户性别</label>
                    <div class="layui-input-inline">
                        <input type="text" name="sex" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">用户城市</label>
                    <div class="layui-input-inline">
                        <input type="text" name="city" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">用户职业</label>
                    <div class="layui-input-inline">
                        <input type="text" name="classify" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <button type="submit" class="layui-btn layui-btn-primary"  lay-submit lay-filter="data-search-btn"><i class="layui-icon"></i> 搜 索</button>
                </div>
            </div>
        </form>
    </div>
</fieldset>

<script type="text/html" id="tableToolbar">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn" lay-event="downloadVip"> 下载VIP未使用卡包 </button>
        <button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn" lay-event="downloadSVip"> 下载SVIP未使用卡包 </button>
        {{-- <button class="layui-btn layui-btn-sm layui-btn-danger data-delete-btn" lay-event="delete"> 删除 </button> --}}
    </div>
</script>

<table class="layui-hide" id="dataTable" lay-filter="dataTableFilter"></table>

<script type="text/html" id="dataTableBar">
    <a class="layui-btn layui-btn-normal layui-btn-xs data-count-edit" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="delete">删除</a>
</script>

@endsection


@section('footer_js')

 
<script>
    layui.use(['form', 'table'], function () {
        var $ = layui.jquery,
            form = layui.form,
            table = layui.table;

        table.render({
            elem: '#dataTable',
            url: '/backend/product/faka/getPageList',
            toolbar: '#tableToolbar',
            defaultToolbar: ['filter', 'exports', 'print', {
                title: '提示',
                layEvent: 'LAYTABLE_TIPS',
                icon: 'layui-icon-tips'
            }],
            cols: [[
                {type: "checkbox", width: 50},
                {field: 'id', width: 80, title: 'ID', sort: true},
                {field: 'type_txt',  title: '类型'},
                {field: 'number',  title: '卡号'},
                {field: 'state_txt',  title: '是否使用'},
                {field: 'mid',  title: '用户ID'},
                {field: 'created_at', width: 135, title: '创建时间', sort: true},
                {field: 'updated_at', width: 135, title: '使用时间', sort: true},
               /*  {title: '操作', minWidth: 150, toolbar: '#dataTableBar', align: "center"} */
            ]],
            limits: [10, 15, 20, 25, 50, 100],
            limit: 15,
            page: true,
            skin: 'line'
        });

        // 监听搜索操作
        form.on('submit(data-search-btn)', function (data) {
            var result = JSON.stringify(data.field);
            layer.alert(result, {
                title: '最终的搜索信息'
            });

            //执行搜索重载
            table.reload('dataTable', {
                page: {
                    curr: 1
                }
                , where: {
                    searchParams: result
                }
            }, 'data');

            return false;
        });

        /**
         * toolbar监听事件
         */
        table.on('toolbar(dataTableFilter)', function (obj) {
            if (obj.event === 'add') {  // 监听添加操作
                var index = layer.open({
                    title: '添加',
                    type: 2,
                    shade: 0.2,
                    maxmin:true,
                    shadeClose: true,
                    area: ['90%', '90%'],
                    content: '/backend/product/onlineshop_category/addItem',
                    end: function(){
                        table.reload('dataTable')
                    }
                });
                $(window).on("resize", function () {
                    layer.full(index);
                });
            } else if (obj.event === 'delete') {  // 监听删除操作
                var checkStatus = table.checkStatus('dataTable')
                    , data = checkStatus.data;
                layer.alert(JSON.stringify(data));
            } else if(obj.event === 'downloadVip'){
                    
                    layer.confirm('下载VIP卡包文件，到发卡平台选择商品上传该文件！', function (index) {
                        layer.load(3)
                       $.post('/backend/product/faka/download/1', {}, function(result){
                            layer.closeAll()
                            var index = layer.open({
                                title: '下载不了，请复制内容到发卡平台',
                                type: 2,
                                shade: 0.2,
                                maxmin:true,
                                shadeClose: true,
                                area: ['90%', '90%'],
                                content: result.data.link,
                                end: function(){
                                    
                                }
                            });
                       })
                });
            }else if(obj.event === 'downloadSVip'){
                layer.confirm('下载SVIP卡包文件，到发卡平台选择商品上传该文件！', function (index) {
                        layer.load(3)
                       $.post('/backend/product/faka/download/2', {}, function(result){
                            layer.closeAll()
                            var index = layer.open({
                                title: '下载不了，请复制内容到发卡平台,【每次只能复制一半添加，发卡平台的BUG】',
                                type: 2,
                                shade: 0.2,
                                maxmin:true,
                                shadeClose: true,
                                area: ['90%', '90%'],
                                content: result.data.link,
                                end: function(){
                                    
                                }
                            });
                            
                       })
                    });
            }

        });

        //监听表格复选框选择
        table.on('checkbox(dataTableFilter)', function (obj) {
            console.log(obj)
        });

        table.on('tool(dataTableFilter)', function (obj) {
            var data = obj.data;
            if (obj.event === 'edit') {

                var index = layer.open({
                    title: '编辑用户',
                    type: 2,
                    shade: 0.2,
                    maxmin:true,
                    shadeClose: true,
                    area: ['90%', '90%'],
                    content: '/backend/product/onlineshop_category/viewItem/'+data.id,
                    end: function(){
                        table.reload('dataTable')
                    }
                });
                $(window).on("resize", function () {
                    layer.full(index);
                });
                return false;
            } else if (obj.event === 'delete') {
                layer.confirm('真的删除行么', function (index) {
                    $.post('/backend/product/onlineshop_category/delItem/'+data.id, {}, function(result){
                        layer.msg(result.msg, {time: 2000}, function(){
                            if(result.code === 0 ){
                                obj.del();
                                layer.close(index);
                            }
                        })
                    })
                });
            }
        });

    });
</script>
@endsection