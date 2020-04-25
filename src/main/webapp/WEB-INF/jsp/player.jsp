<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">

    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/DPlayer.min.css">
    <script src="${pageContext.request.contextPath}/js/hls.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/DPlayer.min.js"></script>
</head>
<body style="margin: 0px;">

<div id="dplayer"></div>
<script type="application/javascript">
    window.onload = function () {

        const dp = new DPlayer({
            container: document.getElementById('dplayer'),
            screenshot:true,
            autoplay:true,
            preload:'auto',
            theme:'#2F54EB',
            video: {
                url: '${playurl}',
                type: 'hls'
            }
        });

        dp.play();
    }

</script>
</body>