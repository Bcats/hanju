<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="main-header">
    <div class="logo-header">
        <a href="${pageContext.request.contextPath}/admin/index" style="text-decoration: none" class="logo">
            黑猫影视系统后台
        </a>
        <button class="navbar-toggler sidenav-toggler ml-auto" type="button" data-toggle="collapse" data-target="collapse" aria-controls="sidebar" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <button class="topbar-toggler more"><i class="la la-ellipsis-v"></i></button>
    </div>
    <nav class="navbar navbar-header navbar-expand-lg">
        <div class="container-fluid">


            <ul class="navbar-nav topbar-nav ml-md-auto align-items-center">
                <li class="nav-item">
                    <a target="_blank" class="nav-link" href="${pageContext.request.contextPath}/index">
                    <i class="la la-home"></i>
                    </a>
                </li>

                <li class="nav-item dropdown hidden-caret">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="la la-envelope"></i>
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="#">邮件图标链接1</a>
                        <a class="dropdown-item" href="#">邮件图标链接2</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">邮件图标链接3</a>
                    </div>
                </li>
                <li class="nav-item dropdown hidden-caret">
                    <a class="nav-link dropdown-toggle" href="#"  role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="la la-bell"></i>
                        <span class="notification">3</span>
                    </a>
                    <ul class="dropdown-menu notif-box" aria-labelledby="navbarDropdown">
                        <li>
                            <div class="dropdown-title">你有3条未读信息</div>
                        </li>
                        <li>
                            <div class="notif-center">
                                <a href="#">
                                    <div class="notif-icon notif-primary"> <i class="la la-user-plus"></i> </div>
                                    <div class="notif-content">
												<span class="block">
													信息1
												</span>
                                        <span class="time">5 minutes ago</span>
                                    </div>
                                </a>
                                <a href="#">
                                    <div class="notif-icon notif-success"> <i class="la la-comment"></i> </div>
                                    <div class="notif-content">
												<span class="block">
													信息2
												</span>
                                        <span class="time">12 minutes ago</span>
                                    </div>
                                </a>
                                <%--<a href="#">
                                    <div class="notif-img">
                                        <img src="assets/img/profile2.jpg" alt="Img Profile">
                                    </div>
                                    <div class="notif-content">
												<span class="block">
													信息3
												</span>
                                        <span class="time">12 minutes ago</span>
                                    </div>
                                </a>--%>
                                <a href="#">
                                    <div class="notif-icon notif-danger"> <i class="la la-heart"></i> </div>
                                    <div class="notif-content">
												<span class="block">
													信息4
												</span>
                                        <span class="time">17 minutes ago</span>
                                    </div>
                                </a>
                            </div>
                        </li>
                        <li>
                            <a class="see-all" href="javascript:void(0);"> <strong>查看所有消息</strong> <i class="la la-angle-right"></i> </a>
                        </li>
                    </ul>
                </li>
                <%--<li class="nav-item dropdown">
                    <a class="dropdown-toggle profile-pic" data-toggle="dropdown" href="#" aria-expanded="false"> <img src="assets/img/profile.jpg" alt="user-img" width="36" class="img-circle"><span >用户名</span></span> </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li>
                            <div class="user-box">
                                <div class="u-img"><img src="assets/img/profile.jpg" alt="user"></div>
                                <div class="u-text">
                                    <h4>用户名</h4>
                                    <p class="text-muted">昵称</p><a href="profile.html" class="btn btn-rounded btn-danger btn-sm">个人页</a></div>
                            </div>
                        </li>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#"><i class="ti-user"></i> 我的消息</a>
                        <a class="dropdown-item" href="#"></i> xxx</a>
                        <a class="dropdown-item" href="#"><i class="ti-email"></i> xxx</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#"><i class="ti-settings"></i> 设置</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#"><i class="fa fa-power-off"></i> 退出</a>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>--%>
            </ul>
        </div></nav>
</div>
