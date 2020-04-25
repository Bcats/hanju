<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="content">
    <div class="container-fluid">
        <h4 class="page-title">添加视频</h4>
        <div class="row">
            <div class="col-md-12">
                <div class="card">


                    <form method="post" action="${pageContext.request.contextPath}/admin/add">

                    <div class="card-body">


                        <div class="form-group form-inline">
                            <s:if test="${adminEditVideo != null}"><input type="text" name="v_id" value="${adminEditVideo.v_id}" style="display: none"/></s:if>
                            <label for="v_name" class="col-md-1 col-form-label">名称：</label>

                            <input type="text" <s:if test="${adminEditVideo != null}">value="${adminEditVideo.v_name}" </s:if> class="col-md-8 form-control input-solid" id="v_name" name="v_name" placeholder="输入视频名称">
                            <div class="col-md-3">

                                <select class="form-control input-solid" name="class_id" id="class_name">
                                    <s:if test="${adminEditVideo.class_id == 0}"><option selected="selected" value="0">韩剧</option></s:if>
                                    <s:if test="${adminEditVideo.class_id != 0}"><option value="0">韩剧</option></s:if>
                                    <s:if test="${adminEditVideo.class_id == 1}"><option selected="selected" value="1">综艺</option></s:if>
                                    <s:if test="${adminEditVideo.class_id != 1}"><option value="1">综艺</option></s:if>
                                    <s:if test="${adminEditVideo.class_id == 2}"><option selected="selected" value="2">电影</option></s:if>
                                    <s:if test="${adminEditVideo.class_id != 2}"><option value="2">电影</option></s:if>
                                </select>

                            </div>
                        </div>

                        <div class="form-group form-inline">
                            <label for="director" class="col-md-1 col-form-label">导演：</label>
                            <input type="text" <s:if test="${adminEditVideo != null}">value="${adminEditVideo.director}" </s:if> class="col-md-4 form-control input-solid" id="director" name="director" placeholder="输入导演，之间用逗号隔开">

                            <label for="beanscore" class="col-md-1 col-form-label">评分：</label>
                            <input type="text" <s:if test="${adminEditVideo != null}">value="${adminEditVideo.beanscore}" </s:if> class="col-md-2 form-control input-solid" id="beanscore" name="beanscore" placeholder="输入评分，纯数字就好">
                        </div>


                        <div class="form-group form-inline">
                            <label for="actor" class="col-md-1 col-form-label">主演：</label>
                            <input type="text" <s:if test="${adminEditVideo != null}">value="${adminEditVideo.actor}" </s:if> class="col-md-7 form-control input-solid" id="actor" name="actor" placeholder="输入主演，之间用逗号隔开">
                        </div>

                        <div class="form-group form-inline">
                            <label for="status" class="col-md-1 col-form-label">状态：</label>
                            <input type="text" <s:if test="${adminEditVideo != null}">value="${adminEditVideo.status}" </s:if> class="col-md-7 form-control input-solid" id="status" name="status" placeholder="输入电视更新集数，综艺期数，电影清晰度等">
                        </div>

                        <div class="form-group form-inline">
                            <label for="imgurl" class="col-md-1 col-form-label">图片：</label>
                            <input type="text" <s:if test="${adminEditVideo != null}">value="${adminEditVideo.imgurl}" </s:if> class="col-md-6 form-control input-solid" id="imgurl" name="imgurl" placeholder="输入视频图片的地址">
                            <input type="file" class="col-md-5 form-control-file" id="exampleFormControlFile1">
                        </div>


                        <div class="form-group form-inline">
                            <label for="year" class="col-md-1 col-form-label">年份：</label>
                            <input type="text" <s:if test="${adminEditVideo != null}">value="${adminEditVideo.year}" </s:if> class="col-md-2 form-control input-solid" id="year" name="year" placeholder="输入开始年份">

                            <label for="visit" class="col-md-1 col-form-label">访问量：</label>
                            <input type="text" <s:if test="${adminEditVideo != null}">value="${adminEditVideo.visit}" </s:if> class="col-md-2 form-control input-solid" id="visit" name="visit" placeholder="输入视频总访问量">

                            <label for="play" class="col-md-1 col-form-label">播放量：</label>
                            <input type="text" <s:if test="${adminEditVideo != null}">value="${adminEditVideo.play}" </s:if> class="col-md-2 form-control input-solid" id="play" name="play" placeholder="输入视频总播放量">

                            <label for="download" class="col-md-1 col-form-label">下载量：</label>
                            <input type="text" <s:if test="${adminEditVideo != null}">value="${adminEditVideo.download}" </s:if> class="col-md-2 form-control input-solid" id="download" name="download" placeholder="输入视频总下载量">
                        </div>

                        <div class="form-group form-inline">
                            <label for="sort_id" class="col-md-1 col-form-label">排序</label>
                            <input type="text" <s:if test="${adminEditVideo != null}">value="${adminEditVideo.sort_id}" </s:if> class="col-md-1 form-control input-solid" id="sort_id" name="sort_id" placeholder="纯数字1-8">
                            <label for="slideimg" class="col-md-1 col-form-label">轮播</label>
                            <input type="text" <s:if test="${adminEditVideo != null}">value="${adminEditVideo.slideimg}" </s:if> class="col-md-9 form-control input-solid" id="slideimg" name="slideimg" placeholder="轮播图片URL地址">
                        </div>

                        <div class="form-group form-inline">
                            <label class="col-md-1 col-form-label"  for="video_url">播放：</label>
                            <textarea class="col-md-11 form-control" id="video_url"
                                      name="video_url" placeholder="格式：名字$下载播放地址（多个就换行）
                                      例如：第一集$http://www.baidu.com" rows="8"><s:if test="${adminEditVideo != null}">${adminEditVideo.video_url}</s:if></textarea>
                        </div>

                        <div class="form-group form-inline">
                            <label class="col-md-1 col-form-label"  for="detail">介绍</label>
                            <textarea class="col-md-11 form-control" id="detail" name="detail" placeholder="详细剧情介绍，不超过255个字符" rows="8"><s:if test="${adminEditVideo != null}">${adminEditVideo.detail}</s:if></textarea>
                        </div>

                        <div class="form-check form-inline">
                            <div class="col-md-1"></div>
                            <label class="form-check-label">
                                <input class="form-check-input" type="checkbox" value="1" name="isUpdate" checked="checked">
                                <span class="form-check-sign">更新时间</span>
                                <span class="form-check-sign"><s:if test="${adminEditVideo.updatetime != null}">&nbsp;${adminEditVideo.updatetime} </s:if></span>
                                <input id="updatetime" name="updatetime" style="display: none;" value="${adminEditVideo.updatetime}">
                            </label>
                        </div>


                    </div>
                    <div class="card-footer">
                        <div class="form-group form-inline">
                            <div class="col-md-1"></div>
                            <label class="form-check-label">
                                <input type="submit" class="btn btn-primary">
                            </label>
                        </div>
                    </div>
                    </form>


                </div>

                </div>

            </div>

        </div>


        </div>
    
</div>