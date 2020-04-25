package cn.bcat.hanju.web.dao;

import cn.bcat.hanju.pojo.web.Index;
import cn.bcat.hanju.pojo.web.WebBaseInfo;

import java.util.List;

public interface IndexMapper {

    WebBaseInfo getWebBaseInfo();

    List<Index> getLatestByName(String className);

}
