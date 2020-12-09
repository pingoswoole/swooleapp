<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>@yield('title')</title>
    <meta name="keywords" content="pingo,后台管理">
    <meta name="description" content="data manager">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Access-Control-Allow-Origin" content="*">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="icon" href="/images/favicon.ico">
    <link rel="stylesheet" href="/backend/lib/layui-v2.5.6/css/layui.css" media="all">
    <link rel="stylesheet" href="/backend/css/layuimini.css?v=2.0.5.6" media="all">
    <link rel="stylesheet" href="/backend/css/themes/default.css" media="all">
    <link rel="stylesheet" href="/backend/lib/font-awesome-4.7.0/css/font-awesome.min.css" media="all">
    <link rel="stylesheet" href="/backend/css/public.css" media="all">
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script src="/backend/lib/jquery-3.4.1/jquery-3.4.1.min.js" charset="utf-8"></script>
    <script src="/backend/js/axios.min.js" charset="utf-8"></script>
    <script src="/backend/js/global.js" charset="utf-8"></script>
    <style id="layuimini-bg-color">
    </style>
    @yield('header_style')
</head>
<body class="@yield('body-class')">
    
	@yield('body')

	@yield('footer')
    <script src="/backend/lib/layui-v2.5.6/layui.js" charset="utf-8"></script>
    @yield('footer_js')
 
</body>
</html>
