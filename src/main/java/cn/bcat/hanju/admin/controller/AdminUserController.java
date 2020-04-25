package cn.bcat.hanju.admin.controller;

import cn.bcat.hanju.admin.service.AdminUserService;
import cn.bcat.hanju.pojo.admin.AdminUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class AdminUserController {

    @Autowired
    private AdminUserService adminUserService;

    @RequestMapping("admin/user")
    public String adminUserAll(Model model){
        List<AdminUser> adminUserList = adminUserService.getAllUser();
        model.addAttribute("adminUserList",adminUserList);
        return "admin/user";
    }

    @RequestMapping("admin/{type}/user")
    public String adminUserByType(@PathVariable("type") String usertype, Model model){
        List<AdminUser> adminUserList = null;

        if (usertype.equals("all"))
            adminUserList = adminUserService.getAllUser();
        if (usertype.equals("admin"))
            adminUserList = adminUserService.getUserAdmin();
        if (usertype.equals("menber"))
            adminUserList = adminUserService.getUserMenber();

        model.addAttribute("usertype",usertype);
        model.addAttribute("adminUserList",adminUserList);

        return "admin/user";
    }

}
