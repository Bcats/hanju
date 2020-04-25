package cn.bcat.hanju.util;

import cn.bcat.hanju.admin.service.AdminVideoService;
import cn.bcat.hanju.pojo.web.IClass;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public class DownloadThread implements Runnable{

    private List<IClass> iClassList;
    private HttpServletRequest request;
    private AdminVideoService adminVideoService;
    private int error;
    private int success;
    private int count;

    public void setiClassList(List<IClass> iClassList) {
        this.iClassList = iClassList;
    }

    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }

    public void setAdminVideoService(AdminVideoService adminVideoService) {
        this.adminVideoService = adminVideoService;
    }

    public void setError(int error) {
        this.error = error;
    }

    public void setSuccess(int success) {
        this.success = success;
    }

    public void setCount(int count) {
        this.count = count;
    }

    @Override
    public void run() {

        System.out.println("线程运行...");
        String imgurl = iClassList.get(count).getImgurl();
        String class_name = iClassList.get(count).getClass_name();
        String downloadurl = iClassList.get(count).getDownload_imgurl();
        int v_id = iClassList.get(count).getV_id();
        // imgurl是本地连接 （从downloadurl下载一遍）
        if (imgurl.startsWith("images")){
            System.out.println("已缓存至本地图片");
            try {
                if (downloadurl!=null&&downloadurl!=""){
                    CollectHJ.saveImgurl(downloadurl,
                            request.getRealPath("/")+"images/hj",v_id+".webp");
                    adminVideoService.updateImgById("images/hj/"+v_id+".webp",downloadurl,v_id);
                    success++;
                    System.out.println("下载成功");
                    return;
                }

            } catch (Exception e) {
                e.printStackTrace();
                System.out.println("下载出错");

                error++;
                return;
            }
        }

        // imgurl是网络连接 （下载imgurl图片 并将imgurl放入downloadurl）
        if (class_name.equals("韩剧")){
            try {
                CollectHJ.saveImgurl(imgurl,
                        request.getRealPath("/")+"images/hj",v_id+".webp");
                adminVideoService.updateImgById("images/hj/"+v_id+".webp",imgurl,v_id);
                System.out.println("下载成功");
                success++;
            }catch (Exception e){
                e.printStackTrace();
                System.out.println("下载出错");
                error++;
                return;
            }

        }


    }
}
