
@extends('layouts.admin')
@section('title', '控制面板')
@section('header_style')
<style>
  .top-panel {
      border: 1px solid #eceff9;
      border-radius: 5px;
      text-align: center;
  }
  .top-panel > .layui-card-body{
      height: 60px;
  }
  .top-panel-number{
      line-height:60px;
      font-size: 30px;
      border-right:1px solid #eceff9;
  }
  .top-panel-tips{
      line-height:30px;
      font-size: 12px
  }
</style>
@endsection
@section("body-class", "layui-layout-body layuimini-all")
@section('body')
<div class="layui-layout layui-layout-admin">

  <div class="layui-header header">
      <div class="layui-logo layuimini-logo"></div>

      <div class="layuimini-header-content">
          <a>
              <div class="layuimini-tool"><i title="展开" class="fa fa-outdent" data-side-fold="1"></i></div>
          </a>

          <!--电脑端头部菜单-->
          <ul class="layui-nav layui-layout-left layuimini-header-menu layuimini-menu-header-pc layuimini-pc-show">
          </ul>

          <!--手机端头部菜单-->
          <ul class="layui-nav layui-layout-left layuimini-header-menu layuimini-mobile-show">
              <li class="layui-nav-item">
                  <a href="javascript:;"><i class="fa fa-list-ul"></i> 选择模块</a>
                  <dl class="layui-nav-child layuimini-menu-header-mobile">
                  </dl>
              </li>
          </ul>

          <ul class="layui-nav layui-layout-right">

              <li class="layui-nav-item" lay-unselect>
                  <a href="javascript:;" data-refresh="刷新"><i class="fa fa-refresh"></i></a>
              </li>
              <li class="layui-nav-item" lay-unselect>
                  <a href="javascript:;" data-clear="清理" class="layuimini-clear"><i class="fa fa-trash-o"></i></a>
              </li>
              <li class="layui-nav-item mobile layui-hide-xs" lay-unselect>
                  <a href="javascript:;" data-check-screen="full"><i class="fa fa-arrows-alt"></i></a>
              </li>
              <li class="layui-nav-item layuimini-setting">
                  <a href="javascript:;">admin</a>
                  <dl class="layui-nav-child">
                      <dd>
                          <a href="javascript:;" layuimini-content-href="page/user-setting.html" data-title="基本资料" data-icon="fa fa-gears">基本资料<span class="layui-badge-dot"></span></a>
                      </dd>
                      <dd>
                          <a href="javascript:;" layuimini-content-href="page/user-password.html" data-title="修改密码" data-icon="fa fa-gears">修改密码</a>
                      </dd>
                      <dd>
                          <hr>
                      </dd>
                      <dd>
                          <a href="javascript:;" class="login-out">退出登录</a>
                      </dd>
                  </dl>
              </li>
              <li class="layui-nav-item layuimini-select-bgcolor" lay-unselect>
                  <a href="javascript:;" data-bgcolor="配色方案"><i class="fa fa-ellipsis-v"></i></a>
              </li>
          </ul>
      </div>
  </div>

  <!--无限极左侧菜单-->
  <div class="layui-side layui-bg-black layuimini-menu-left">
  </div>

  <!--初始化加载层-->
  <div class="layuimini-loader">
      <div class="layuimini-loader-inner"></div>
  </div>

  <!--手机端遮罩层-->
  <div class="layuimini-make"></div>

  <!-- 移动导航 -->
  <div class="layuimini-site-mobile"><i class="layui-icon"></i></div>

  <div class="layui-body">

      <div class="layuimini-tab layui-tab-rollTool layui-tab" lay-filter="layuiminiTab" lay-allowclose="true">
          <ul class="layui-tab-title">
              <li class="layui-this" id="layuiminiHomeTabId" lay-id=""></li>
          </ul>
          <div class="layui-tab-control">
              <li class="layuimini-tab-roll-left layui-icon layui-icon-left"></li>
              <li class="layuimini-tab-roll-right layui-icon layui-icon-right"></li>
              <li class="layui-tab-tool layui-icon layui-icon-down">
                  <ul class="layui-nav close-box">
                      <li class="layui-nav-item">
                          <a href="javascript:;"><span class="layui-nav-more"></span></a>
                          <dl class="layui-nav-child">
                              <dd><a href="javascript:;" layuimini-tab-close="current">关 闭 当 前</a></dd>
                              <dd><a href="javascript:;" layuimini-tab-close="other">关 闭 其 他</a></dd>
                              <dd><a href="javascript:;" layuimini-tab-close="all">关 闭 全 部</a></dd>
                          </dl>
                      </li>
                  </ul>
              </li>
          </div>
          <div class="layui-tab-content">
              <div id="layuiminiHomeTabIframe" class="layui-tab-item layui-show"></div>
          </div>
      </div>

  </div>
</div>

@endsection

@section('footer_js')
<script src="/backend/js/lay-config.js?v=2.0.0" charset="utf-8"></script>
<script>
  layui.use(['jquery', 'layer', 'miniAdmin','miniTongji'], function () {
      var $ = layui.jquery,
          layer = layui.layer,
          miniAdmin = layui.miniAdmin,
          miniTongji = layui.miniTongji;

      var options = {
          iniUrl: "/asdfasdapi/init.json",    // 初始化接口
          clearUrl: "api/clear.json", // 缓存清理接口
          urlHashLocation: true,      // 是否打开hash定位
          bgColorDefault: false,      // 主题默认配置
          multiModule: true,          // 是否开启多模块
          menuChildOpen: false,       // 是否默认展开菜单
          loadingTime: 0,             // 初始化加载时间
          pageAnim: true,             // iframe窗口动画
          maxTabNum: 20,              // 最大的tab打开数量
      };
      miniAdmin.render(options);
 

      $('.login-out').on("click", function () {
          layer.msg('退出登录成功', function () {
              window.location = 'page/login-3.html';
          });
      });
  });
</script>
@endsection