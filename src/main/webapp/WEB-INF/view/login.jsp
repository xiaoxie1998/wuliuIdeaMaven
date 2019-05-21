<%@ page import="java.net.URLDecoder" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/5/14
  Time: 19:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<HTML xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <title>登录界面</title>
    <link href="${pageContext.request.contextPath}/login/css/default.css" rel="stylesheet" type="text/css" />
    <!--必要样式-->
    <link href="${pageContext.request.contextPath}/login/css/styles.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/login/css/demo.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/login/css/loaders.css" rel="stylesheet" type="text/css" />
    <%
        String username = "", password = "";
        Cookie[] cookies = request.getCookies();
        //System.out.println("cookies ="+cookies.length);
        if (cookies != null) {
            for (int i = 0; i < cookies.length; i++) {

                if (cookies[i].getName().equals("username")) {
                    //读取有中文的cookie
                    username = URLDecoder.decode(cookies[i].getValue(), "utf-8");

                }
                if (cookies[i].getName().equals("password")) {
                    password = cookies[i].getValue();

                }
            }
        }
        if (username == null)
            username = "";
        if (password == null)
            password = "";
    %>
</head>
<body>
<div class='login'>
    <div class='login_title'>
        <span>物流运输管理系统</span>
    </div>
    <div class='login_fields'>
        <div class='login_fields__user'>
            <div class='icon'>
                <img alt="" src='${pageContext.request.contextPath}/login/img/user_icon_copy.png'>
            </div>
            <input name="username" placeholder='用户名' maxlength="16" type='text' autocomplete="off" value="<%=username%>"/>
            <div class='validation'>
                <img alt="" src='${pageContext.request.contextPath}/login/img/tick.png'>
            </div>
        </div>
        <div class='login_fields__password'>
            <div class='icon'>
                <img alt="" src='${pageContext.request.contextPath}/login/img/lock_icon_copy.png'>
            </div>
            <input name="password" placeholder='密码' maxlength="16" type='password' value="<%=password%>" autocomplete="off">
            <div class='validation'>
                <img alt="" src='${pageContext.request.contextPath}/login/img/tick.png'>
            </div>
        </div>
        <div class='login_fields__password'>
            <div class='icon'>
                <img alt="" src='${pageContext.request.contextPath}/login/img/key.png'>
            </div>
            <input name="code" placeholder='验证码' maxlength="4" type='text' name="ValidateNum" autocomplete="off">
            <div class='validation' style="opacity: 1; right: -5px;top: -3px;">
                <canvas class="J_codeimg" id="myCanvas" onclick="Code();">对不起，您的浏览器不支持canvas，请下载最新版浏览器!</canvas>
            </div>
        </div>
        <div style="padding-left: 120px">
            <input type="checkbox" name="remember" value="1" />记住密码
        </div>
        <div class='login_fields__submit'>

            <input type='button' value='登录'>
        </div>
    </div>
    <div class='success'>
    </div>

</div>
<div class='authent'>
    <div class="loader" style="height: 44px;width: 44px;margin-left: 28px;">
        <div class="loader-inner ball-clip-rotate-multiple">
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>
    <p>认证中...</p>
</div>
<div class="OverWindows"></div>

<link href="${pageContext.request.contextPath}/layui/css/layui.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="${pageContext.request.contextPath}/login/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/login/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/login/js/stopExecutionOnTimeout.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/login/js/Particleground.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/login/js/Treatment.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/login/js/jquery.mockjax.js"></script>
<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script type="text/javascript">
    var canGetCookie = 0;//是否支持存储Cookie 0 不支持 1 支持
   // var ajaxmockjax = 1;//是否启用虚拟Ajax的请求响 0 不启用  1 启用
    //默认账号密码

    var truelogin = "123456";
    var truepwd = "123456";

    var CodeVal = 0;
    Code();
    function Code() {
        if(canGetCookie == 1){
            createCode("AdminCode");
            var AdminCode = getCookieValue("AdminCode");
            showCheck(AdminCode);
        }else{
            showCheck(createCode(""));
        }
    }
    function showCheck(a) {
        CodeVal = a;
        var c = document.getElementById("myCanvas");
        var ctx = c.getContext("2d");
        ctx.clearRect(0, 0, 1000, 1000);
        ctx.font = "80px 'Hiragino Sans GB'";
        ctx.fillStyle = "#E8DFE8";
        ctx.fillText(a, 0, 100);
    }
    $(document).keypress(function (e) {
        // 回车键事件
        if (e.which == 13) {
            $('input[type="button"]').click();
        }
    });
    //粒子背景特效
    $('body').particleground({
        dotColor: '#E8DFE8',
        lineColor: '#133b88'
    });
    $('input[name="password"]').focus(function () {
        $(this).attr('type', 'password');
    });
    $('input[type="text"]').focus(function () {
        $(this).prev().animate({ 'opacity': '1' }, 200);
    });
    $('input[type="text"],input[type="password"]').blur(function () {
        $(this).prev().animate({ 'opacity': '.5' }, 200);
    });
    $('input[name="username"],input[name="password"]').keyup(function () {
        var Len = $(this).val().length;
        if (!$(this).val() == '' && Len >= 5) {
            $(this).next().animate({
                'opacity': '1',
                'right': '30'
            }, 200);
        } else {
            $(this).next().animate({
                'opacity': '0',
                'right': '20'
            }, 200);
        }
    });
    var open = 0;

    layui.use('layer', function () {

        //非空验证
        $('input[type="button"]').click(function () {
            var username = $('input[name="username"]').val();
            var password = $('input[name="password"]').val();
            var code = $('input[name="code"]').val();
            var remember = $('input[name="remember"]').get(0).checked;
            if (username == '') {
                ErroAlert('请输入您的账号');
            } else if (password == '') {
                ErroAlert('请输入密码');
            } else if (code == '' || code.length != 4) {
                ErroAlert('输入验证码');
            } else {
                //认证中..
                fullscreen();
                $('.login').addClass('test'); //倾斜特效
                setTimeout(function () {
                    $('.login').addClass('testtwo'); //平移特效
                }, 300);
                setTimeout(function () {
                    $('.authent').show().animate({ right: -320 }, {
                        easing: 'easeOutQuint',
                        duration: 600,
                        queue: false
                    });
                    $('.authent').animate({ opacity: 1 }, {
                        duration: 200,
                        queue: false
                    }).addClass('visible');
                }, 500);

                //登录
                var JsonData = { username: username, password: password, code: code, remember:remember };
                //此处做为ajax内部判断
                var url = "";
               /* if(JsonData.username == truelogin && JsonData.password == truepwd && JsonData.code.toUpperCase() == CodeVal.toUpperCase()){
                    url = "Ajax/Login";
                }else{
                    url = "Ajax/LoginFalse";
                }
*/
                url="${pageContext.request.contextPath}/users/login.action";

                AjaxPost(url, JsonData,
                    function () {
                        //ajax加载中
                    },
                    function (data) {
                        //ajax返回
                        //认证完成
                        setTimeout(function () {
                            $('.authent').show().animate({ right: 90 }, {
                                easing: 'easeOutQuint',
                                duration: 600,
                                queue: false
                            });
                            $('.authent').animate({ opacity: 0 }, {
                                duration: 200,
                                queue: false
                            }).addClass('visible');
                            $('.login').removeClass('testtwo'); //平移特效
                        }, 2000);
                        setTimeout(function () {
                            $('.authent').hide();
                            $('.login').removeClass('test');
                            if (data == 3) {
                                //登录成功
                                $('.login div').fadeOut(100);
                                $('.success').fadeIn(1000);
                                $('.success').html(data.Text);
                                //跳转操作
                                location.href="${pageContext.request.contextPath}/load/main.action";
                            } else if(data==2){
                                ErroAlert('该账号已禁用');
                            }else if(data==1){
                                ErroAlert('密码错误');
                            }else if(data==0){
                                ErroAlert('账号不存在');
                            }else {
                                AjaxErro(data);
                            }
                        }, 2400);
                    })
            }
        })

   })
    var fullscreen = function () {
        elem = document.body;
        if (elem.webkitRequestFullScreen) {
            elem.webkitRequestFullScreen();
        } else if (elem.mozRequestFullScreen) {
            elem.mozRequestFullScreen();
        } else if (elem.requestFullScreen) {
            elem.requestFullscreen();
        } else {
            //浏览器不支持全屏API或已被禁用
        }
    }
   /* if(ajaxmockjax == 1){
        $.mockjax({
            url: 'Ajax/Login',
            status: 200,
            responseTime: 50,
            responseText: {"Status":"ok","Text":"登录成功<br /><br />欢迎回来"}
        });
        $.mockjax({
            url: 'Ajax/LoginFalse',
            status: 200,
            responseTime: 50,
            responseText: {"Status":"Erro","Erro":"账号名或密码或验证码有误"}
        });
    }*/
</script>

</body>
</html>

