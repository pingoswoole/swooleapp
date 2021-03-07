<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>@yield('title', 'page')</title>
    <meta name="keywords" content="mobile,pingo">
    <meta name="description" content="pingo framework">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Access-Control-Allow-Origin" content="*">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="icon" href="/images/favicon.ico">
    <link href="https://cdn.bootcdn.net/ajax/libs/weui/2.3.0/style/weui.min.css" rel="stylesheet">
    <link href="https://cdn.bootcdn.net/ajax/libs/jquery-weui/1.2.1/css/jquery-weui.min.css" rel="stylesheet">
    @yield('header_style')
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    @yield('header_js')
    
</head>
<body class="@yield('body-class', '')">
    
	@yield('body')
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/axios/0.21.0/axios.min.js"></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery-weui/1.2.1/js/jquery-weui.min.js"></script>
    @yield('footer_js')
</body>
</html>
