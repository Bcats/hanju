package cn.bcat.hanju.web.dao;

import cn.bcat.hanju.pojo.web.Video;
import cn.bcat.hanju.pojo.web.VideoUrl;

import java.util.List;

public interface VideoMapper {

    List<Video> getVideoById(int id);

    List<VideoUrl> getVideoUrlById(int id);

}
