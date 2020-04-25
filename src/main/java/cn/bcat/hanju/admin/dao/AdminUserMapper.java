package cn.bcat.hanju.admin.dao;

import cn.bcat.hanju.pojo.admin.AdminUser;

import java.util.List;

public interface AdminUserMapper {

    List<AdminUser> getAllUser();

    List<AdminUser> getUserAdmin();

    List<AdminUser> getUserMenber();



}
