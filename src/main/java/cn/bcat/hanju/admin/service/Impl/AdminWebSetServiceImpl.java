package cn.bcat.hanju.admin.service.Impl;

import cn.bcat.hanju.admin.dao.AdminWebSetMapper;
import cn.bcat.hanju.admin.service.AdminWebSetService;
import cn.bcat.hanju.pojo.admin.AdminWebSet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminWebSetServiceImpl implements AdminWebSetService {

    @Autowired
    private AdminWebSetMapper adminWebSetMapper;

    @Override
    public AdminWebSet getWebInfo() {
        return adminWebSetMapper.getWebInfo();
    }

    @Override
    public void setWebInfo(AdminWebSet adminWebSet) {
        adminWebSetMapper.setWebInfo(adminWebSet);
    }
}
