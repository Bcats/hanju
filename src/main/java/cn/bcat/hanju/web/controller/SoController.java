package cn.bcat.hanju.web.controller;

import cn.bcat.hanju.pojo.web.WebBaseInfo;
import cn.bcat.hanju.web.service.IndexService;
import cn.bcat.hanju.web.service.SoService;
import cn.bcat.hanju.pojo.web.So;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@SessionAttributes({"webBaseInfo"})
public class SoController {

    @Autowired
    private SoService soService;

    @Autowired
    private IndexService indexService;

    @RequestMapping("s")
    public String so(Model model, HttpServletRequest request){

        // 网站全局基本信息对象
        if (request.getSession().getAttribute("webBaseInfo") == null){
            WebBaseInfo webBaseInfo = indexService.getWebBaseInfo();
            model.addAttribute("webBaseInfo",webBaseInfo);
        }

        // 返回搜索关键字 至前台
        String keyword = request.getParameter("wd");
        model.addAttribute("so_keyword",keyword);

        // 查询搜索结果By名称
        List<So> soList = soService.getSoByName(keyword);
        String isclass = request.getParameter("c_name");

        // 存在class_name
        if (isclass !=null && isclass != ""){
            // list中查找指定类型
            List<So> soList1 = soService.getSoByNameAndClass(soList,isclass);
            model.addAttribute("soListByClass",soList1);
            model.addAttribute("soList",soList);
            model.addAttribute("choose_status",isclass);
        }else {
            model.addAttribute("soList",soList);
            model.addAttribute("choose_status","全部");
        }

        return "so";
    }

}
