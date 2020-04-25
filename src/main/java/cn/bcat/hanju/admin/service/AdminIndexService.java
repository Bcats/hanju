package cn.bcat.hanju.admin.service;

import cn.bcat.hanju.pojo.admin.AdminIndex;

public interface AdminIndexService {

    AdminIndex getMenberNumber();

    AdminIndex getVisitNumber();

    AdminIndex getVideoNumber();

    AdminIndex getCollectionNumber();

    int getClassNumberByName(String className);

    int[] getVidsByClassName(String class_name);

}
