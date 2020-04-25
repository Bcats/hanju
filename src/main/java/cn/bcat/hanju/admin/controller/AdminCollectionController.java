package cn.bcat.hanju.admin.controller;

import cn.bcat.hanju.admin.service.AdminVideoService;
import cn.bcat.hanju.pojo.admin.AdminAddVideo;
import cn.bcat.hanju.pojo.admin.AdminVideo;
import cn.bcat.hanju.util.CollectHJ;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
public class AdminCollectionController {

    @Autowired
    private AdminVideoService adminVideoService;

    @RequestMapping("admin/collection")
    public String collection(){
        return "admin/collection";
    }

    @RequestMapping("admin/collecting")
    public String collect(@RequestParam(required = false,defaultValue = "day") String time,
                          @RequestParam String class_name,
                          Model model) {

        if (class_name.equals("hj")){
            Map<String,List> map = CollectHJ.getHjData(time);
            if (map!=null){
                List<AdminAddVideo> adminAddVideos = map.get("data");
                List<String> errorUrls = map.get("error");

                int success = 0 ;
                int repeat = 0 ;

                for (int i = 0; i < adminAddVideos.size(); i++) {
                    String v_name = adminAddVideos.get(i).getV_name();
                    List<AdminVideo> adminVideos = adminVideoService.getVideoByVideoName(v_name);
                    Integer v_id = null;
                    for (int j = 0; j < adminVideos.size(); j++) {
                        if (adminVideos.get(j).getYear().equals(adminAddVideos.get(i).getYear())){
                            v_id = adminVideos.get(j).getV_id();
                            break;
                        }
                    }
                    if (v_id == null){
                        adminVideoService.insertVideo(adminAddVideos.get(i));
                        success++;
                    }else {
                        AdminAddVideo adminAddVideo = adminAddVideos.get(i);
                        adminAddVideo.setV_id(v_id);
                        adminAddVideo.setUpdatetime(new Date());
                        adminVideoService.updateVideo(adminAddVideo);
                        repeat++;
                    }

                }

                model.addAttribute("msg",
                        " 失败 "+errorUrls.size()+" 采集"+adminAddVideos.size()+" 入库"+success + " 已存在"+repeat);
            }else {
                model.addAttribute("msg","网络请求失败，再试一次！");
            }

        }

        return "admin/common/collect";
    }

    @RequestMapping("admin/collect")
    public String collect(){

        return "admin/common/collect";
    }

}
