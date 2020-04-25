<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>采集</title>
</head>

<body>
<%
    String time = request.getParameter("time");
    String class_name = request.getParameter("class_name");
%>
<a href="${pageContext.request.contextPath}/admin/collecting?time=<%=time%>&class_name=<%=class_name%>">采集</a>
<br>
${msg}
<br>
<a href="${pageContext.request.contextPath}/admin/collection">返回</a>


</body>
</html>
