package cn.bcat.hanju.admin.dao;

import cn.bcat.hanju.pojo.admin.AdminAddVideo;
import cn.bcat.hanju.pojo.admin.AdminAddVideoUrl;
import cn.bcat.hanju.pojo.admin.AdminVideo;
import cn.bcat.hanju.pojo.web.IClass;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AdminVideoMapper {

    List<AdminVideo> getAllVideo();

    List<AdminVideo> getVideoByClassName(String className);

    List<AdminVideo> getVideoByVideoName(String videoName);

    AdminAddVideo getVideoNameById(int v_id);

    List<IClass> getVideoByIds(@Param("v_ids") int[] v_ids);

    void deleteVideoById(int v_id);

    void deleteVideoByIds(@Param("v_ids") int[] v_ids);

    void deleteVideoUrlById(int v_id);

    void insertVideo(AdminAddVideo adminAddVideo);

    void insertVideoDetail(AdminAddVideo adminAddVideo);

    void insertVideoUrl(@Param("adminAddVideoUrlList") List<AdminAddVideoUrl> adminAddVideoUrlList);

    void insertSlide(AdminAddVideo adminAddVideo);

    AdminAddVideo getEditVideo(int v_id);

    List<AdminAddVideoUrl> getEditVideoUrl(int v_id);

    AdminAddVideo getEditSlide(int v_id);

    List<AdminAddVideo> getAllSlide();

    void updateVideo(AdminAddVideo adminAddVideo);

    void updateImgById(@Param("imgurl") String imgurl
            ,@Param("download_imgurl") String download_imgurl
            ,@Param("v_id") int v_id);

    void updateSlide(AdminAddVideo adminAddVideo);
}
