package cn.bcat.hanju.util;

import cn.bcat.hanju.pojo.admin.AdminAddVideo;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.junit.Test;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

public class CollectHJ extends Collect {

    private static final String YJZYW = "http://yongjiuzy.cc";
    private static final String YJZYW_HJ_URL_PREFIX = "http://yongjiuzy.cc/?m=vod-type-id-16-pg-";


    public static Map<String,List> getHjData(String time){

        List<String> urls = getHjUrlsByTimeThread(time);

        return urls != null ? getHjDataDetailThread(urls) : null;
    }

    public static Map<String,List> getHjDataByerror(List<String> errorUrls){
        return getHjDataDetailThread(errorUrls);
    }



    private static Map<String,List> getHjDataDetailThread(List<String> urls){
        Map<String,List> map = new HashMap();
        List<String> errorUrls = new ArrayList<>();
        List<AdminAddVideo> adminAddVideos = new ArrayList<>();
        // 不超过10个url
        if (urls.size() < 10){
            for (int i = 0; i < urls.size(); i++) {
                Document document = null;
                try {
                    document = Jsoup.connect(urls.get(i))
                            .header("User-Agent","Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36").timeout(9000).get();

                } catch (IOException e) {
                    errorUrls.add(urls.get(i));
                    e.printStackTrace();
                    continue;
                }
                DataDetail dataDetail = new DataDetail(document,adminAddVideos);
                new Thread(dataDetail,"1").start();
            }

        }

        // 超过10个url
        if (urls.size() > 10){
            int count = 0;
            int yu = urls.size()%5;
            int thread_count = urls.size()/5*5+1;
            // 循环创建线程
            while (count < urls.size()){
                // 保持5个线程
                for (int i = 1; i < 6; i++) {
                    //
                    if (yu!=0 && thread_count==count){
                        for (int j = thread_count; j < urls.size(); j++) {
                            Document document = null;
                            try {
                                document = Jsoup.connect(urls.get(j))
                                        .header("User-Agent","Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36").timeout(9000).get();
                            } catch (Exception e) {
                                errorUrls.add(urls.get(j));
                                System.out.println(urls.size()+"单个url请求error"+count);
                                //e.printStackTrace();
                                count++;
                                break;

                            }
                            DataDetail dataDetail = new DataDetail(document,adminAddVideos);
                            new Thread(dataDetail,"线程"+j).start();
                            count++;
                            System.out.println(urls.size()+ "  "+count);

                        }
                        map.put("data",adminAddVideos);
                        map.put("error",errorUrls);

                        return map;


                    }else{
                        Document document = null;
                        try {
                            document = Jsoup.connect(urls.get(count))
                                    .header("User-Agent","Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36").timeout(9000).get();
                        } catch (Exception e) {
                            errorUrls.add(urls.get(count));
                            System.out.println(urls.size()+"单个url请求error"+count);
                            //e.printStackTrace();
                            count++;
                            continue;

                        }
                        DataDetail dataDetail = new DataDetail(document,adminAddVideos);
                        new Thread(dataDetail,"线程"+i).start();
                        count++;
                        System.out.println(urls.size()+ "  "+count);

                    }

                }

            }

        }
        map.put("data",adminAddVideos);
        map.put("error",errorUrls);

        return map;
    }

    private static List<String> getHjUrlsByTimeThread(String time){
        int page = 1;
        Elements datas = null;
        // 先获取韩剧第一页HTML
        try {
            datas = Jsoup.connect(YJZYW_HJ_URL_PREFIX+1+".html")
                    .timeout(9000).get()
                    .select("tbody[id=data_list]").first()
                    .select("tr[class=DianDian]");
        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("获取韩剧首页失败");
            return null;
        }

        List urls = new ArrayList();
        // 获取每页韩剧详情页URL（datas.size()>0说明：当页有韩剧数据，还没超过最后一页）
        while (datas.size()>0){

            Document document = null;

            try {
                document = Jsoup.connect(YJZYW_HJ_URL_PREFIX +page+".html").timeout(9000).get();
            } catch (IOException e) {
                //e.printStackTrace();
                System.out.println("出错了");
                break;
            }

            Element data_list = document.select("tbody[id=data_list]").first();

            datas = data_list.select("tr[class=DianDian]");

                // 获取此页每个韩剧详情页URL

                DataUrls dataUrls = new DataUrls();
                dataUrls.setDatas(datas);
                dataUrls.setTime(time);
                dataUrls.setYJZYW(YJZYW);
                dataUrls.setUrls(urls);
                dataUrls.setYJZYW_HJ_URL_PREFIX(YJZYW_HJ_URL_PREFIX);
                dataUrls.setPage(page);
                Thread t = new Thread(dataUrls);
                t.start();

                page++;

            }

        return urls;
    }



}

class DataDetail implements Runnable{

    private List<AdminAddVideo> adminAddVideos;
    private Document document;

    public DataDetail(Document document,List<AdminAddVideo> adminAddVideos){
        this.document = document;
        this.adminAddVideos = adminAddVideos;
    }
    @Override
    public void run() {

        System.out.println("thread");
        String contentMain = document.select("div[class=contentMain]").first().outerHtml();
        String contentURL = document.select("div[class=contentURL]").first().outerHtml();
        String contentNR = document.select("div[class=contentNR]").first().outerHtml();

        String imgurl = IString.getInsideString(contentMain,"<!--图片开始-->","<!--图片结束-->");
        imgurl = IString.getInsideString(imgurl,"src=\"","\"");
        String v_name = IString.getInsideString(contentMain,"<!--片名开始-->","<!--片名结束-->");
        String status = IString.getInsideString(contentMain,"<!--备注开始-->","<!--备注结束-->");
        String actor = IString.getInsideString(contentMain,"<!--主演开始-->","<!--主演结束-->");
        String director = IString.getInsideString(contentMain,"<!--导演开始-->","<!--导演结束-->");
        String detail = IString.getInsideString(contentNR,"<!--简介开始-->","<!--简介结束-->");
        String year = IString.getInsideString(contentMain,"<!--年代开始-->","<!--年代结束-->");

        String surl = IString.getInsideString(contentURL,"<!--前yjm3u8-->","<!--后yjm3u8-->");

        if (surl!=null){
            Document durl = Jsoup.parse(surl);
            surl = "" ;
            Elements eurls = durl.select("input");
            for (int j = 0; j < eurls.size(); j++) {
                String url = eurls.get(j).attr("value") + "\r\n";
                surl = surl + url;
            }

            AdminAddVideo adminAddVideo = new AdminAddVideo();
            adminAddVideo.setImgurl(imgurl.trim());
            adminAddVideo.setV_name(v_name.trim());
            adminAddVideo.setStatus(status.trim());
            adminAddVideo.setActor(actor.trim());
            adminAddVideo.setDirector(director.trim());
            adminAddVideo.setDetail(detail.trim());
            adminAddVideo.setYear(year.trim());
            adminAddVideo.setVideo_url(surl.trim());

            adminAddVideos.add(adminAddVideo);
        }

    }
}

class DataUrls implements Runnable{

    private Elements datas;
    private String time;
    private String YJZYW;
    private List urls;
    private int page;
    private String YJZYW_HJ_URL_PREFIX;


    public void setPage(int page) {
        this.page = page;
    }

    public void setYJZYW_HJ_URL_PREFIX(String YJZYW_HJ_URL_PREFIX) {
        this.YJZYW_HJ_URL_PREFIX = YJZYW_HJ_URL_PREFIX;
    }

    public void setDatas(Elements datas) {
        this.datas = datas;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public void setYJZYW(String YJZYW) {
        this.YJZYW = YJZYW;
    }

    public void setUrls(List urls) { this.urls = urls; }


    @Override
    public void run() {

        boolean flag = true;
        while(flag){

            for (int i = 0; i < datas.size(); i++) {

                Element data = datas.get(i);
                String updatetime = data.select("td").get(4).text();
                // 没有 采集限制 则采集所有
                if (time.equals("all")){
                    String url = YJZYW + data.select("td").first().select("a").attr("href");
                    System.out.println(url);
                    urls.add(url);

                }else {
                    if(CollectHJ.compareTimeWithNow(updatetime,time)){
                        String url = YJZYW + data.select("td").first().select("a").attr("href");
                        System.out.println(url);
                        urls.add(url);
                    }else {
                        flag = false;
                        break;
                    }
                }

            }
            return;
        }


    }

}

