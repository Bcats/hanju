<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="content">
    <div class="container-fluid">
        <h4 class="page-title">网站配置</h4>
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">

                    </div>
                    <div class="card-body">
                        <form method="post" action="${pageContext.request.contextPath}/admin/webset/add.action">



                        <div class="form-group form-inline">
                            <label for="title" class="col-md-3 col-form-label">网站标题</label>
                            <div class="col-md-8 p-0">
                                <input type="text" class="form-control input-full" id="title" name="title" value="${adminWebSet.title}">
                            </div>
                        </div>

                        <div class="form-group form-inline">
                            <label for="sencond_title" class="col-md-3 col-form-label">网站副标题</label>
                            <div class="col-md-8 p-0">
                                <input type="text" class="form-control input-full" id="sencond_title" name="sencond_title" value="${adminWebSet.sencond_title}">
                            </div>
                        </div>

                        <div class="form-group form-inline">
                            <label for="domain" class="col-md-3 col-form-label">网站域名</label>
                            <div class="col-md-8 p-0">
                                <input type="text" class="form-control input-full" id="domain" name="domain" value="${adminWebSet.domain}">
                            </div>
                        </div>

                        <div class="form-group form-inline">
                            <label for="m_domain" class="col-md-3 col-form-label">手机站域名</label>
                            <div class="col-md-8 p-0">
                                <input type="text" class="form-control input-full" id="m_domain" name="m_domain" value="${adminWebSet.m_domain}">
                            </div>
                        </div>

                        <div class="form-group form-inline">
                            <label for="logo" class="col-md-3 col-form-label">网站logo
                            </label>
                            <div class="col-md-4 p-0">
                                <input type="text" class="form-control input-full" id="logo" name="logo" value="${adminWebSet.logo}">
                            </div>
                        </div>

                        <div class="form-group form-inline">
                            <label for="m_logo" class="col-md-3 col-form-label">手机站logo
                            </label>
                            <div class="col-md-4 p-0">
                                <input type="text" class="form-control input-full" id="m_logo" name="m_logo" value="${adminWebSet.m_logo}">
                            </div>
                        </div>

                        <div class="form-group form-inline">
                            <label for="keywords" class="col-md-3 col-form-label">关键字</label>
                            <div class="col-md-8 p-0">
                                <input type="text" class="form-control input-full" id="keywords" name="keywords" value="${adminWebSet.keywords}">
                            </div>
                        </div>

                        <div class="form-group form-inline">
                            <label for="description" class="col-md-3 col-form-label">网站描述</label>
                            <div class="col-md-8 p-0">
                                <input type="text" class="form-control input-full" id="description" name="description" value="${adminWebSet.description}">
                            </div>
                        </div>

                        <div class="form-group form-inline">
                            <label for="beian" class="col-md-3 col-form-label">备案号</label>
                            <div class="col-md-8 p-0">
                                <input type="text" class="form-control input-full" id="beian" name="beian" value="${adminWebSet.beian}">
                            </div>
                        </div>

                        <div class="form-group form-inline">
                            <label class="col-md-3" for="index_visit_code">统计代码</label>

                            <textarea id="index_visit_code"
                                      name="index_visit_code"
                                      class="col-md-8 p0 form-control"
                                      rows="5">${adminWebSet.index_visit_code}</textarea>

                        </div>

                        <div class="form-check form-inline">

                            <label class="col-md-3">网站状态</label><br>
                            <label class="form-radio-label">
                                <s:if test="${adminWebSet.web_status == 0}">
                                <input class="form-radio-input" type="radio" name="web_status" value="0" checked="">
                                </s:if>
                                <s:if test="${adminWebSet.web_status != 0}">
                                    <input class="form-radio-input" type="radio" name="web_status" value="0">
                                </s:if>
                                <span class="form-radio-sign">开启</span>
                            </label>

                            <label class="form-radio-label ml-4">
                                <s:if test="${adminWebSet.web_status == 1}">
                                    <input class="form-radio-input" type="radio" name="web_status" value="1" checked="">
                                </s:if>
                                <s:if test="${adminWebSet.web_status != 1}">
                                    <input class="form-radio-input" type="radio" name="web_status" value="1">
                                </s:if>
                                <span class="form-radio-sign">关闭</span>
                            </label>
                        </div>

                        <div class="form-group form-inline">
                            <label class="col-md-3" for="close_info">关闭提醒</label>
                            <textarea class="col-md-8 p0 form-control"
                                      id="close_info"
                                      name="close_info" rows="5">${adminWebSet.close_info}</textarea>
                        </div>

                        <div class="card-action form-inline">
                            <div class="col-md-3"></div>
                            <button type="submit" class="btn btn-primary btn-round">保存</button>
                            <button class="btn btn-danger btn-round ml-3">还原</button>
                        </div>


                        </form>



                    </div>
                    <div class="card-footer">

                    </div>
                </div>

            </div>

        </div>
    </div>
</div>
