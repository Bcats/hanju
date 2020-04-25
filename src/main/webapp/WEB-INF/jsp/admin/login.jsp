<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
    <link rel="stylesheet" href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css">

    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>后台登录 - 黑猫影视系统</title>
</head>
<body>

<div>
    <div class="be-content pren">

        <div class="ioc_text">
            <%--<img src="i/login/logo.png" alt="">--%>
            <s:if test="${errorMsg != null}">
                <span>${username} - ${errorMsg}</span>
            </s:if>
            <s:if test="${empty errorMsg}">
                <span>请登录您的用户</span>
            </s:if>

        </div>

        <div>
            <form method="post" action="${pageContext.request.contextPath}/admin/loginCheckout">
                <div class="br-content">

                    <div class="input-group mb-4 bootint">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fa fa-user"></i></span>
                        </div>
                        <input type="text" class="form-control" name="username" placeholder="Username">
                    </div>

                    <div class="input-group mb-4 bootint">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fa fa-unlock-alt"></i></span>
                        </div>
                        <input type="password" class="form-control" name="password" placeholder="Your Password">
                    </div>

                    <%--<div class="br-text">
                        <p>
                            <span>忘记密码?</span>
                            <a href="">找回</a>
                        </p>
                    </div>--%>
                    <div style="padding-top: 10px">
                        <input type="submit" class="btn" value="登录">
                    </div>
                    <div class="be-con">
                        <span>Copyright © 2018 - 2019 <a href="${pageContext.request.contextPath}">网站前台</a></span>
                    </div>
                </div>
            </form>
        </div>

    </div>
</div>

</body>
</html>
