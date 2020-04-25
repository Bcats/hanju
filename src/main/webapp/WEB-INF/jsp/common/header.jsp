<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header class="header-wrap">
    <div class="header-inner">
        <div class="head-bar clearfix">
            <div class="logo-warp">
                <a href="${pageContext.request.contextPath}/index">
                    <img src="${pageContext.request.contextPath}/${webBaseInfo.logo}" alt="" height="45px"/></a>
            </div>
            <div class="nav-bar-menu pull-left">
                <ul class="clearfix">

                    <s:if test="${click_status != 'index'}"><li></s:if><s:if test="${click_status == 'index'}">
                        <li class="nav-bar-active"></s:if>
                        <a class="item" href="${pageContext.request.contextPath}/index">首页</a></li>

                    <s:if test="${checked_class != 'hj'}"><li></s:if><s:if test="${checked_class == 'hj'}"><li class="nav-bar-active"></s:if>
                        <a class="item" href="${pageContext.request.contextPath}/class/hj">韩剧</a></li>

                    <s:if test="${checked_class != 'zy'}"><li></s:if><s:if test="${checked_class == 'zy'}"><li class="nav-bar-active"></s:if>
                        <a class="item" href="${pageContext.request.contextPath}/class/zy">综艺</a></li>

                    <s:if test="${checked_class != 'dy'}"><li></s:if><s:if test="${checked_class == 'dy'}"><li class="nav-bar-active"></s:if>
                    <a class="item" href="${pageContext.request.contextPath}/class/dy">电影</a></li>
                    <%--<li><a class="item" href="#">视频</a></li>
                    <li class="hot"><a class="item" href="#">资讯</a></li>
                    <li class="hot"><a class="item" href="#">榜单</a></li>--%>
                </ul>
            </div>
            <%@include file="so_input.jsp"%>
            <div id="member_info" class="head-right pull-right"></div>
        </div>
    </div>
</header>
