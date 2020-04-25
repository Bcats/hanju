package cn.bcat.hanju.admin.service;

import cn.bcat.hanju.pojo.admin.AdminAddVideo;
import cn.bcat.hanju.pojo.admin.AdminVideo;
import cn.bcat.hanju.pojo.web.IClass;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface AdminVideoService {

    PageInfo<AdminVideo> getAllVideo(int page);

    PageInfo<AdminVideo> getVideoByClassName(String className,int page);

    List<AdminVideo> getVideoByVideoName(String videoName);

    AdminAddVideo getVideoNameById(int v_id);

    List<IClass> getVideoByIds(int[] v_ids);

    void deleteVideoById(int v_id);

    void deleteVideoByIds(int[] v_ids);

    void insertVideo(AdminAddVideo adminAddVideo);

    AdminAddVideo getEditVideo(int v_id);

    List<AdminAddVideo> getAllSlide();

    void updateVideo(AdminAddVideo adminAddVideo);

    void updateImgById(String imgurl,String download_imgurl,int v_id);

}
