package cn.bcat.hanju.admin.service.Impl;

import cn.bcat.hanju.admin.dao.AdminUserMapper;
import cn.bcat.hanju.admin.service.AdminUserService;
import cn.bcat.hanju.pojo.admin.AdminUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminUserServiceImpl implements AdminUserService {

    @Autowired
    private AdminUserMapper adminUserMapper;

    @Override
    public List<AdminUser> getAllUser() {
        return adminUserMapper.getAllUser();
    }

    @Override
    public List<AdminUser> getUserAdmin() {
        return adminUserMapper.getUserAdmin();
    }

    @Override
    public List<AdminUser> getUserMenber() {
        return adminUserMapper.getUserMenber();
    }
}
