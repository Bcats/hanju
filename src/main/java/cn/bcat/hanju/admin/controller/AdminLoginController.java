package cn.bcat.hanju.admin.controller;

import cn.bcat.hanju.admin.service.AdminLoginService;
import cn.bcat.hanju.pojo.admin.AdminUser;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;


@Controller
public class AdminLoginController {

    @Autowired
    private AdminLoginService adminLoginService;

    @RequestMapping("admin/login")
    public String adminLogin(HttpServletRequest request){
        // 如果Session中存在登录用户,则返回后台首页
        if (request.getSession().getAttribute("username")!=null) return "redirect:/admin/index";
        // 否则返回登录界面
        return "admin/login";
    }


    @RequestMapping("admin/loginCheckout")
    public String adminLoginCheckout(AdminUser adminUser, Model model){
        System.out.println("登入验证。。。。。。。。。。");
        if (adminUser.getUsername() != "" && adminUser.getUsername() !=null){
            Subject subject = SecurityUtils.getSubject();
            UsernamePasswordToken token = new UsernamePasswordToken(adminUser.getUsername(),adminUser.getPassword());
            try {
                subject.login(token);
                Session session = subject.getSession();
                session.setTimeout(1800000);
                session.setAttribute("username",adminUser.getUsername());
                session.setAttribute("name",adminLoginService.getAdminUserByUserName(adminUser.getUsername()).getName());
                System.out.println(adminUser.getUsername());
                return "redirect:/admin/index";
            }catch (Exception e){
                e.printStackTrace();
                model.addAttribute("username",adminUser.getUsername());
                model.addAttribute("errorMsg","登录失败");
                return "redirect:/admin/login";
            }
        }else {

            return "redirect:/admin/login";
        }

    }



}
