<%@ page import="cn.bcat.hanju.util.IString" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="iu" uri="http://www.bcat.com/iutils" %>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <title>${so_keyword}_影视_${webBaseInfo.title}</title>
    <meta name="keywords" content="${so_keyword}">
    <meta name="description" content="${webBaseInfo.description}">
    <link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet">

</head>
<div id="topTips"></div>
<%@include file="common/header.jsp"%>
<div class="warp">
    <div class="container mt20">
        <div class="mod-search-head">
            <ul class="clearfix">
                <s:if test="${choose_status=='全部'}"><li class="active"></s:if>
                <s:if test="${choose_status!='全部'}"><li></s:if>
                    <a href="${pageContext.request.contextPath}/s?wd=${so_keyword}">
                        全部(${soList.size()})</a>
                </li>
                <s:if test="${choose_status=='韩剧'}"><li class="active"></s:if>
                <s:if test="${choose_status!='韩剧'}"><li></s:if>
                    <a href="${pageContext.request.contextPath}/s?c_name=韩剧&wd=${so_keyword}">
                        韩剧(${soList.get(soList.size()-1).hj})</a>
                </li>
                <s:if test="${choose_status=='综艺'}"><li class="active"></s:if>
                <s:if test="${choose_status!='综艺'}"><li></s:if>
                    <a href="${pageContext.request.contextPath}/s?c_name=综艺&wd=${so_keyword}">
                    综艺(${soList.get(soList.size()-1).zy})</a>
                </li>
                <s:if test="${choose_status=='电影'}"><li class="active"></s:if>
                <s:if test="${choose_status!='电影'}"><li></s:if>
                    <a href="${pageContext.request.contextPath}/s?c_name=电影&wd=${so_keyword}">
                    电影(${soList.get(soList.size()-1).dy})</a>
                </li>
            </ul>
        </div>
        <div class="main-inner mt20" mod-width="w770">
            <div class="mod-search-list">
                <div class="mod-search-box clearfix">
                    
                    <s:if test="${soListByClass==null}">
                    <s:set var="items" value="${soList}"/>
                    </s:if>
                    <s:if test="${soListByClass!=null}">
                    <s:set var="items" value="${soListByClass}"/>
                    </s:if>

                    <s:forEach items="${items}" var="soL">
                    <div class="item film-item">
                        <a class="thumb" href="${pageContext.request.contextPath}/video/${soL.v_id}" target="_blank">
                            <img class="quic lazy" src="${soL.imgurl}" data-original="images/58c145164bc49.jpg" alt="${soL.v_name}">
                            <div class="icon-tl">
                                <s:if test="${soL.class_name=='韩剧'}">
                                <i class="tips hanju">韩剧</i>
                                </s:if>
                                <s:if test="${soL.class_name=='综艺'}">
                                    <i class="tips zongyi">综艺</i>
                                </s:if>
                                <s:if test="${soL.class_name=='电影'}">
                                    <i class="tips dianying">电影</i>
                                </s:if>
                            </div>
                        </a>
                        <div class="text">
                            <h3 class="title ellipsis-1">
                                <a href="${pageContext.request.contextPath}/video/${soL.v_id}" title="${soL.v_name}" target="_blank">
                                ${iu:urlEncode(so_keyword, soL.v_name)}</a>
                            </h3>
                            <div class="des">
                                <p><label>年代：</label>${soL.year}</p>
                                <p class="w50"><label>导演：</label>${soL.director}</p>
                                <p class="w50"><label>状态：</label>${soL.status}</p>
                                <p class="ellipsis-2"><label>主演：</label>${soL.actor}</p>
                                <p class="ellipsis-2"><label>简介：</label>${soL.detail}</p>
                            </div>
                            <a class="hjtvui-btn hjtvui-btn-radius"
                               href="${pageContext.request.contextPath}/play/${soL.v_id}" target="_blank">立即播放</a>
                        </div>
                    </div>
                    </s:forEach>

                </div>
            </div>

            <div class="mod-pagination">
                <ul class="clearfix">
                </ul>
            </div>

        </div>
        <div class="mian-sidebar mt20" mod-size="w330">

            <%--<div class="slide-grid" mod-skin="p2015">
                <div class="slide-grid-head">
                    <span class="title" mod-skin="line">最新资讯</span>
                </div>
                <div class="slide-grid-main">
                    <div class="modRlist">
                        <ul class="clearfix">
                            <li>
                                <a class="thumb" href="/news/dianying/5169.html" title="李政宰、朴正民新片《裟婆诃》蝉联韩国票房冠军" target="_blank">
                                    <img class="quic" src="images/blank.png" data-echo="https://1img.hanjutv.com/201902/a0c81b2f05.jpg">
                                </a>
                                <div class="text">
                                    <h3 class="title ellipsis-2"><a href="/news/dianying/5169.html" title="李政宰、朴正民新片《裟婆诃》蝉联韩国票房冠军" target="_blank">李政宰、朴正民新片《裟婆诃》蝉联韩国票房冠军</a></h3>
                                    <div class="info">
                                        <span>1天前</span>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <a class="thumb" href="/news/hanju/5167.html" title="崔振赫、孙贤周 有望合作主演KBS新剧《Justice》" target="_blank">
                                    <img class="quic" src="images/blank.png" data-echo="https://1img.hanjutv.com/201902/c6060a640e.jpg">
                                </a>
                                <div class="text">
                                    <h3 class="title ellipsis-2"><a href="/news/hanju/5167.html" title="崔振赫、孙贤周 有望合作主演KBS新剧《Justice》" target="_blank">崔振赫、孙贤周 有望合作主演KBS新剧《Justice》</a></h3>
                                    <div class="info">
                                        <span>1天前</span>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <a class="thumb" href="/news/tupian/5168.html" title="丁海寅拍户外汽车写真 气质干练精英感十足" target="_blank">
                                    <img class="quic" src="images/blank.png" data-echo="https://1img.hanjutv.com/201902/1f9425bbdb.jpg">
                                </a>
                                <div class="text">
                                    <h3 class="title ellipsis-2"><a href="/news/tupian/5168.html" title="丁海寅拍户外汽车写真 气质干练精英感十足" target="_blank">丁海寅拍户外汽车写真 气质干练精英感十足</a></h3>
                                    <div class="info">
                                        <span>1天前</span>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <a class="thumb" href="/news/hanju/5161.html" title="韩国演员张赫确定出演JTBC新剧《我的国家》" target="_blank">
                                    <img class="quic" src="images/blank.png" data-echo="https://1img.hanjutv.com/201902/cec715f877.jpg">
                                </a>
                                <div class="text">
                                    <h3 class="title ellipsis-2"><a href="/news/hanju/5161.html" title="韩国演员张赫确定出演JTBC新剧《我的国家》" target="_blank">韩国演员张赫确定出演JTBC新剧《我的国家》</a></h3>
                                    <div class="info">
                                        <span>2天前</span>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="slide-grid mt16" mod-skin="p2015">
                <div class="slide-grid-head">
                    <span class="title" mod-skin="line">正在播出</span>
                </div>
                <div class="slide-grid-main">
                    <div class="Preview mt15">
                        <div id="Scroll" class="mod-main">
                            <ul class="clearfix">
                                <li><span><a href="/hanju/7292.html" title="Life" target="_blank">Life</a></span><em>已完结</em></li>
                                <li><span><a href="/hanju/7253.html" title="Switch-改变世界" target="_blank">Switch-改变世界</a></span><em>更新至32集</em></li>
                                <li><span><a href="/hanju/7255.html" title="我们遇见的奇迹" target="_blank">我们遇见的奇迹</a></span><em>已完结</em></li>
                                <li><span><a href="/hanju/7250.html" title="上门丈夫吴作斗" target="_blank">上门丈夫吴作斗</a></span><em>更新至24集</em></li>
                                <li><span><a href="/hanju/7249.html" title="富家公子" target="_blank">富家公子</a></span><em>更新至100集</em></li>
                                <li><span><a href="/hanju/7247.html" title="经常请吃饭的漂亮姐姐" target="_blank">经常请吃饭的漂亮姐姐</a></span><em>已完结</em></li>
                                <li><span><a href="/hanju/7236.html" title="波浪啊波浪啊" target="_blank">波浪啊波浪啊</a></span><em>更新至143集</em></li>
                                <li><span><a href="/hanju/7248.html" title="致忘记诗的你" target="_blank">致忘记诗的你</a></span><em>更新至16集</em></li>
                                <li><span><a href="/hanju/7293.html" title="虽然30但仍17" target="_blank">虽然30但仍17</a></span><em>已完结</em></li>
                                <li><span><a href="/hanju/7219.html" title="快乐姐妹们/Happy Sisters" target="_blank">快乐姐妹们/Happy Sisters</a></span><em>更新至120集</em></li>
                                <li><span><a href="/hanju/7281.html" title="明日也晴朗" target="_blank">明日也晴朗</a></span><em>更新至121集</em></li>
                                <li><span><a href="/hanju/7286.html" title="一起用餐吧3" target="_blank">一起用餐吧3</a></span><em>更新至14集</em></li>
                                <li><span><a href="/hanju/7254.html" title="情妇" target="_blank">情妇</a></span><em>更新至12集</em></li>
                                <li><span><a href="/hanju/7243.html" title="一起生活吧" target="_blank">一起生活吧</a></span><em>更新至50集</em></li>
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
</div>
</body>
</html>