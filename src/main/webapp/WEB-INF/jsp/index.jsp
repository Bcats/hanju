<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
 <meta charset="utf-8" />
 <title>${webBaseInfo.title}-${webBaseInfo.sencond_title}</title>
 <meta name="keywords" content="${webBaseInfo.keywords}" />
 <meta name="description" content="${webBaseInfo.description}" />

 <link href="css/common.css?20180528v11" rel="stylesheet" />
 <link href="css/main.css?20180528v11" rel="stylesheet" />
 <link href="css/jq22.css" rel="stylesheet" />
 <script src="js/jquery.min.js"></script>
 <script type="text/javascript" src="js/jquery.SuperSlide.js"></script>

</head>
<body>
<div id="topTips"></div>
<%@include file="common/header.jsp"%>
<div class="warp">
 <div class="container">
  <div class="mod mt20"  mod-skin="p20">

   <div class="m-slide" style="margin:0px auto">
    <s:if test="${slides.size()!=0}">
    <ul class="img" style="position: relative; width: 887px; height: 400px;">
     <s:forEach items="${slides}" var="slide">
     <li style="position: absolute; width: 887px; left: 0px; top: 0px; display: list-item;">
      <a href="${pageContext.request.contextPath}/video/${slide.v_id}" target="_blank">
       <%--<img src="${slide.slideimg}">--%>
        <div style="width: 887px; height: 100%; background:url(${slide.slideimg}) no-repeat;background-size: cover;background-position:center;overflow:hidden; ">
        </div>
      </a>
     </li>
     </s:forEach>
    </ul>
    <ul class="tab">

     <s:set var="index" value="0"></s:set>
     <s:forEach items="${slides}" var="slide" >
     <s:if test="${index=='0'}">
      <li class="on">
       <a href="${pageContext.request.contextPath}/video.action/${slides.get(0).v_id}">
        <b></b> <span class="title">${slides.get(0).v_name}</span></a>
      </li>
     </s:if>
      <s:if test="${index=='1'}">
       <li><a href="${pageContext.request.contextPath}/video.action/${slide.v_id}">
        <b></b><span class="title">${slide.v_name}</span></a></li>
      </s:if>
      <s:set var="index" value="1"></s:set>
     </s:forEach>
    </ul>
    </s:if>
   </div>
   <script type="text/javascript">jQuery(".m-slide").slide({ titCell:".tab li", mainCell:".img",effect:"fold", autoPlay:true});</script>


  </div>

  <!--追剧-->
  <div class="mod slideTab mt20" mod-skin="p20">
   <div class="mod-head clearfix">
    <div class="title" mod-skin="line">
     追剧
    </div>
    <!--<div class="mod-author-list hd">
     <ul class="clearfix">
      <li class="active">今日更新</li>
      <li>即将开播</li>
      <li>正在热播</li>
     </ul>
    </div>-->
    <a class="pull-right" href="${pageContext.request.contextPath}/class/hj">更多</a>
   </div>
   <div class="mod-main bd">
    <div class="m-list-inner">
     <ul class="m-list" m-list-skin="film" mod-width="w1100">
      <s:forEach items="${tvLatest}" var="tvL">

       <li class="m-item">
        <a class="thumb" href="${pageContext.request.contextPath}/video/${tvL.v_id}" target="_blank" title="${tvL.v_name}">
         <img class="quic lazy" src="${tvL.imgurl}" data-original=""/>
         <div class="icon-br">
          <span class="label">${tvL.status}</span>
         </div>
        </a>
        <div class="text">
         <h3 class="title ellipsis-1">
          <a href="${pageContext.request.contextPath}/video/${tvL.v_id}" title="${tvL.v_name}" target="_blank">${tvL.v_name}</a>
         </h3>
         <p class="des">主演:${tvL.actor}</p>
        </div>
       </li>

      </s:forEach>
     </ul>
    </div>
   </div>
  </div>

  <div class="mod slideTab mt20" mod-skin="p20">
   <div class="mod-head clearfix">
    <div class="title" mod-skin="line">
     综艺
    </div>
    <a class="pull-right" href="${pageContext.request.contextPath}/class/zy">更多</a>
   </div>
   <div class="mod-main bd">
    <div class="m-list-inner">
     <ul class="m-list" m-list-skin="film" mod-width="w1100">

      <s:forEach items="${varietyLatest}" var="varietyL">
      <li class="m-item"><a class="thumb" href="${pageContext.request.contextPath}/video/${varietyL.v_id}" target="_blank" title="${varietyL.v_name}">
       <img class="quic lazy" src="${varietyL.imgurl}" data-original="" />
       <i class="mask"></i></a>
       <div class="text">
        <h3 class="title ellipsis-1">
         <a href="${pageContext.request.contextPath}/video/${varietyL.v_id}" title="${varietyL.v_name}" target="_blank">${varietyL.v_name}</a></h3>
        <p class="des">主演:${varietyL.actor}</p>
       </div>
      </li>
      </s:forEach>
     </ul>
    </div>
   </div>
  </div>

  <div class="mod slideTab mt20" mod-skin="p20">
   <div class="mod-head clearfix">
    <div class="title" mod-skin="line">
     电影
    </div>
    <a class="pull-right" href="${pageContext.request.contextPath}/class/dy">更多</a>
   </div>
   <div class="mod-main bd">
    <div class="m-list-inner">
     <ul class="m-list" m-list-skin="film" mod-width="w1100">

      <s:forEach items="${moviesLatest}" var="moviesL">
      <li class="m-item"><a class="thumb" href="${pageContext.request.contextPath}/video/${moviesL.v_id}" target="_blank" title="${moviesL.v_name}">
       <img class="quic lazy" src="${moviesL.imgurl}" data-original="" />
       <i class="mask"></i></a>
       <div class="text">
        <h3 class="title ellipsis-1">
         <a href="${pageContext.request.contextPath}/video/${moviesL.v_id}" title="${moviesL.v_name}" target="_blank">${moviesL.v_name}</a></h3>
        <p class="des">主演:${moviesL.actor}</p>
       </div></li>
     </s:forEach>

     </ul>
    </div>
   </div>
  </div>

  <%--<div class="mod mt20" mod-skin="p20">
   <div class="mod-head clearfix">
    <div class="title" mod-skin="line">
     友情链接
    </div>
   </div>
   <div class="mod-main clearfix">
    <div class="partners">
     <a href="http://www.weiyingxiao.com/" target="_blank">微营销</a>
     <a href="http://www.itedou.com/" target="_blank">爱特豆</a>
     <a href="http://www.lszj.com/" target="_blank">历史故事</a>
     <a href="http://www.rijutv.com/" target="_blank">日剧TV</a>
     <a href="http://www.guatian.com/" target="_blank">影视大全</a>
     <a href="http://yl.szhk.com/" target="_blank">最新娱乐新闻</a>
     <a href="http://dy.8855.org/" target="_blank">爱情电影</a>
     <a href="http://www.hanjutt.com/" target="_blank">韩剧天堂</a>


    </div>
   </div>
  </div>--%>

 </div>
</div>

<div class="honey-feedback-floatbtn clearfix">
 <ul class="honey-feedback-list">

  <li class="backtop"><a href="javascript:;" onclick="__goTop();"><span class=""></span><span class="txt">顶部</span></a></li>
 </ul>
</div>
<%@include file="common/footer.jsp"%>
<div class="dialog-tip">
 <span class="tip-content"></span>
</div>
<div id="bottomTips"></div>

</body>
</html>