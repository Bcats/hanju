package cn.bcat.hanju.admin.service.Impl;

import cn.bcat.hanju.admin.dao.AdminLoginMapper;
import cn.bcat.hanju.admin.service.AdminLoginService;
import cn.bcat.hanju.pojo.admin.AdminUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Set;

@Service
public class AdminLoginServiceImpl implements AdminLoginService {

    @Autowired
    private AdminLoginMapper adminLoginMapper;

    @Override
    public AdminUser getAdminUserByUserName(String username) {
        return adminLoginMapper.getAdminUserByUserName(username);
    }

    @Override
    public Set<String> getRolesByUserType(int usertype) {
        return adminLoginMapper.getRolesByUserType(usertype);
    }

    @Override
    public Set<String> getPermissionByUserType(int usertype) {
        return adminLoginMapper.getPermissionByUserType(usertype);
    }


}
