package cn.bcat.hanju.web.service.impl;

import cn.bcat.hanju.web.dao.PlayMapper;
import cn.bcat.hanju.web.service.PlayService;
import cn.bcat.hanju.pojo.web.Play;
import cn.bcat.hanju.pojo.web.PlayUrl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PlayServiceImpl implements PlayService {

    @Autowired
    private PlayMapper playMapper;

    @Override
    public Play getPlayById(int v_id) {
        return playMapper.getPlayById(v_id);
    }

    @Override
    public PlayUrl getPlayUrlByUid(int url_id) {
        return playMapper.getPlayUrlByUid(url_id);
    }

    @Override
    public List<PlayUrl> getPlayUrlByVid(int v_id) {
        return playMapper.getPlayUrlByVid(v_id);
    }


}
