package cn.bcat.hanju.web.service;

import cn.bcat.hanju.pojo.web.IClass;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ClassService {

    PageInfo<IClass> getClassAll(String sclass, int page);

    PageInfo<IClass> getClassByYear(String sclass, String year, int page);


}
