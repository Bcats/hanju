<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="content">
    <div class="container-fluid">
        <h4 class="page-title">采集中心</h4>
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                    永久资源网
                    </div>
                    <div class="card-body">

                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>类型</th>
                                <th>更新时间</th>
                                <th>今日更新</th>
                                <th>最后采集</th>
                                <th></th>
                                <th></th>
                                <th></th>

                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <th scope="row">1</th>
                                <td>韩剧</td>
                                <td>未更新</td>
                                <td>未采集</td>
                                <td>未采集</td>
                                <td><a target="_blank" href="${pageContext.request.contextPath}/admin/collect?time=day&class_name=hj">采集当天</a></td>
                                <td><a target="_blank" href="${pageContext.request.contextPath}/admin/collect?time=week&class_name=hj">采集本周</a></td>
                                <td><a target="_blank" href="${pageContext.request.contextPath}/admin/collect?time=month&class_name=hj">采集本月</a></td>
                                <td><a target="_blank" href="${pageContext.request.contextPath}/admin/collect?time=all&class_name=hj">采集全部</a></td>
                            </tr>
                            <tr>
                                <th scope="row">2</th>
                                <td>Table cell</td>
                                <td>Table cell</td>
                                <td>Table cell</td>
                                <td>Table cell</td>
                                <td>Table cell</td>
                                <td>Table cell</td>
                                <td>Table cell</td>

                            </tr>
                            <tr>
                                <th scope="row">3</th>
                                <td>Table cell</td>
                                <td>Table cell</td>
                                <td>Table cell</td>
                                <td>Table cell</td>
                                <td>Table cell</td>
                                <td>Table cell</td>

                                <td>
                                    <a href="#">编辑</a>
                                    <a href="#">删除</a>
                                    <a href="#">添加</a>
                                </td>
                            </tr>
                            </tbody>
                        </table>


                    </div>
                    <div class="card-footer">

                    </div>
                </div>

            </div>

        </div>
    </div>
</div>
