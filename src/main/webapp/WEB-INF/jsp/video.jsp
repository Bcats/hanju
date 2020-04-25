<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="cn.bcat.hanju.pojo.web.Video" %>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <title>最新韩剧《${video.v_name}》全集高清在线播放_韩剧_高清韩剧网_${webBaseInfo.title}</title>
    <meta name="keywords" content="${video.v_name},电视剧${video.v_name},${video.v_name}全集,${video.v_name}在线播放,${video.v_name}在线下载,${video.v_name}在线观看,${video.v_name}剧情介绍">
    <link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/uaredirect.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/layer.js"></script>
    <script src="${pageContext.request.contextPath}/js/main.js"></script>

</head>
<body>
<div id="topTips"></div>
<%@include file="common/header.jsp"%>
<s:set var="dy" value="电影"/>
<s:set var="hj" value="韩剧"/>
<s:set var="zy" value="综艺"/>
<s:set var="xz" value="下载"/>
<s:set var="bf" value="播放"/>
<div class="warp">
    <div class="container">
        <div class="breadcrumb" mod-skin="m20">
            <a href="${pageContext.request.contextPath}/index">首页</a><span>/</span>
            <a href="${pageContext.request.contextPath}/class/${video.class_name}">${video.class_name}</a><span>/</span>
            <a href="${pageContext.request.contextPath}/video/${video.v_id}"><cite>${video.v_name}</cite></a>
        </div>
        <div class="main-inner" mod-size="w770">

            <div class="albumDetail clearfix">
                <div class="albumDetailMain clearfix">
                    <div class="albumDetailMain-left">
                        <div class="thumb">
                            <a href="${pageContext.request.contextPath}/play/${video.v_id}"
                               title="${video.v_name}" class="thumb-link" target="_blank">
                                <img class="quic" src="${pageContext.request.contextPath}/${video.imgurl}" width="200" alt="${video.v_name}">
                                <span class="label">${video.status}</span>
                            </a>
                        </div>
                        <div class="detail-share bdsharebuttonbox">
                            <span>分享:</span>
                            <a href="#" class="item qq" data-cmd="sqq" title="分享到QQ好友"></a>
                            <a href="#" class="item sina" data-cmd="tsina" title="分享到新浪微博"></a>
                            <a href="#" class="item douban" data-cmd="douban" title="分享到豆瓣网"></a>
                            <a href="#" class="item weixin" data-cmd="weixin" title="分享到微信"></a>
                            <a href="#" class="item qzone" data-cmd="qzone" title="分享到QQ空间"></a>
                            <a href="#" class="item more bds_more" data-cmd="more"></a>
                        </div>
                    </div>
                    <div class="albumDetailMain-right">
                        <h1 class="title">${video.v_name}</h1>

                        <div class="intro clearfix">
                            <p><label>年代：</label>${video.year}</p>
                            <p><label>导演：</label>${video.director}</p>
                            <p><label>主演：</label>${video.actor}</p>
                            <p class="w50"><label>接档：</label>暂无</p>
                            <%--时间格式转换--%>
                            <%  Video video = (Video) request.getAttribute("video");
                                String updatetime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
                                        .format(video.getUpdatetime());
                            %>
                            <p class="w50"><label>时间：</label><%=updatetime%></p>
                            <p class="w50"><label>类型：</label>${video.class_name}</p>
                            <p class="w50"><label>播放：</label>${video.play} 次</p>
                        </div>

                        <p class="intro-desc item-desc-info"><label class="color-9">简介：</label>${video.detail}</p>

                        <div class="detail-main-btn clearfix">
                            <s:if test="${videoUrlList.get(0).urltype == bf}">
                            <a class="hjtvui-btn hjtvui-btn-radius" href="${pageContext.request.contextPath}/play/${video.v_id}" target="_blank">在线播放</a>
                            </s:if>
                            <s:if test="${videoUrlList.get(0).urltype == xz}">
                                <a class="hjtvui-btn hjtvui-btn-radius" href="${videoUrlList.get(0).url}" target="_blank">立即下载</a>
                            </s:if>
                            <%--<a class="hjtvui-btn hjtvui-btn-primary hjtvui-btn-radius" onclick="__goDiv('comment')">评论</a>
                            <a class="hjtvui-btn hjtvui-btn-primary hjtvui-btn-radius" onclick="favorite('video','2923');"><span class="favorites_tate">收藏</span></a>--%>
                        </div>
                    </div>
                </div>
            </div>


            <s:if test="${video.class_name == hj || video.class_name == zy || video.class_name== dy}">


                <div class="mod-inner mt20" mod-skin="p25">
                    <div class="mod-inner-head">
                        <div class="title" mod-skin="line">剧集</div>
                        <a class="pull-right" href="http://wpa.qq.com/msgrd?V=3&uin=205672513" target="_blank">报错</a>
                    </div>
                    <div class="mod-main">
                        <div class="detailList-select-wrap mt20">
                            <ul class="juji-list clearfix">
                                <s:forEach items="${videoUrlList}" var="videourl">
                                <li><a target="_blank"
                                       href="${pageContext.request.contextPath}/play/${videourl.v_id}?url_id=${videourl.url_id}">
                                        ${videourl.urlname}</a></li>
                                </s:forEach>
                            </ul>
                        </div>
                    </div>
                </div>

            </s:if>



            <%--<div id="comment" class="mod-inner mt20" mod-skin="p25">
                <div class="mod-inner-head">
                    <div class="title" mod-skin="line">评论区</div>
                </div>
                <div class="mod-main">
                    <div class="alert alert-danger mt20 mb0 text-c" role="alert">
                        <strong>提示：</strong>评论区关闭升级中
                    </div>
                </div>
            </div>--%>

        </div>
        <div class="mian-sidebar" mod-size="w330">


           <%-- <div class="slide-grid" mod-skin="p2015">
                <div class="slide-grid-head">
                    <span class="title" mod-skin="line">正在播出</span>
                </div>
                <div class="slide-grid-main">
                    <div class="Preview mt15">
                        <div id="Scroll" class="mod-main">
                            <ul class="clearfix">
                                <li><span><a href="/hanju/7281.html" title="明日也晴朗" target="_blank">明日也晴朗</a></span><em>更新至108集</em></li>
                                <li><span><a href="/hanju/7292.html" title="Life" target="_blank">Life</a></span><em>已完结</em></li>
                                <li><span><a href="/hanju/7249.html" title="富家公子" target="_blank">富家公子</a></span><em>更新至100集</em></li>
                                <li><span><a href="/hanju/7293.html" title="虽然30但仍17" target="_blank">虽然30但仍17</a></span><em>已完结</em></li>
                                <li><span><a href="/hanju/7219.html" title="快乐姐妹们/Happy Sisters" target="_blank">快乐姐妹们/Happy Sisters</a></span><em>更新至120集</em></li>
                                <li><span><a href="/hanju/7254.html" title="情妇" target="_blank">情妇</a></span><em>更新至12集</em></li>
                                <li><span><a href="/hanju/7286.html" title="一起用餐吧3" target="_blank">一起用餐吧3</a></span><em>更新至14集</em></li>
                                <li><span><a href="/hanju/7250.html" title="上门丈夫吴作斗" target="_blank">上门丈夫吴作斗</a></span><em>更新至24集</em></li>
                                <li><span><a href="/hanju/7247.html" title="经常请吃饭的漂亮姐姐" target="_blank">经常请吃饭的漂亮姐姐</a></span><em>已完结</em></li>
                                <li><span><a href="/hanju/7243.html" title="一起生活吧" target="_blank">一起生活吧</a></span><em>更新至50集</em></li>
                                <li><span><a href="/hanju/7255.html" title="我们遇见的奇迹" target="_blank">我们遇见的奇迹</a></span><em>已完结</em></li>
                                <li><span><a href="/hanju/7248.html" title="致忘记诗的你" target="_blank">致忘记诗的你</a></span><em>更新至16集</em></li>
                                <li><span><a href="/hanju/7253.html" title="Switch-改变世界" target="_blank">Switch-改变世界</a></span><em>更新至32集</em></li>
                                <li><span><a href="/hanju/7236.html" title="波浪啊波浪啊" target="_blank">波浪啊波浪啊</a></span><em>更新至143集</em></li>
                                <li><span><a href="/hanju/7256.html" title="金装律师" target="_blank">金装律师</a></span><em>更新至16集</em></li>
                                <li><span><a href="/hanju/7216.html" title="前世的冤家们" target="_blank">前世的冤家们</a></span><em>更新至123集</em></li>
                                <li><span><a href="/hanju/7235.html" title="加油吧威基基" target="_blank">加油吧威基基</a></span><em>已完结</em></li>
                                <li><span><a href="/hanju/7246.html" title="善良魔女传" target="_blank">善良魔女传</a></span><em>更新至40集</em></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>--%>



        </div>
    </div>
</div>




<div class="honey-feedback-floatbtn clearfix">
    <ul class="honey-feedback-list">

        <li class="backtop">
            <a href="javascript:;" onclick="__goTop();"><span class=""></span><span class="txt">顶部</span></a>
        </li>
    </ul>
</div>

<%@include file="common/footer.jsp"%>
<div class="dialog-tip">
    <span class="tip-content"></span>
</div>
<div id="bottomTips"></div>

</body>
</html>