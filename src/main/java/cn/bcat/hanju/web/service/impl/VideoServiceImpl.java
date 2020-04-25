package cn.bcat.hanju.web.service.impl;

import cn.bcat.hanju.web.dao.VideoMapper;
import cn.bcat.hanju.web.service.VideoService;
import cn.bcat.hanju.pojo.web.Video;
import cn.bcat.hanju.pojo.web.VideoUrl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class VideoServiceImpl implements VideoService {
    @Autowired
    private VideoMapper videoMapper;

    @Override
    public List<Video> getVideoById(int id) {
        return videoMapper.getVideoById(id);
    }

    @Override
    public List<VideoUrl> getVideoUrlById(int id) {
        return videoMapper.getVideoUrlById(id);
    }
}
