package cn.bcat.hanju.web.service.impl;

import cn.bcat.hanju.pojo.web.WebBaseInfo;
import cn.bcat.hanju.web.dao.IndexMapper;
import cn.bcat.hanju.pojo.web.Index;
import cn.bcat.hanju.web.service.IndexService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class IndexServiceImpl implements IndexService {

    @Autowired
    private IndexMapper indexMapper;

    @Override
    public WebBaseInfo getWebBaseInfo() {
        return indexMapper.getWebBaseInfo();
    }

    @Override
    public List<Index> getLatestByName(String className) {
        return indexMapper.getLatestByName(className);
    }

}
