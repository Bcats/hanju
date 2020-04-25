package cn.bcat.hanju.web.controller;

import cn.bcat.hanju.admin.service.AdminVideoService;
import cn.bcat.hanju.pojo.admin.AdminAddVideo;
import cn.bcat.hanju.pojo.web.Index;
import cn.bcat.hanju.pojo.web.WebBaseInfo;
import cn.bcat.hanju.web.service.IndexService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@SessionAttributes({"webBaseInfo"})
public class IndexController {
    @Autowired
    private IndexService indexService;

    @Autowired
    private AdminVideoService adminVideoService;

    @RequestMapping(value = {"/","index"})
    public String index(Model model, HttpServletRequest request){

        if (request.getSession().getAttribute("webBaseInfo") == null){
            WebBaseInfo webBaseInfo = indexService.getWebBaseInfo();
            model.addAttribute("webBaseInfo",webBaseInfo);
        }else if (request.getSession().getAttribute("webBaseInfo") != indexService.getWebBaseInfo()){
            WebBaseInfo webBaseInfo = indexService.getWebBaseInfo();
            model.addAttribute("webBaseInfo",webBaseInfo);
        }


        //获取最新韩剧
        //List<Index> tvLatest = indexService.getTvLatest();
        List<Index> tvLatest = indexService.getLatestByName("韩剧");
        model.addAttribute("tvLatest",tvLatest);
        //获取最新综艺
        //List<Index> varietyLatest = indexService.getVarietyLatest();
        List<Index> varietyLatest = indexService.getLatestByName("综艺");
        model.addAttribute("varietyLatest",varietyLatest);
        //获取最新电影
        //List<Index> moviesLatest = indexService.getMoviesLatest();
        List<Index> moviesLatest = indexService.getLatestByName("电影");
        model.addAttribute("moviesLatest",moviesLatest);

        model.addAttribute("click_status","index");
        //提交轮播对象至前台页面
        List<AdminAddVideo> adminAddVideoList = adminVideoService.getAllSlide();
        for (int i = 0; i < adminAddVideoList.size(); i++) {
            int v_id = adminAddVideoList.get(i).getV_id();
            AdminAddVideo adminAddVideo = adminVideoService.getVideoNameById(v_id);
            if (adminAddVideo!=null){
                adminAddVideoList.get(i).setV_name(adminAddVideo.getV_name());
            }

        }
        model.addAttribute("slides",adminAddVideoList);

        return "index";
    }


}
