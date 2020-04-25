package cn.bcat.hanju.util;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class Collect {

      /*  private static String getRpath(){
        File directory = new File("");// 参数为空
        String courseFile = "";
        try {
            courseFile = directory.getCanonicalPath()+"\\src\\main\\webapp\\images\\";
            System.out.println(courseFile);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return courseFile;
    }
*/

    public static File saveImgurl(String url, String filePath, String fileName) throws Exception {
        System.out.println("fileName---->"+filePath);
        //创建不同的文件夹目录
        File file = new File(filePath);
        //判断文件夹是否存在
        if (!file.exists())
        {
            //如果文件夹不存在，则创建新的的文件夹
            file.mkdirs();
        }
        FileOutputStream fileOut = null;
        HttpURLConnection conn = null;
        InputStream inputStream = null;

        // 建立链接
        URL httpUrl=new URL(url);
        conn=(HttpURLConnection) httpUrl.openConnection();
        //以Post方式提交表单，默认get方式
        conn.setDoInput(true);
        conn.setDoOutput(true);
        // post方式不能使用缓存
        conn.setUseCaches(false);
        //连接指定的资源
        conn.connect();
        //获取网络输入流
        inputStream=conn.getInputStream();
        BufferedInputStream bis = new BufferedInputStream(inputStream);
        //判断文件的保存路径后面是否以/结尾
        if (!filePath.endsWith("/")) {

            filePath += "/";

        }
        //写入到文件（注意文件保存路径的后面一定要加上文件的名称）
        fileOut = new FileOutputStream(filePath + fileName);
        BufferedOutputStream bos = new BufferedOutputStream(fileOut);

        byte[] buf = new byte[4096];
        int length = bis.read(buf);
        //保存文件
        while(length != -1)
        {
            bos.write(buf, 0, length);
            length = bis.read(buf);
        }
        bos.close();
        bis.close();
        conn.disconnect();


        return file;

    }

    public static Boolean compareTimeWithNow(String updatetime,String time){

        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");

        String userTime = null;
        String nowTime = null;
        Date utime = null;
        Date ntime = null;

        try {
            utime = df.parse(updatetime);
            userTime = df.format(utime);
            nowTime = df.format(new Date());
            ntime = df.parse(nowTime);
        } catch (ParseException e) {
            e.printStackTrace();
            System.out.println("String转Date时间解析错误");
        }



        if (time.equals("day")){
            return userTime.equals(nowTime) ? true : false ;
        }else if (time.equals("week")){
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(ntime);
            calendar.add(Calendar.DAY_OF_MONTH,-7);

            return calendar.getTime().getTime() <= utime.getTime() ? true : false ;
        }else if(time.equals("month")){
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(ntime);
            calendar.add(Calendar.DAY_OF_MONTH,-30);

            return calendar.getTime().getTime() <= utime.getTime() ? true : false ;
        }

        return null;
    }

    /*    private static Map<String,List> getHjDataDetail(List<String> urls){
        Map<String,List> map = new HashMap();
        List<String> errorUrls = new ArrayList<>();
        List<AdminAddVideo> adminAddVideos = new ArrayList<>();

        for (int i = 0; i < urls.size(); i++) {
            Document document = null;
            try {
                document = Jsoup.connect(urls.get(i)).timeout(9000).get();
            } catch (IOException e) {
                errorUrls.add(urls.get(i));
                e.printStackTrace();
                continue;
            }
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
        map.put("data",adminAddVideos);
        map.put("error",errorUrls);

        return map;
    }*/

}
