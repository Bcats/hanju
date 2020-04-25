package cn.bcat.hanju.admin.service.Impl;

import cn.bcat.hanju.admin.dao.AdminIndexMapper;
import cn.bcat.hanju.admin.service.AdminIndexService;
import cn.bcat.hanju.pojo.admin.AdminIndex;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminIndexServiceImpl implements AdminIndexService {

    @Autowired
    private AdminIndexMapper adminIndexMapper;


    @Override
    public AdminIndex getMenberNumber() {
        return adminIndexMapper.getMenberNumber();
    }

    @Override
    public AdminIndex getVisitNumber() {
        return adminIndexMapper.getVisitNumber();
    }

    @Override
    public AdminIndex getVideoNumber() {
        return adminIndexMapper.getVideoNumber();
    }

    @Override
    public AdminIndex getCollectionNumber() {
        return adminIndexMapper.getCollectionNumber();
    }

    @Override
    public int getClassNumberByName(String className) {
        return adminIndexMapper.getClassNumberByName(className);
    }

    @Override
    public int[] getVidsByClassName(String class_name) {
        return adminIndexMapper.getVidsByClassName(class_name);
    }


}
