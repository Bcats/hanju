package cn.bcat.hanju.web.service;

import cn.bcat.hanju.pojo.web.So;

import java.util.List;

public interface SoService {

    List<So> getSoByName(String keyword);

    List<So> getSoByNameAndClass(List<So> soList,String class_name);
}
