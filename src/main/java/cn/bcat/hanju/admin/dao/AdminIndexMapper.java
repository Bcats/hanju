package cn.bcat.hanju.admin.dao;

import cn.bcat.hanju.pojo.admin.AdminIndex;

public interface AdminIndexMapper {


    AdminIndex getMenberNumber();

    AdminIndex getVisitNumber();

    AdminIndex getVideoNumber();

    AdminIndex getCollectionNumber();

    int getClassNumberByName(String className);

    int[] getVidsByClassName(String class_name);


}
