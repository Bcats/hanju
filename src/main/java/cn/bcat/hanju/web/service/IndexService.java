package cn.bcat.hanju.web.service;

import cn.bcat.hanju.pojo.web.Index;
import cn.bcat.hanju.pojo.web.WebBaseInfo;

import java.util.List;

public interface IndexService {

    WebBaseInfo getWebBaseInfo();

    List<Index> getLatestByName(String className);

}
