package cn.bcat.hanju.web.controller;

import cn.bcat.hanju.pojo.web.WebBaseInfo;
import cn.bcat.hanju.util.IString;
import cn.bcat.hanju.web.service.ClassService;
import cn.bcat.hanju.pojo.web.IClass;
import cn.bcat.hanju.web.service.IndexService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@SessionAttributes({"webBaseInfo"})
public class ClassController {

    @Autowired
    private ClassService classService;

    @Autowired
    private IndexService indexService;

    @GetMapping(value = {"/class/{className}","/class/{className}/{year}"})
    public String iclass(@PathVariable(value = "className",required = true) String className,
                         @PathVariable(value = "year",required = false) String year,
                         @RequestParam(required = false,defaultValue = "1") String page,
                         Model model, HttpServletRequest request){

        if (request.getSession().getAttribute("webBaseInfo") == null){
            WebBaseInfo webBaseInfo = indexService.getWebBaseInfo();
            model.addAttribute("webBaseInfo",webBaseInfo);
        }

        PageInfo<IClass> pageInfo;
        // hj转韩剧
        String sclass_name = IString.convertToStr(className);
        // className 乱输时默认hj
        if (sclass_name.equals("韩剧")) className = "hj";

        if (year == null || year.equals("")){
            pageInfo = classService.getClassAll(sclass_name,Integer.valueOf(page));
            model.addAttribute("year","all");
        }else {
            pageInfo = classService.getClassByYear(sclass_name,year,Integer.valueOf(page));
            model.addAttribute("year",year);
        }

        model.addAttribute("checked_class",className);
        model.addAttribute("pageInfo",pageInfo);





        return "class";
    }

}
