<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>403-无权限</title>
</head>
<body>
没有权限！5秒后自动跳转上一页！
<script type="text/javascript">setTimeout("history.go(-1)", 5000);  </script>
<%--<script type="javascript">
    function go()
    {
        window.history.go(-1);
    }
    setTimeout("go()",5000);
</script>--%>
</body>
</html>
