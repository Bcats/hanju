<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="sidebar">
    <div class="scrollbar-inner sidebar-wrapper">
        <div class="user">
            <div class="photo">
                <img src="${pageContext.request.contextPath}/assets/img/profile.jpg">
            </div>
            <div class="info">
                <a class="" data-toggle="collapse" href="#collapseExample" aria-expanded="true">
								<span>
									<%  String name = (String) request.getSession().getAttribute("name");
									    String username = (String) request.getSession().getAttribute("username");
                                    %>
                                    <%=name%>
									<span class="user-level"><%=username%></span>
									<span class="caret"></span>
								</span>
                </a>
                <div class="clearfix"></div>

                <div class="collapse in" id="collapseExample" aria-expanded="true" style="">
                    <ul class="nav">
                        <li>
                            <a href="#profile">
                                <span class="link-collapse">My Profile</span>
                            </a>
                        </li>
                        <li>
                            <a href="#edit">
                                <span class="link-collapse">Edit Profile</span>
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/logout">
                                <span class="link-collapse">退出</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <ul class="nav">

                    <s:if test="${index != 'active'}"><li class="nav-item"></s:if>
                    <s:if test="${index == 'active'}"><li class="nav-item active"></s:if>
                <a href="${pageContext.request.contextPath}/admin/index">
                    <i class="la la-dashboard"></i>
                    <p>后台首页</p>
                    <%--<span class="badge badge-count">5</span>--%>
                </a>
            </li>
            <%--<li class="nav-item">
                <a href="${pageContext.request.contextPath}/admin/xx.action">
                    <i class="la la-table"></i>
                    <p>基础信息</p>
                    &lt;%&ndash;<span class="badge badge-count">14</span>&ndash;%&gt;
                </a>
            </li>--%>

                    <s:if test="${video != 'active'}"><li class="nav-item"></s:if>
                    <s:if test="${video == 'active'}"><li class="nav-item active"></s:if>
                <a href="${pageContext.request.contextPath}/admin/all/video">
                    <i class="la la-keyboard-o"></i>
                    <p>视频数据</p>
                    <span class="badge badge-count">${adminIndex.video_number}</span>
                </a>
            </li>

                        <s:if test="${user == null}"><li class="nav-item"></s:if>
                        <s:if test="${user != null}"><li class="nav-item active"></s:if>
                <a href="${pageContext.request.contextPath}/admin/user">
                    <i class="la la-th"></i>
                    <p>用户管理</p>
                    <span class="badge badge-count">${adminIndex.menber_number}</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="${pageContext.request.contextPath}/admin/collection">
                    <i class="la la-bell"></i>
                    <p>采集管理</p>
                    <span class="badge badge-success">${adminIndex.collection_number}</span>
                </a>
            </li>
                    <s:if test="${webset != 'active'}"><li class="nav-item"></s:if>
                    <s:if test="${webset == 'active'}"><li class="nav-item active"></s:if>
                    <a href="${pageContext.request.contextPath}/admin/webset">
                    <i class="la la-font"></i>
                    <p>网站管理</p>
                    <%--<span class="badge badge-danger">25</span>--%>
                </a>
            </li>
            <%--<li class="nav-item">
                <a href="icons.html">
                    <i class="la la-fonticons"></i>
                    <p>图标</p>
                </a>
            </li>
            <li class="nav-item update-pro">
                <button  data-toggle="modal" data-target="#modalUpdate">
                    <i class="la la-hand-pointer-o"></i>
                    <p>备用按钮</p>
                </button>
            </li>--%>
        </ul>
    </div>
</div>
