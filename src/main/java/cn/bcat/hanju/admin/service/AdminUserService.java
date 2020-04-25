package cn.bcat.hanju.admin.service;

import cn.bcat.hanju.pojo.admin.AdminUser;

import java.util.List;

public interface AdminUserService {

    List<AdminUser> getAllUser();

    List<AdminUser> getUserAdmin();

    List<AdminUser> getUserMenber();

}
