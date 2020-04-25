package cn.bcat.hanju.admin.service;

import cn.bcat.hanju.pojo.admin.AdminUser;

import java.util.Set;

public interface AdminLoginService {

    AdminUser getAdminUserByUserName(String username);

    Set<String> getRolesByUserType(int usertype);

    Set<String> getPermissionByUserType(int usertype);

}
