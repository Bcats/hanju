package cn.bcat.hanju.admin.dao;

import cn.bcat.hanju.pojo.admin.AdminUser;

import java.util.Set;

public interface AdminLoginMapper {

    AdminUser getAdminUserByUserName(String username);

    Set<String> getRolesByUserType(int usertype);

    Set<String> getPermissionByUserType(int usertype);

}
