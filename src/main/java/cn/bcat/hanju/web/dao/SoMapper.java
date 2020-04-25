package cn.bcat.hanju.web.dao;

import cn.bcat.hanju.pojo.web.So;

import java.util.List;

public interface SoMapper {

    List<So> getSoByName(String keyword);

}
