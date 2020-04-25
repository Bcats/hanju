<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <s:if test="${playUrl != null}">
    <title>《${play.v_name}》<s:if test="${playUrl.urlname.indexOf('第')==-1}">第${playUrl.urlname}集</s:if>
            <s:if test="${playUrl.urlname.indexOf('第')!=-1}">${playUrl.urlname}</s:if>_高清在线播放_韩剧_热播韩剧网_${webBaseInfo.title}</title>
        <meta name="description" content="为您提供《${play.v_name}》${playUrl.urlname}在线播放资源，更多好看高清韩国电视剧，尽在${webBaseInfo.title}">
    </s:if>
    <s:if test="${playUrl == null}">
        <title>《${play.v_name}》<s:if test="${playUrlList.get(0).urlname.indexOf('第')==-1}">第${playUrlList.get(0).urlname}集</s:if>
                <s:if test="${playUrlList.get(0).urlname.indexOf('第')!=-1}">${playUrlList.get(0).urlname}</s:if>_高清在线播放_韩剧_热播韩剧网_${webBaseInfo.title}</title>
        <meta name="description" content="为您提供《${play.v_name}》${playUrlList.get(0).urlname}在线播放资源，更多好看高清韩国电视剧，尽在${webBaseInfo.title}">
    </s:if>
    <meta name="keywords" content="${play.v_name}">

    <link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/DPlayer.min.css">
    <script src="${pageContext.request.contextPath}/hls.min.js"></script>
    <script src="${pageContext.request.contextPath}/DPlayer.min.js"></script>
</head>
<body class="headerv2">
<div id="topTips"></div>
<%@include file="common/header.jsp"%>
<div class="warp">
    <div class="playWarp">
        <div class="playArea">
            <div class="playMain" mod-type="tv">

                <div class="playBox">
                    <s:if test="${playUrl != null}">
                    <iframe id="playPath" width="100%" height="100%"
                            src="${pageContext.request.contextPath}/player?playurl=${playUrl.url}" frameborder="0"
                            allowfullscreen="allowfullscreen"
                            mozallowfullscreen="mozallowfullscreen"
                            msallowfullscreen="msallowfullscreen"
                            oallowfullscreen="oallowfullscreen"
                            webkitallowfullscreen="webkitallowfullscreen" scrolling="no"></iframe>

                    </s:if>

                    <s:if test="${playUrl == null}">
                        <iframe id="playPath" width="100%" height="100%"
                                src="${pageContext.request.contextPath}/player?playurl=${playUrlList.get(0).url}" frameborder="0"
                                allowfullscreen="allowfullscreen"
                                mozallowfullscreen="mozallowfullscreen"
                                msallowfullscreen="msallowfullscreen"
                                oallowfullscreen="oallowfullscreen"
                                webkitallowfullscreen="webkitallowfullscreen" scrolling="no"></iframe>

                    </s:if>
                </div>




                <%--<div class="playSlider">
                    <div id="playScroll" class="playScroll">
                        <div class="playScrollMain">

                            <s:forEach items="${playUrlList}" var="playUrlL">
                                &lt;%&ndash;传入选中播放url_id&ndash;%&gt;
                                <s:if test="${playUrl !=null }">
                                    <s:if test="${playUrlL.url_id == playUrl.url_id }">
                                    <a class="playLink active" href="${pageContext.request.contextPath}/play.action?v_id=${playUrlL.v_id}&url_id=${playUrlL.url_id}"><i></i>
                                    第${playUrlL.urlname}集</a>
                                    </s:if>

                                    <s:if test="${playUrlL.url_id != playUrl.url_id }">
                                        <a class="playLink" href="${pageContext.request.contextPath}/play.action?v_id=${playUrlL.v_id}&url_id=${playUrlL.url_id}"><i></i>
                                            第${playUrlL.urlname}集</a>
                                    </s:if>
                                </s:if>
                                &lt;%&ndash;没有传入url_id&ndash;%&gt;
                                <s:if test="${playUrl == null}">
                                    <s:if test="${playUrlList.get(0).url_id == playUrlL.url_id}">
                                        <a class="playLink active" href="${pageContext.request.contextPath}/play.action?v_id=${playUrlL.v_id}&url_id=${playUrlL.url_id}"><i></i>
                                            第${playUrlL.urlname}集</a>
                                    </s:if>

                                    <s:if test="${playUrlList.get(0).url_id != playUrlL.url_id}">
                                        <a class="playLink" href="${pageContext.request.contextPath}/play.action?v_id=${playUrlL.v_id}&url_id=${playUrlL.url_id}"><i></i>
                                            第${playUrlL.urlname}集</a>
                                    </s:if>

                                </s:if>
                            </s:forEach>
                        </div>
                    </div>
                </div>--%>
            </div>
            <div class="playInfo">

                <h1><a href="${pageContext.request.contextPath}/video/${play.v_id}" title="${play.v_name}" target="_blank"><span class="drama-name">${play.v_name}</span></a>
                    <s:if test="${playUrl != null}">
                        <s:if test="${playUrl.urlname.indexOf('第')!=-1}">
                            <span>&nbsp;&nbsp;${playUrl.urlname}</span>
                        </s:if>
                        <s:if test="${playUrl.urlname.indexOf('第')==-1}">
                            <span>&nbsp;&nbsp;第${playUrl.urlname}集</span>
                        </s:if>

                    </s:if>
                    <s:if test="${playUrl == null}">
                        <s:if test="${playUrl.urlname.indexOf('第')!=-1}">
                            <span>&nbsp;&nbsp;${playUrl.urlname}</span>
                        </s:if>
                        <s:if test="${playUrl.urlname.indexOf('第')==-1}">
                            <span>&nbsp;&nbsp;第${playUrl.urlname}集</span>
                        </s:if>
                    </s:if>
                    <i class="state ing"></i></h1>
                <div class="info-list">
                    <ul>
                        <li>
                            <b>${play.status}</b>
                        </li>
                        <li>
                            <b>导演：</b>
                            <span>${play.director}</span>
                        </li>
                        <li>
                            <b>主演：</b>
                            <span class="ellipsis-1">${play.actor}</span>
                        </li>
                    </ul>
                </div>

                <div class="mod-inner mt20" mod-skin="p25">
                    <div class="mod-inner-head">
                        <div class="title" mod-skin="line">选集</div>
                        <a class="pull-right" href="http://wpa.qq.com/msgrd?V=3&uin=205672513" target="_blank">报错</a>&nbsp;&nbsp;
                        <a class="pull-right" href="http://wpa.qq.com/msgrd?V=3&uin=205672513" target="_blank">求片</a>
                    </div>
                    <div class="mod-main">
                        <div class="detailList-select-wrap mt20">
                            <ul class="juji-list clearfix">
                                <s:forEach items="${playUrlList}" var="play_url" varStatus="i">
                                    <s:if test="${playUrl == null}">
                                    <li><a <s:if test="${i.index == 0}"> style="background-color: #2F54EB;color: #fff;" </s:if>href="${pageContext.request.contextPath}/play/${play_url.v_id}?url_id=${play_url.url_id}">
                                            ${play_url.urlname}</a></li>
                                    </s:if>

                                    <s:if test="${playUrl != null}">
                                        <li><a <s:if test="${play_url.url_id == playUrl.url_id}" >style="background-color: #2F54EB;color: #fff;"</s:if> href="${pageContext.request.contextPath}/play/${play_url.v_id}?url_id=${play_url.url_id}">
                                                ${play_url.urlname}</a></li>
                                    </s:if>
                                </s:forEach>
                            </ul>
                        </div>
                    </div>
                </div>

                <%--<div class="playToolbar">
                    <ul>
                        <li>
                            <a>
                                <i class="iconfont icon-vinyl"></i>
                                <span class="label">播放源</span>
                            </a>
                            <div class="extend">
                                <em class="arrow"></em>
                                <div class="box">
                                    <div id="Pathlist" class="btn-main">
                                        <span class="active" onclick="_switchSource('96b8zCROyo3YteMWZuPQ7UfOINQ6NKzvtoJIGSR45JwtgGD900K2g8n50McraFZedwfSUIRoASRXGsWWm%2BloMyy9Ar7henta6veJs3Zowl4fqhKsOJMBhr4wO%2B3jatLbBGgBqhw8Ow','在线一')">在线一</span>
                                        <span class="" onclick="_switchSource('a0f6ZjsumyL431dZXaEwX3lCfeL597iceV5KwUoNApBLUaLDpd5Z71jdi7k3wAGRVmkecLKVY0%2BckuNyDIOks4L4L%2Banv8ANRN0Eg58VVj99kPlYn2vymA','在线二')">在线二</span>
                                        <span class="" onclick="_switchSource('fe25nWnBuZW%2F1PLQtERPyjuqsIqpLmNNMdupkyf9SlAiOi4qxTL3aX2mOspMStuhTBld9IygoIqM1eR6%2BiGHu5ZIc8NH3hDbXnGwfjEi6KOKCbZ7IyyqExkwDfKNnpQjJHsd148','在线三')">在线三</span>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <a onclick="favorite('video','7291');">
                                <i class="iconfont icon-Star"></i>
                                <span class="label favorites_tate">收藏</span>
                            </a>
                        </li>
                        <li>
                            <a>
                                <i class="iconfont icon-share"></i>
                                <span class="label">分享</span>
                            </a>
                        </li>
                        <li>
                            <a>
                                <i class="iconfont icon-bubble"></i>
                                <span class="label">评论</span>
                            </a>
                        </li>
                    </ul>
                </div>--%>
            </div>
        </div>
    </div>
    <%--<div class="container">
        <div class="main-inner" mod-size="w770">

            <div class="mod-inner" mod-skin="p25">
                <div class="mod-inner-head">
                    <div class="title" mod-skin="line">正在热播</div>
                </div>
                <div class="mod-main">
                    <div class="m-list-inner">
                        <ul class="m-list" m-list-skin="small-film" mod-width="w740">
                            <li class="m-item">
                                <a class="thumb" href="/hanju/7247.html" title="经常请吃饭的漂亮姐姐" target="_blank">
                                    <img class="quic lazy" src="images/blank.png" data-original="images/071e39ef13.jpg">
                                    <div class="icon-br"><span class="label">已完结</span></div>
                                </a>
                                <div class="text">
                                    <h3 class="title ellipsis-1"><a href="/hanju/7247.html" title="经常请吃饭的漂亮姐姐" target="_blank">经常请吃饭的漂亮姐姐</a></h3>
                                    <p class="des">主演:孙艺珍，丁海寅</p>
                                </div>
                            </li>
                            <li class="m-item">
                                <a class="thumb" href="/hanju/2923.html" title="当你沉睡时" target="_blank">
                                    <img class="quic lazy" src="images/blank.png" data-original="images/20170903120926785.jpg">
                                    <div class="icon-br"><span class="label">已完结</span></div>
                                </a>
                                <div class="text">
                                    <h3 class="title ellipsis-1"><a href="/hanju/2923.html" title="当你沉睡时" target="_blank">当你沉睡时</a></h3>
                                    <p class="des">主演:李钟硕，裴秀智，李相烨，丁海寅</p>
                                </div>
                            </li>
                            <li class="m-item">
                                <a class="thumb" href="/hanju/7210.html" title="花游记" target="_blank">
                                    <img class="quic lazy" src="images/blank.png" data-original="images/3c43818eee.png">
                                    <div class="icon-br"><span class="label">已完结</span></div>
                                </a>
                                <div class="text">
                                    <h3 class="title ellipsis-1"><a href="/hanju/7210.html" title="花游记" target="_blank">花游记</a></h3>
                                    <p class="des">主演:吴涟序，李弘基，尹宝拉，李昇基</p>
                                </div>
                            </li>
                            <li class="m-item">
                                <a class="thumb" href="/hanju/2603.html" title="蓝色大海的传说" target="_blank">
                                    <img class="quic lazy" src="images/blank.png" data-original="images/58c14a95bb9b8.jpg">
                                    <div class="icon-br"><span class="label">已完结</span></div>
                                </a>
                                <div class="text">
                                    <h3 class="title ellipsis-1"><a href="/hanju/2603.html" title="蓝色大海的传说" target="_blank">蓝色大海的传说</a></h3>
                                    <p class="des">主演:全智贤，李敏镐</p>
                                </div>
                            </li>
                            <li class="m-item">
                                <a class="thumb" href="/hanju/2620.html" title="孤单又灿烂的神-鬼怪" target="_blank">
                                    <img class="quic lazy" src="images/blank.png" data-original="images/58c14b633a61b.jpg">
                                    <div class="icon-br"><span class="label">已完结</span></div>
                                </a>
                                <div class="text">
                                    <h3 class="title ellipsis-1"><a href="/hanju/2620.html" title="孤单又灿烂的神-鬼怪" target="_blank">孤单又灿烂的神-鬼怪</a></h3>
                                    <p class="des">主演:孔刘，金高银，李栋旭，刘仁娜，陆星材，金所炫</p>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="mod-inner mt20" mod-skin="p25">
                <div class="mod-main" id="ad01">
                    <script type="text/javascript" language="javascript" charset="utf-8" src="js/2376596.js"></script>
                </div>
            </div>
            <div id="comment" class="mod-inner mt20" mod-skin="p25">
                <div class="mod-inner-head">
                    <div class="title" mod-skin="line">评论区</div>
                </div>
                <div class="mod-main">
                    <div class="alert alert-danger mt20 mb0 text-c" role="alert">
                        <strong>提示：</strong>评论区关闭升级中
                    </div>
                </div>
            </div>

            <div class="mod-inner mt20" mod-skin="p25">
                <div class="mod-inner-head">
                    <div class="title" mod-skin="line">随便看看</div>
                </div>
                <div class="mod-main">
                    <div class="m-list-inner">
                        <ul class="m-list" m-list-skin="small-film" mod-width="w740">
                            <li class="m-item">
                                <a class="thumb" href="/hanju/2113.html" title="我女儿是瑞英" target="_blank">
                                    <img class="quic lazy" src="images/blank.png" data-original="images/58c141a509200.jpg">
                                    <div class="icon-br"><span class="label">已完结</span></div>
                                </a>
                                <div class="text">
                                    <h3 class="title ellipsis-1"><a href="/hanju/2113.html" title="我女儿是瑞英" target="_blank">我女儿是瑞英</a></h3>
                                    <p class="des">主演:李尚允，李宝英，朴海镇，朴贞雅，千浩振</p>
                                </div>
                            </li>
                            <li class="m-item">
                                <a class="thumb" href="/dianying/850.html" title="大佬传奇" target="_blank">
                                    <img class="quic lazy" src="images/blank.png" data-original="images/58bfda450c2bc.jpg">
                                    <div class="icon-br"><span class="label">预告片</span></div>
                                </a>
                                <div class="text">
                                    <h3 class="title ellipsis-1"><a href="/dianying/850.html" title="大佬传奇" target="_blank">大佬传奇</a></h3>
                                    <p class="des">主演:琴宝罗，郑俊浩，郑素英，孙昌敏</p>
                                </div>
                            </li>
                            <li class="m-item">
                                <a class="thumb" href="/dianying/1185.html" title="我爱你马顺" target="_blank">
                                    <img class="quic lazy" src="images/blank.png" data-original="images/58bfdd76c4ed6.jpg">
                                    <div class="icon-br"><span class="label">预告片</span></div>
                                </a>
                                <div class="text">
                                    <h3 class="title ellipsis-1"><a href="/dianying/1185.html" title="我爱你马顺" target="_blank">我爱你马顺</a></h3>
                                    <p class="des">主演:文素丽，李在应，李汉威，尹珍瑞</p>
                                </div>
                            </li>
                            <li class="m-item">
                                <a class="thumb" href="/hanju/2323.html" title="大长今" target="_blank">
                                    <img class="quic lazy" src="images/blank.png" data-original="images/58c145e6f2abc.jpg">
                                    <div class="icon-br"><span class="label">已完结</span></div>
                                </a>
                                <div class="text">
                                    <h3 class="title ellipsis-1"><a href="/hanju/2323.html" title="大长今" target="_blank">大长今</a></h3>
                                    <p class="des">主演:池珍熙，李英爱，任豪，洪莉娜，朴贞淑</p>
                                </div>
                            </li>
                            <li class="m-item">
                                <a class="thumb" href="/dianying/548.html" title="黄山伐" target="_blank">
                                    <img class="quic lazy" src="images/blank.png" data-original="images/58bfd808b7460.jpg">
                                    <div class="icon-br"><span class="label">预告片</span></div>
                                </a>
                                <div class="text">
                                    <h3 class="title ellipsis-1"><a href="/dianying/548.html" title="黄山伐" target="_blank">黄山伐</a></h3>
                                    <p class="des">主演:朴重勋，郑镇荣，金承佑</p>
                                </div>
                            </li>
                            <li class="m-item">
                                <a class="thumb" href="/dianying/182.html" title="轮回（2003）" target="_blank">
                                    <img class="quic lazy" src="images/blank.png" data-original="images/58bfd53084139.jpg">
                                    <div class="icon-br"><span class="label">预告片</span></div>
                                </a>
                                <div class="text">
                                    <h3 class="title ellipsis-1"><a href="/dianying/182.html" title="轮回（2003）" target="_blank">轮回（2003）</a></h3>
                                    <p class="des">主演:姜受延，Woong-in，Jeong，崔贞允</p>
                                </div>
                            </li>
                            <li class="m-item">
                                <a class="thumb" href="/dianying/946.html" title="在其他的某个地方" target="_blank">
                                    <img class="quic lazy" src="images/blank.png" data-original="images/58bfdb162c416.jpg">
                                    <div class="icon-br"><span class="label">预告片</span></div>
                                </a>
                                <div class="text">
                                    <h3 class="title ellipsis-1"><a href="/dianying/946.html" title="在其他的某个地方" target="_blank">在其他的某个地方</a></h3>
                                    <p class="des">主演:于河俊，车秀妍，朴元尚</p>
                                </div>
                            </li>
                            <li class="m-item">
                                <a class="thumb" href="/dianying/1153.html" title="十七岁的政变" target="_blank">
                                    <img class="quic lazy" src="images/blank.png" data-original="images/58bfdd3a48c2e.jpg">
                                    <div class="icon-br"><span class="label">预告片</span></div>
                                </a>
                                <div class="text">
                                    <h3 class="title ellipsis-1"><a href="/dianying/1153.html" title="十七岁的政变" target="_blank">十七岁的政变</a></h3>
                                    <p class="des">主演:李钟原，李凡秀，Jong-won，Lee，Ju-hie，Lee</p>
                                </div>
                            </li>
                            <li class="m-item">
                                <a class="thumb" href="/hanju/1005436.html" title="秘密森林" target="_blank">
                                    <img class="quic lazy" src="images/blank.png" data-original="images/20170717033429685.jpg">
                                    <div class="icon-br"><span class="label">更新至0集</span></div>
                                </a>
                                <div class="text">
                                    <h3 class="title ellipsis-1"><a href="/hanju/1005436.html" title="秘密森林" target="_blank">秘密森林</a></h3>
                                    <p class="des">主演:曹承佑，裴斗娜，李浚赫，李璟荣，申惠善，刘在明</p>
                                </div>
                            </li>
                            <li class="m-item">
                                <a class="thumb" href="/hanju/1717.html" title="女人花-韩国版" target="_blank">
                                    <img class="quic lazy" src="images/blank.png" data-original="images/58c13c12642d3.jpg">
                                    <div class="icon-br"><span class="label">已完结</span></div>
                                </a>
                                <div class="text">
                                    <h3 class="title ellipsis-1"><a href="/hanju/1717.html" title="女人花-韩国版" target="_blank">女人花-韩国版</a></h3>
                                    <p class="des">主演:郑雄仁，李己雨</p>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="mod-inner mt20" mod-skin="p25">
                <div class="mod-main" id="ad02">
                    <script type="text/javascript" language="javascript" charset="utf-8" src="js/9758998.js"></script>
                </div>
            </div> </div>
        <div class="mian-sidebar" mod-size="w330">

            <div class="slide-grid" mod-skin="p2015">
                <div class="slide-grid-head">
                    <span class="title" mod-skin="line">最新资讯</span>
                </div>
                <div class="slide-grid-main">
                    <div class="modRlist">
                        <ul class="clearfix">
                            <li>
                                <a class="thumb" href="/news/tupian/4955.html" title="金裕贞登杂志演绎秋冬时尚 蜕变轻熟女风" target="_blank">
                                    <img class="quic" src="images/blank.png" data-echo="https://1img.hanjutv.com/201810/d7d09169f6.jpg">
                                </a>
                                <div class="text">
                                    <h3 class="title ellipsis-2"><a href="/news/tupian/4955.html" title="金裕贞登杂志演绎秋冬时尚 蜕变轻熟女风" target="_blank">金裕贞登杂志演绎秋冬时尚 蜕变轻熟女风</a></h3>
                                    <div class="info">
                                        <span>4小时前</span>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <a class="thumb" href="/news/dianying/4956.html" title="韩国CJeS娱乐收购本土最大CG企业 进军电影制作" target="_blank">
                                    <img class="quic" src="images/blank.png" data-echo="https://1img.hanjutv.com/201810/d892258e3b.jpg">
                                </a>
                                <div class="text">
                                    <h3 class="title ellipsis-2"><a href="/news/dianying/4956.html" title="韩国CJeS娱乐收购本土最大CG企业 进军电影制作" target="_blank">韩国CJeS娱乐收购本土最大CG企业 进军电影制作</a></h3>
                                    <div class="info">
                                        <span>4小时前</span>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <a class="thumb" href="/news/dianying/4957.html" title="马东锡《愤怒的黄牛》海报公开 背影健壮有力" target="_blank">
                                    <img class="quic" src="images/blank.png" data-echo="https://1img.hanjutv.com/201810/d36abbd062.jpg">
                                </a>
                                <div class="text">
                                    <h3 class="title ellipsis-2"><a href="/news/dianying/4957.html" title="马东锡《愤怒的黄牛》海报公开 背影健壮有力" target="_blank">马东锡《愤怒的黄牛》海报公开 背影健壮有力</a></h3>
                                    <div class="info">
                                        <span>4小时前</span>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <a class="thumb" href="/news/hanju/4958.html" title="《百日郎君》刷新收视纪录 创tvN月火剧历史新高" target="_blank">
                                    <img class="quic" src="images/blank.png" data-echo="https://1img.hanjutv.com/201810/6a2e1b1947.jpg">
                                </a>
                                <div class="text">
                                    <h3 class="title ellipsis-2"><a href="/news/hanju/4958.html" title="《百日郎君》刷新收视纪录 创tvN月火剧历史新高" target="_blank">《百日郎君》刷新收视纪录 创tvN月火剧历史新高</a></h3>
                                    <div class="info">
                                        <span>4小时前</span>
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
            </div>
        </div>


    </div>--%>
</div>
</div>
</div> </div>
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