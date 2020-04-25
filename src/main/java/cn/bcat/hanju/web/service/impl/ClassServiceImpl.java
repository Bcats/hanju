package cn.bcat.hanju.web.service.impl;

import cn.bcat.hanju.web.dao.ClassMapper;
import cn.bcat.hanju.web.service.ClassService;
import cn.bcat.hanju.pojo.web.IClass;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClassServiceImpl implements ClassService {

    @Autowired
    private ClassMapper classMapper;


    @Override
    public PageInfo<IClass> getClassAll(String sclass, int page) {
        PageHelper.startPage(page,40);
        List<IClass> iClassList = classMapper.getClassAll(sclass);


        return new PageInfo<IClass>(iClassList,40);
    }

    @Override
    public PageInfo<IClass> getClassByYear(String sclass, String year, int page) {
        List<IClass> iClassList;
        if (year.equals("before")){
            iClassList = classMapper.getClassBeforeYear(sclass,2016);
        }else {
            PageHelper.startPage(page,40);
            iClassList = classMapper.getClassByYear(sclass,Integer.valueOf(year));
        }

        return new PageInfo<IClass>(iClassList,40);
    }
}
