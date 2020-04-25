<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <title>好看的韩剧大全_热门韩剧排行榜_${webBaseInfo.title}</title>
    <meta name="keywords" content="${webBaseInfo.keywords}">
    <meta name="description" content="${webBaseInfo.description}">
    <link href="${pageContext.request.contextPath}/css/common.css?1" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/main.css?1" rel="stylesheet">

</head>
<body>
<div id="topTips"></div>
<%@include file="common/header.jsp"%>
<div class="warp">
    <div class="container mt20">
        <div class="main-inner">
            <div class="mod-inner" mod-skin="p25">
                <div class="classifyWarp">
                    <div class="classifyList">
                        <div class="classifyType">
                            <h5 class="u-title">分类：</h5>
                            <ul>
                                <li>
                                <a <s:if test="${checked_class == 'hj'}">class="active" </s:if>
                                        href="${pageContext.request.contextPath}/class/hj" rel="nofollow">韩剧</a>
                                </li>

                                <li>
                                <a <s:if test="${checked_class == 'zy'}">class="active" </s:if>
                                        href="${pageContext.request.contextPath}/class/zy" rel="nofollow">综艺</a>
                                </li>
                                <li>
                                <a <s:if test="${checked_class == 'dy'}">class="active" </s:if>
                                        href="${pageContext.request.contextPath}/class/dy" rel="nofollow">电影</a>
                                </li>
                            </ul>
                        </div>
                        <div class="classifyType">
                            <h5 class="u-title">年份：</h5>
                            <ul class="clearfix">
                                <li><a <s:if test="${year=='all'}">class="active"</s:if> href="${pageContext.request.contextPath}/class/${checked_class}" rel="nofollow">全部</a></li>
                                <li><a <s:if test="${year=='2019'}">class="active"</s:if> href="${pageContext.request.contextPath}/class/${checked_class}/2019" rel="nofollow">2019</a></li>
                                <li><a <s:if test="${year=='2018'}">class="active"</s:if> href="${pageContext.request.contextPath}/class/${checked_class}/2018" rel="nofollow">2018</a></li>
                                <li><a <s:if test="${year=='2017'}">class="active"</s:if> href="${pageContext.request.contextPath}/class/${checked_class}/2017" rel="nofollow">2017</a></li>
                                <li><a <s:if test="${year=='2016'}">class="active"</s:if> href="${pageContext.request.contextPath}/class/${checked_class}/2016" rel="nofollow">2016</a></li>

                                <li><a <s:if test="${year=='before'}">class="active"</s:if> href="${pageContext.request.contextPath}/class/${checked_class}/before" rel="nofollow">更早</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="mod-main">
                    <div class="m-list-inner">
                        <ul class="m-list" m-list-skin="small-film" mod-width="w740">
                            <s:forEach items="${pageInfo.list}" var="iclassL">
                            <li class="m-item">
                                <a class="thumb" href="${pageContext.request.contextPath}/video/${iclassL.v_id}" title="${iclassL.v_name}" target="_blank">
                                    <img class="quic lazy" src="${pageContext.request.contextPath}/${iclassL.imgurl}" data-original="">
                                </a>
                                <div class="text">
                                    <h3 class="title ellipsis-1">
                                        <a href="${pageContext.request.contextPath}/video/${iclassL.v_id}" title="${iclassL.v_name}" target="_blank">${iclassL.v_name}</a></h3>
                                    <p class="des">${iclassL.actor}</p>
                                </div>
                            </li>
                            </s:forEach>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="mod-pagination">
                <ul class="clearfix">
                    <s:if test="${pageInfo.pages > 5}">
                    <li><a href="${pageContext.request.contextPath}/class/${checked_class}?page=1"
                           data-ci-pagination-page="1" rel="start">第一页</a></li>
                    </s:if>
                    <s:forEach items="${pageInfo.navigatepageNums}" var="page_num">

                            <s:if test="${page_num == pageInfo.pageNum}">

                            <li class="page-active"><a>${page_num}</a></li>
                            </s:if>

                            <s:if test="${page_num != pageInfo.pageNum}">
                            <li><a href="${pageContext.request.contextPath}/class/${checked_class}/?page=${page_num}"
                                   data-ci-pagination-page="${page_num}" rel="start">${page_num}</a></li>
                            </s:if>

                    </s:forEach>
                    <s:if test="${pageInfo.hasNextPage}">
                    <li><a href="/${pageContext.request.contextPath}/class/${checked_class}?page=${page_num + 1}" data-ci-pagination-page="2" rel="next">下一页</a></li>
                    </s:if>
                    <s:if test="${pageInfo.pages > 5}">
                    <li><a href="${pageContext.request.contextPath}/class/${checked_class}?page=${pageInfo.pages}"
                           data-ci-pagination-page="${pageInfo.pages}">最后一页</a></li>
                    </s:if>

                </ul>
            </div>
        </div>
       <%-- <div class="mian-sidebar">
            <div class="slide-grid mb16">

            </div>
            <div class="slide-grid mt20" mod-skin="p2015">
                <div class="slide-grid-head">
                    <span class="title" mod-skin="line">韩剧人气排行榜</span>
                </div>
                <div class="slide-grid-main">
                    <div class="rank mt16">
                        <ul class="rank-list">
                            <li><i class="num num1">1</i><b><a href="/hanju/7247.html" title="经常请吃饭的漂亮姐姐" target="_blank">经常请吃饭的漂亮姐姐 在线观看</a></b></li>
                            <li><i class="num num2">2</i><b><a href="/hanju/2923.html" title="当你沉睡时" target="_blank">当你沉睡时 在线观看</a></b></li>
                            <li><i class="num num3">3</i><b><a href="/hanju/7210.html" title="花游记" target="_blank">花游记 在线观看</a></b></li>
                            <li><i class="num num4">4</i><b><a href="/hanju/2620.html" title="孤单又灿烂的神-鬼怪" target="_blank">孤单又灿烂的神-鬼怪 在线观看</a></b></li>
                            <li><i class="num num5">5</i><b><a href="/hanju/2603.html" title="蓝色大海的传说" target="_blank">蓝色大海的传说 在线观看</a></b></li>
                            <li><i class="num num6">6</i><b><a href="/hanju/7272.html" title="金秘书为何那样" target="_blank">金秘书为何那样 在线观看</a></b></li>
                            <li><i class="num num7">7</i><b><a href="/hanju/2633.html" title="翡翠恋人" target="_blank">翡翠恋人 在线观看</a></b></li>
                            <li><i class="num num8">8</i><b><a href="/hanju/7287.html" title="我的ID是江南美人" target="_blank">我的ID是江南美人 在线观看</a></b></li>
                            <li><i class="num num9">9</i><b><a href="/hanju/2445.html" title="来自星星的你" target="_blank">来自星星的你 在线观看</a></b></li>
                            <li><i class="num num10">10</i><b><a href="/hanju/2486.html" title="继承者们" target="_blank">继承者们 在线观看</a></b></li>
                            <li><i class="num num11">11</i><b><a href="/hanju/7318.html" title="内在美" target="_blank">内在美 在线观看</a></b></li>
                            <li><i class="num num12">12</i><b><a href="/hanju/7233.html" title="Misty" target="_blank">Misty 在线观看</a></b></li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="slide-grid mt20" mod-skin="p2015">
                <div class="slide-grid-head">
                    <span class="title" mod-skin="line">韩剧好评排行榜</span>
                </div>
                <div class="slide-grid-main">
                    <div class="rank mt16">
                        <ul class="rank-list">
                            <li><i class="num num1">1</i><b><a href="/hanju/7272.html" title="金秘书为何那样" target="_blank">金秘书为何那样 在线观看</a></b></li>
                            <li><i class="num num2">2</i><b><a href="/hanju/2923.html" title="当你沉睡时" target="_blank">当你沉睡时 在线观看</a></b></li>
                            <li><i class="num num3">3</i><b><a href="/hanju/2620.html" title="孤单又灿烂的神-鬼怪" target="_blank">孤单又灿烂的神-鬼怪 在线观看</a></b></li>
                            <li><i class="num num4">4</i><b><a href="/hanju/7247.html" title="经常请吃饭的漂亮姐姐" target="_blank">经常请吃饭的漂亮姐姐 在线观看</a></b></li>
                            <li><i class="num num5">5</i><b><a href="/hanju/2603.html" title="蓝色大海的传说" target="_blank">蓝色大海的传说 在线观看</a></b></li>
                            <li><i class="num num6">6</i><b><a href="/hanju/7266.html" title="汉谟拉比小姐" target="_blank">汉谟拉比小姐 在线观看</a></b></li>
                            <li><i class="num num7">7</i><b><a href="/hanju/7210.html" title="花游记" target="_blank">花游记 在线观看</a></b></li>
                            <li><i class="num num8">8</i><b><a href="/hanju/7260.html" title="武法律师" target="_blank">武法律师 在线观看</a></b></li>
                            <li><i class="num num9">9</i><b><a href="/hanju/7245.html" title="我的大叔" target="_blank">我的大叔 在线观看</a></b></li>
                            <li><i class="num num10">10</i><b><a href="/hanju/7263.html" title="过来抱抱我 " target="_blank">过来抱抱我 在线观看</a></b></li>
                            <li><i class="num num11">11</i><b><a href="/hanju/2486.html" title="继承者们" target="_blank">继承者们 在线观看</a></b></li>
                            <li><i class="num num12">12</i><b><a href="/hanju/7211.html" title="机智的监狱生活" target="_blank">机智的监狱生活 在线观看</a></b></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>--%>
    </div>
</div>

<%@include file="common/footer.jsp"%>

</body>
</html>