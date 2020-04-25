package cn.bcat.hanju.web.controller;

import cn.bcat.hanju.pojo.web.WebBaseInfo;
import cn.bcat.hanju.web.service.IndexService;
import cn.bcat.hanju.web.service.PlayService;
import cn.bcat.hanju.pojo.web.Play;
import cn.bcat.hanju.pojo.web.PlayUrl;
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
public class PlayController {

    @Autowired
    private PlayService playService;

    @Autowired
    private IndexService indexService;

    @RequestMapping("play/{v_id}")
    public String play(Model model, @PathVariable Integer v_id, HttpServletRequest request){

        if (request.getSession().getAttribute("webBaseInfo") == null){
            WebBaseInfo webBaseInfo = indexService.getWebBaseInfo();
            model.addAttribute("webBaseInfo",webBaseInfo);
        }

        String url_id = request.getParameter("url_id");
        PlayUrl playUrl = null;

        Play play = playService.getPlayById(v_id);
        model.addAttribute("play",play);

        if (url_id != null){
            playUrl = playService.getPlayUrlByUid(Integer.valueOf(url_id));
        }
        model.addAttribute("playUrl",playUrl);

        List<PlayUrl> playUrlList = playService.getPlayUrlByVid(v_id);
        model.addAttribute("playUrlList",playUrlList);

        return "play";
    }

    // 内嵌播放器
    @RequestMapping("player")
    public String player(Model model, HttpServletRequest request){
        String playurl = request.getParameter("playurl");
        System.out.println(playurl);
        model.addAttribute("playurl",playurl);

        return "player";
    }

}
