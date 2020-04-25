package cn.bcat.hanju.web.dao;

import cn.bcat.hanju.pojo.web.IClass;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ClassMapper {

    List<IClass> getClassAll(String sclass);

    List<IClass> getClassByYear(@Param("class") String sclass,@Param("year") int year);

    List<IClass> getClassBeforeYear(@Param("class") String sclass,@Param("year") int year);

}
