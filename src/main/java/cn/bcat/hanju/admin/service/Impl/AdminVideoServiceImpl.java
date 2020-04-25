package cn.bcat.hanju.admin.service.Impl;

import cn.bcat.hanju.admin.dao.AdminVideoMapper;
import cn.bcat.hanju.admin.service.AdminVideoService;
import cn.bcat.hanju.pojo.admin.AdminAddVideo;
import cn.bcat.hanju.pojo.admin.AdminAddVideoUrl;
import cn.bcat.hanju.pojo.admin.AdminVideo;
import cn.bcat.hanju.pojo.web.IClass;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class AdminVideoServiceImpl implements AdminVideoService {

    @Autowired
    private AdminVideoMapper adminVideoMapper;

    private List<AdminVideo> convertTime(List<AdminVideo> adminVideoList){
        Date date;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        for (int i = 0; i < adminVideoList.size(); i++) {
            date = adminVideoList.get(i).getUpdatetime();
            adminVideoList.get(i).setSupdatetime(sdf.format(date));
        }
        return adminVideoList;
    }

    @Override
    public PageInfo<AdminVideo> getAllVideo(int page) {
        // PageHelper.startPage 紧跟在这个方法后的第一个MyBatis 查询方法会被进行分页。
        PageHelper.startPage(page,10);
        List<AdminVideo> adminVideoList = adminVideoMapper.getAllVideo();

        // 日期转换
        adminVideoList = convertTime(adminVideoList);

        // 分页处理
        PageInfo<AdminVideo> adminVideoPageInfo = new PageInfo<>(adminVideoList,10);

        return adminVideoPageInfo;
    }

    public PageInfo<AdminVideo> getVideoByClassName(String className, int page) {
        if (className.equals("hj")){
            PageHelper.startPage(page,10);
            List<AdminVideo> adminVideoList = adminVideoMapper.getVideoByClassName("韩剧");
            // 日期转换
            adminVideoList = convertTime(adminVideoList);
            return new PageInfo<AdminVideo>(adminVideoList,10);
        }


        if (className.equals("zy")){
            PageHelper.startPage(page,10);
            List<AdminVideo> adminVideoList = adminVideoMapper.getVideoByClassName("综艺");
            // 日期转换
            adminVideoList = convertTime(adminVideoList);
            return new PageInfo<AdminVideo>(adminVideoList,10);
        }

        if (className.equals("dy")){
            PageHelper.startPage(page,10);
            List<AdminVideo> adminVideoList = adminVideoMapper.getVideoByClassName("电影");
            // 日期转换
            adminVideoList = convertTime(adminVideoList);
            return new PageInfo<AdminVideo>(adminVideoList,10);
        }

        return null;
    }

    @Override
    public List<AdminVideo> getVideoByVideoName(String videoName) {
        return adminVideoMapper.getVideoByVideoName(videoName);
    }

    @Override
    public AdminAddVideo getVideoNameById(int v_id) {
        return adminVideoMapper.getVideoNameById(v_id);
    }

    @Override
    public List<IClass> getVideoByIds(int[] v_ids) {
        return adminVideoMapper.getVideoByIds(v_ids);
    }

    @Override
    public void deleteVideoById(int v_id) {
        adminVideoMapper.deleteVideoById(v_id);
    }

    @Override
    public void deleteVideoByIds(int[] v_ids) {
        adminVideoMapper.deleteVideoByIds(v_ids);
    }

    @Override
    public void insertVideo(AdminAddVideo adminAddVideo) {
        adminAddVideo.setUpdatetime(new Date());
        //插入video表数据，返回v_id
        adminVideoMapper.insertVideo(adminAddVideo);
        //添加v_id到adminAddVideo对象中
        //adminAddVideo.setV_id(v_id);
        //插入video_detail数据
        adminVideoMapper.insertVideoDetail(adminAddVideo);
        //调用分解url函数
        List<AdminAddVideoUrl> adminAddVideoUrlList = spiltUrl(adminAddVideo);
        //处理好url字符串后，进行插入数据
        adminVideoMapper.insertVideoUrl(adminAddVideoUrlList);

        // 插入Slide
        if (adminAddVideo.getSort_id()!=null && adminAddVideo.getSlideimg()!=null){
            adminVideoMapper.insertSlide(adminAddVideo);
        }


    }

    private List<AdminAddVideoUrl> spiltUrl(AdminAddVideo adminAddVideo){
        //分解前台获取的url信息字符串群
        String video_url_all = adminAddVideo.getVideo_url();
        String[] video_urls = video_url_all.split("\r\n");

        List<AdminAddVideoUrl> adminAddVideoUrlList = new ArrayList<>();

        for (int i = 0; i < video_urls.length; i++) {
            AdminAddVideoUrl adminAddVideoUrl = new AdminAddVideoUrl();
            String[] video_url = video_urls[i].split("\\$");

            if (video_url.length>1){
                adminAddVideoUrl.setV_id(adminAddVideo.getV_id());
                adminAddVideoUrl.setUrlname(video_url[0]);
                adminAddVideoUrl.setUrl(video_url[1]);
                adminAddVideoUrl.setUrltype("播放");
                adminAddVideoUrl.setClass_id(adminAddVideo.getClass_id());
            }else {
                continue;
            }

            adminAddVideoUrlList.add(adminAddVideoUrl);
        }

        return adminAddVideoUrlList;
    }

    @Override
    public AdminAddVideo getEditVideo(int v_id) {
        //获取video、video_detail和slide表中数据
        AdminAddVideo adminAddVideo = adminVideoMapper.getEditVideo(v_id);
        //获取video_url表中数据
        List<AdminAddVideoUrl> urlList = adminVideoMapper.getEditVideoUrl(v_id);
        //将video_url获取到的数据列表按格式转换成url信息字符串
        String sUrl = "" ;
        for (int i = 0; i < urlList.size(); i++) {
            sUrl = sUrl + urlList.get(i).getUrlname()+"$"+urlList.get(i).getUrl();
            if (i!=urlList.size()-1){
                sUrl = sUrl + "\r\n";
            }
        }
        adminAddVideo.setVideo_url(sUrl);
        // 查询有这个v_id的slide信息就设置
        if (adminVideoMapper.getEditSlide(v_id)!=null){
            adminAddVideo.setSort_id(adminVideoMapper.getEditSlide(v_id).getSort_id());
            adminAddVideo.setSlideimg(adminVideoMapper.getEditSlide(v_id).getSlideimg());
        }
        // 转换时间格式
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        adminAddVideo.setUpdatetime(sdf.format(adminAddVideo.getUpdatetime()));

        return adminAddVideo;
    }

    @Override
    public List<AdminAddVideo> getAllSlide() {
        return adminVideoMapper.getAllSlide();
    }

    @Override
    public void updateVideo(AdminAddVideo adminAddVideo) {
        if (adminAddVideo.getIsUpdate()!=null){
            adminAddVideo.setUpdatetime(new Date());
        }
        List<AdminAddVideoUrl> adminAddVideoUrlList = spiltUrl(adminAddVideo);

        adminVideoMapper.updateVideo(adminAddVideo);
        // 更新video_url 先删再插入
        adminVideoMapper.deleteVideoUrlById(adminAddVideo.getV_id());
        adminVideoMapper.insertVideoUrl(adminAddVideoUrlList);

        // 更新Slide
        Integer sort_id = adminAddVideo.getSort_id();
        if (sort_id!=null){
            List<AdminAddVideo> adminAddVideoList = adminVideoMapper.getAllSlide();
            for (int i = 0; i < adminAddVideoList.size(); i++) {
                if (sort_id == adminAddVideoList.get(i).getSort_id()){
                    adminVideoMapper.updateSlide(adminAddVideo);
                    return;
                }
            }
            adminVideoMapper.insertSlide(adminAddVideo);
        }


    }

    @Override
    public void updateImgById(String imgurl,String download_imgurl, int v_id) {
        adminVideoMapper.updateImgById(imgurl,download_imgurl,v_id);
    }


}
