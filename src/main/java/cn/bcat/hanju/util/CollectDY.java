package cn.bcat.hanju.util;



import org.jsoup.Jsoup;

import java.io.IOException;


public class CollectDY {
    private static final String YJZYW = "http://yongjiuzy.cc";
    private static final String YJZYW_DY_URL_PREFIX = "http://yongjiuzy.cc/?m=vod-type-id-1-pg-";

    public void getDYData(String time){

    }

    public void getDYUrlsByTimeThread(String time){
        int page = 1;
        try {
            Jsoup.connect(YJZYW_DY_URL_PREFIX + page).timeout(9000).get();
        }catch (IOException E){
            System.out.print(E.getStackTrace());
        }

    }

}
