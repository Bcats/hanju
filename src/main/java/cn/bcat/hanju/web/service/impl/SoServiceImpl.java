package cn.bcat.hanju.web.service.impl;

import cn.bcat.hanju.web.dao.SoMapper;
import cn.bcat.hanju.web.service.SoService;
import cn.bcat.hanju.pojo.web.So;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class SoServiceImpl implements SoService {

    @Autowired
    private SoMapper soMapper;

    @Override
    public List<So> getSoByName(String keyword) {
        List<So> soList = soMapper.getSoByName(keyword);
        int hj = 0,zy = 0,dy = 0;
        for (int i = 0; i < soList.size(); i++) {
            if (soList.get(i).getClass_name().equals("韩剧")){
                hj++;
            }
            if (soList.get(i).getClass_name().equals("综艺")){
                zy++;
            }
            if (soList.get(i).getClass_name().equals("电影")){
                dy++;
            }
        }
        soList.get(soList.size()-1).setHj(hj);
        soList.get(soList.size()-1).setZy(zy);
        soList.get(soList.size()-1).setDy(dy);

        return soList;
    }

    @Override
    public List<So> getSoByNameAndClass(List<So> soList, String class_name) {
        List<So> soList1 = new ArrayList<>();
        for (int i = 0; i < soList.size(); i++) {
            if (soList.get(i).getClass_name().equals(class_name)){
                soList1.add(soList.get(i));
            }
        }
        return soList1;
    }
}
