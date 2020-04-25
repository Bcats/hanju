<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="common/head.jsp"%>
</head>
<body>
<div class="wrapper">
    <%@include file="common/header.jsp"%>
    <s:set var="user" value="active"/>
    <%@include file="common/sidebar.jsp"%>
    <div class="main-panel">
        <%@include file="user-panel.jsp"%>
        <%@include file="common/footer.jsp"%>
    </div>
</div>
</div>

</body>
<%@include file="common/script.jsp"%>
</html>
