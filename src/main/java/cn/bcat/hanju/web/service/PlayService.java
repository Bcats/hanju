package cn.bcat.hanju.web.service;

import cn.bcat.hanju.pojo.web.Play;
import cn.bcat.hanju.pojo.web.PlayUrl;

import java.util.List;

public interface PlayService {

    Play getPlayById(int v_id);

    PlayUrl getPlayUrlByUid(int url_id);

    List<PlayUrl> getPlayUrlByVid(int v_id);
}
