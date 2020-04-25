<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="content">
    <div class="container-fluid">
        <h4 class="page-title">用户数据</h4>
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <div class="row">

                            <div class="col-md-1">
                                <div class="dropdown show">

                                    <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
                                        <s:if test="${usertype == 'all'}">
                                            全部
                                        </s:if>
                                        <s:if test="${usertype == 'admin'}">
                                            管理员
                                        </s:if>
                                        <s:if test="${usertype == 'menber'}">
                                            会员
                                        </s:if>
                                        <s:if test="${usertype == null}">
                                            全部
                                        </s:if>
                                    </button>

                                    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu" x-placement="top-start" style="position: absolute; transform: translate3d(0px, -122px, 0px); top: 0px; left: 0px; will-change: transform;">

                                        <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/admin/user">管理员</a>
                                        <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/menber/user">会员</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/user">全部</a>

                                    </ul>

                                </div>

                            </div>
                            <div class="col-md-3">
                                <ul class="nav nav-pills nav-primary">
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">添加</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">删除</a>
                                    </li>

                                </ul>
                            </div>

                            <div class="col-md-4">

                            </div>

                            <div class="col-md-4">
                                <form class="navbar-right navbar-form nav-search mr-md-3" action="">
                                    <div class="input-group">
                                        <input type="text" placeholder="输入账号、昵称试试 ..." class="form-control">
                                        <div class="input-group-append">
											<span class="input-group-text">
												<i class="la la-search search-icon"></i>
											</span>
                                        </div>
                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>
                                        <label class="form-check-label">
                                            <input class="form-check-input" type="checkbox" value="" >
                                            <span class="form-check-sign">编号</span>
                                        </label>
                                    </th>
                                    <th>账号</th>
                                    <th>昵称</th>
                                    <th>等级</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>

                                <s:forEach items="${adminUserList}" var="adminUserL">
                                    <tr>
                                        <th scope="row">
                                            <label class="form-check-label">
                                                <input class="form-check-input" type="checkbox" value="" >
                                                <span class="form-check-sign">${adminUserL.id}</span>
                                            </label>
                                        </th>
                                        <td>
                                            ${adminUserL.username}
                                        </td>

                                        <td>${adminUserL.name}</td>

                                        <td>${adminUserL.usertype}</td>
                                        <td>
                                            <button type="button" data-toggle="tooltip" title="" class="btn btn-link btn-simple-primary" data-original-title="编辑"><i class="la la-edit"></i></button>

                                            <button type="button" data-toggle="tooltip" title="" class="btn btn-link btn-simple-danger" data-original-title="删除" aria-describedby="tooltip436912"><i class="la la-trash"></i></button>
                                        </td>
                                    </tr>
                                </s:forEach>

                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="card-footer">
                        <ul class="pagination pg-primary">
                            <li class="page-item">
                                <a class="page-link" href="#" aria-label="Previous">
                                    <span aria-hidden="true">«</span>
                                    <span class="sr-only">Previous</span>
                                </a>
                            </li>
                            <li class="page-item active"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item">
                                <a class="page-link" href="#" aria-label="Next">
                                    <span aria-hidden="true">»</span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </li>
                        </ul>

                    </div>
                </div>

            </div>

        </div>
    </div>
</div>
