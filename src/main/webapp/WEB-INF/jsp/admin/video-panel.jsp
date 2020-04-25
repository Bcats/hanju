<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="content">
    <div class="container-fluid">
        <h4 class="page-title">视频数据</h4>
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <div class="row">

                            <div class="col-md-2">
                                <div class="dropdown show">

                                    <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
                                        <s:if test="${choose_class == 'all'}">
                                            全部
                                        </s:if>
                                        <s:if test="${choose_class == 'hj'}">
                                            韩剧
                                        </s:if>
                                        <s:if test="${choose_class == 'zy'}">
                                            综艺
                                        </s:if>
                                        <s:if test="${choose_class == 'dy'}">
                                            电影
                                        </s:if>
                                        <s:if test="${choose_class == null}">
                                            全部
                                        </s:if>

                                    </button>

                                    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu" x-placement="top-start" style="position: absolute; transform: translate3d(0px, -122px, 0px); top: 0px; left: 0px; will-change: transform;">

                                        <a class="dropdown-item"
                                           href="${pageContext.request.contextPath}/admin/hj/video">韩剧</a>
                                        <a class="dropdown-item"
                                           href="${pageContext.request.contextPath}/admin/zy/video">综艺</a>
                                        <a class="dropdown-item"
                                           href="${pageContext.request.contextPath}/admin/dy/video">电影</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item"
                                           href="${pageContext.request.contextPath}/admin/video">全部</a>

                                    </ul>

                                </div>
                            </div>

                            <div class="col-md-6">
                                <a href="${pageContext.request.contextPath}/admin/add">
                                <button class="btn btn-primary" id="v_add">
                                    添加
                                </button></a>

                                <button class="btn btn-primary" id="v_delete">删除</button>

                                <button class="btn btn-primary" id="v_download_img">下载图片</button>

                            </div>

                            <div class="col-md-4">
                                <form class="navbar-right navbar-form nav-search mr-md-3"
                                      action="${pageContext.request.contextPath}/${video_choose_url}">
                                    <div class="input-group">
                                        <input type="text" placeholder="输入名称、ID试试 ..." name="v_name" class="form-control">
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
                                            <input class="form-check-input" id="choose_all" type="checkbox" value="" >
                                            <span class="form-check-sign">编号</span>
                                        </label>
                                        <script src="${pageContext.request.contextPath}/assets/js/core/jquery.3.2.1.min.js"></script>
                                        <script>
                                            $("#choose_all").click(function () {
                                                if (this.checked) {
                                                    $("input[name='v_checkbox']").prop("checked", true);
                                                } else {
                                                    $("input[name='v_checkbox']").prop("checked", false);
                                                }
                                            });

                                            $("#v_delete").click(function () {
                                                var array = [];
                                                var choose = document.getElementsByName("v_checkbox");
                                                var flag = false;
                                                // 循环检查是否有选中
                                                for (var i = 0; i < choose.length; i++) {
                                                    if(choose[i].checked){
                                                        flag = true;
                                                        break;
                                                    }
                                                }

                                                // 没选中
                                                if (!flag){
                                                    alert("请选择要删除项");
                                                    return false;
                                                // 选中
                                                } else {
                                                    // 获取选中checkbox中的值（v_id）
                                                    $("input[name='v_checkbox']:checked").each(function () {
                                                        array.push($(this).val());
                                                    });

                                                    $.ajax({
                                                        url:"${pageContext.request.contextPath}/admin/delete",
                                                        dataType:"text",
                                                        traditional:true,
                                                        contentType:"application/json",
                                                        type:"POST",
                                                        data:JSON.stringify(array),
                                                        success:function (data) {
                                                            if (data.indexOf("没有权限")<0){
                                                                alert(data);
                                                                window.location.reload()
                                                            } else {
                                                                alert("您是test用户，权限不足哟~")
                                                            }
                                                           }
                                                    });

                                                }

                                            });

                                            $("#v_download_img").click(function () {


                                                var array = [];
                                                var choose = document.getElementsByName("v_checkbox");
                                                var flag = false;
                                                // 循环检查是否有选中
                                                for (var i = 0; i < choose.length; i++) {
                                                    if(choose[i].checked){
                                                        flag = true;
                                                        break;
                                                    }
                                                }

                                                // 没选中
                                                if (!flag){
                                                    alert("请选择要下载的图片");
                                                    return false;
                                                    // 选中
                                                } else {
                                                    // 获取选中checkbox中的值（v_id）
                                                    $("input[name='v_checkbox']:checked").each(function () {
                                                        array.push($(this).val());
                                                    });

                                                    $.ajax({
                                                        url:"${pageContext.request.contextPath}/admin/downloadImg",
                                                        dataType:"text",
                                                        traditional:true,
                                                        contentType:"application/json",
                                                        timeout:5000,
                                                        type:"POST",
                                                        data:JSON.stringify(array),
                                                        success:function (data) {
                                                            if (data.indexOf("没有权限")<0){
                                                                alert(data);
                                                                window.location.reload()
                                                            } else {
                                                                alert("您是test用户，权限不足哟~")
                                                            }
                                                        }
                                                    });

                                                }

                                            })
                                        </script>

                                    </th>
                                    <th>名称</th>
                                    <th>播放</th>
                                    <th>评分</th>
                                    <th>访问</th>
                                    <th>更新时间</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>

                                <s:forEach items="${pageInfo.list}" var="adminVideoL" varStatus="i">
                                <tr>
                                    <th scope="row">
                                        <label class="form-check-label">
                                            <input class="form-check-input" name="v_checkbox" type="checkbox" value="${adminVideoL.v_id}" >
                                            <span class="form-check-sign">${adminVideoL.v_id}</span></label>
                                    </th>
                                    <td>
                                        <s:if test="${adminVideoL.class_name == '韩剧'}">
                                        <span class="text-primary">[${adminVideoL.class_name}]</span>
                                        </s:if>
                                        <s:if test="${adminVideoL.class_name == '综艺'}">
                                            <span class="text-info">[${adminVideoL.class_name}]</span>
                                        </s:if>
                                        <s:if test="${adminVideoL.class_name == '电影'}">
                                            <span class="text-danger">[${adminVideoL.class_name}]</span>
                                        </s:if>

                                            ${adminVideoL.v_name}
                                        <span class="badge badge-count">${adminVideoL.status}</span>
                                    </td>
                                    <td>${adminVideoL.play}</td>
                                    <td>${adminVideoL.beanscore}</td>
                                    <td>${adminVideoL.visit}</td>
                                    <td>${adminVideoL.supdatetime}</td>
                                    <td>


                                        <a href="${pageContext.request.contextPath}/admin/edit/${adminVideoL.v_id}">
                                        <button type="button" data-toggle="tooltip" title=""
                                                class="btn btn-link btn-simple-primary" data-original-title="编辑">
                                            <i class="la la-edit"></i></button></a>

                                        <a href="${pageContext.request.contextPath}/${video_choose_url}?dv_id=${adminVideoL.v_id}">
                                        <button type="button" data-toggle="tooltip" title=""
                                                class="btn btn-link btn-simple-danger" data-original-title="删除" aria-describedby="tooltip436912">
                                            <i class="la la-trash"></i></button></a>
                                    </td>
                                </tr>
                                </s:forEach>

                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="card-footer">
                        <ul class="pagination pg-primary">
                            <s:if test="${pageInfo.total>0}">
                            <li class="page-item">
                                <a class="page-link"
                                href="<s:if test="${pageInfo.hasPreviousPage}">
                                ${pageContext.request.contextPath}/${video_choose_url}?page=${pageInfo.pageNum-1}
                                </s:if>" aria-label="Previous">
                                    <span aria-hidden="true">«</span>
                                    <span class="sr-only">Previous</span>
                                </a>
                            </li>

                            <s:forEach items="${pageInfo.navigatepageNums}" var="page_num">
                                <s:if test="${page_num == pageInfo.pageNum}">
                                <li class="page-item active">
                                    <a class="page-link" href="${pageContext.request.contextPath}/${video_choose_url}?page=${page_num}">${page_num}</a>
                                </li>
                                </s:if>
                                <s:if test="${page_num != pageInfo.pageNum}">
                                <li class="page-item">
                                <a class="page-link" href="${pageContext.request.contextPath}/${video_choose_url}?page=${page_num}">${page_num}</a>
                                </li>
                                </s:if>

                            </s:forEach>

                            <li class="page-item">
                                <a class="page-link "
                                   href="<s:if test="${pageInfo.hasNextPage}">
                                   ${pageContext.request.contextPath}/${video_choose_url}?page=${pageInfo.pageNum+1}
                                    </s:if>" aria-label="Next">
                                    <span aria-hidden="true">»</span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </li>
                                &nbsp;&nbsp;&nbsp;&nbsp;当前第 ${pageInfo.pageNum} 页
                                &nbsp;&nbsp;总共 ${pageInfo.pages} 页
                                &nbsp;&nbsp;一共 ${pageInfo.total} 条记录
                            </s:if>
                        </ul>

                    </div>
                </div>

            </div>

        </div>
    </div>
</div>