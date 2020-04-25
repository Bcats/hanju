package cn.bcat.hanju.web.controller;

import cn.bcat.hanju.pojo.web.WebBaseInfo;
import cn.bcat.hanju.web.service.IndexService;
import cn.bcat.hanju.web.service.VideoService;
import cn.bcat.hanju.pojo.web.Video;
import cn.bcat.hanju.pojo.web.VideoUrl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@SessionAttributes({"webBaseInfo"})
public class VideoController {

    @Autowired
    private VideoService videoService;

    @Autowired
    private IndexService indexService;

    @RequestMapping("video/{v_id}")
    public String video(Model model, @PathVariable Integer v_id, HttpServletRequest request){

        if (request.getSession().getAttribute("webBaseInfo") == null){
            WebBaseInfo webBaseInfo = indexService.getWebBaseInfo();
            model.addAttribute("webBaseInfo",webBaseInfo);
        }

        //处理返回video相关信息
        List<Video> videoList  = videoService.getVideoById(v_id);
        Video video = videoList.get(0);
        model.addAttribute("video",video);

        //处理返回videourl信息
        List<VideoUrl> videoUrlList = videoService.getVideoUrlById(v_id);
        model.addAttribute("videoUrlList",videoUrlList);

        return "video";
    }



}
