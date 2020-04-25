<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<footer class="footer-wrap footer">
    <div class="footer-inner">
       <%-- <div class="footer-con clearfix">
            <div class="f_ct">
                <div class="f_ul ul_r">
                    <a href="#"><h3>排行榜</h3></a>
                    <ul class="ul_w1">
                        <li><a href="#" target="_blank">韩剧排行榜</a></li>
                        <li><a href="#" target="_blank" >综艺排行榜</a></li>
                        <li><a href="#" target="_blank" >电影排行榜</a></li>
                    </ul>
                </div>
                <div class="f_ul ul_r">
                    <a href="${pageContext.request.contextPath}/class.action?class=韩剧"><h3>追剧</h3></a>
                    <ul class="ul_w1">
                        <li><a href="${pageContext.request.contextPath}/class.action?class=韩剧">韩剧</a></li>
                        <li><a href="${pageContext.request.contextPath}/class.action?class=综艺">综艺</a></li>
                        <li><a href="${pageContext.request.contextPath}/class.action?class=电影">电影</a></li>
                        <li><a href="#">视频</a></li>
                    </ul>
                </div>
                <div class="f_ul ul_r">
                    <a href="#"><h3>资讯</h3></a>
                    <ul class="ul_w2">
                        <li><a href="#" target="_blank">韩剧资讯</a></li>
                        <li><a href="#" target="_blank">综艺资讯</a></li>
                        <li><a href="#" target="_blank">电影资讯</a></li>
                        <li><a href="#" target="_blank">音乐资讯</a></li>
                        <li><a href="#" target="_blank">图片资讯</a></li>
                        <li><a href="#" target="_blank">专访资讯</a></li>
                        <li><a href="#" target="_blank">明星资讯</a></li>
                        <li><a href="#" target="_blank">剧评资讯</a></li>
                    </ul>
                </div>
                <div class="f_ul last">
                    <h3>关于</h3>
                    <ul class="ul_w1">
                        <li><a href="#" target="_blank" rel="nofollow">关于我们</a></li>
                        <li><a href="#" target="_blank" rel="nofollow">联系我们</a></li>
                        <li><a href="#" target="_blank" rel="nofollow">商务合作</a></li>
                        <li><a href="#" target="_blank" rel="nofollow">版权投诉</a></li>
                    </ul>
                </div>
            </div>
        </div>--%>
        <div class="footer-bottom">
            <div class="bottom-con">
                <span class="copyright">Copyright &copy; 2019 Bcat. All rights reserved.</span>
                <span class="copyright">${webBaseInfo.beian}</span>
                <span class="copyright">
                    <a target="_blank" rel="nofollow" href="#">
                        <img src="${pageContext.request.contextPath}/images/ba-icon.png" />
                        <p>${webBaseInfo.beian}</p></a>
                </span>
                <span class="copyright">本网站技术使用SSM框架编写</span>
                <span class="copyright">2019 ❥ made with <a href="#">Bcat</a></span>
                <span class="copyright">${webBaseInfo.index_visit_code}</span>
            </div>
        </div>
    </div>
</footer>
