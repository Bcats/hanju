package cn.bcat.hanju.admin.controller;

import cn.bcat.hanju.admin.service.AdminWebSetService;
import cn.bcat.hanju.pojo.admin.AdminWebSet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class AdminWebSetController {

    @Autowired
    private AdminWebSetService adminWebSetService;

    @RequestMapping("admin/webset")
    public String showAdminBase(Model model){

        AdminWebSet adminWebSet =  adminWebSetService.getWebInfo();
        model.addAttribute("adminWebSet",adminWebSet);

        return "admin/webset";
    }

    @RequestMapping("admin/webset/add")
    public String updateAdminBase(AdminWebSet adminWebSet){
        adminWebSetService.setWebInfo(adminWebSet);

        return "redirect:/admin/webset.action";
    }



}
