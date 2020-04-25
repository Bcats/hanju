package cn.bcat.hanju.web.dao;

import cn.bcat.hanju.pojo.web.Play;
import cn.bcat.hanju.pojo.web.PlayUrl;

import java.util.List;

public interface PlayMapper {

    Play getPlayById(int v_id);

    PlayUrl getPlayUrlByUid(int url_id);

    List<PlayUrl> getPlayUrlByVid(int v_id);

}
