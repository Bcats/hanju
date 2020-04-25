package cn.bcat.hanju.admin.controller;

import cn.bcat.hanju.admin.service.AdminIndexService;
import cn.bcat.hanju.admin.service.AdminVideoService;
import cn.bcat.hanju.pojo.admin.AdminAddVideo;
import cn.bcat.hanju.pojo.admin.AdminIndex;
import cn.bcat.hanju.pojo.admin.AdminVideo;
import cn.bcat.hanju.pojo.web.IClass;
import cn.bcat.hanju.util.CollectHJ;
import com.github.pagehelper.PageInfo;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@SessionAttributes({"adminIndex"})
public class AdminVideoController {

    @Autowired
    private AdminVideoService adminVideoService;

    @Autowired
    private AdminIndexService adminIndexService;

    @RequestMapping("admin/video")
    public String adminVideo(){
        return "redirect:/admin/all/video";
    }

    @RequestMapping("admin/{choose}/video")
    public String adminVideoByClass(@RequestParam(required = false,defaultValue = "1")Integer page,
                                    @RequestParam(required = false)Integer dv_id,
                                    @RequestParam(required = false)String v_name,
                                    @PathVariable("choose") String choose,
                                    HttpServletRequest request,
                                    Model model){

        // 没有侧边导航栏视频数量session，则查询数据库添加session
        AdminIndex adminIndex = (AdminIndex) request.getSession().getAttribute("adminIndex");
        if (adminIndex!=null){
            adminIndex.setVideo_number(adminIndexService.getVideoNumber().getVideo_number());
            model.addAttribute("adminIndex",adminIndex);
        }

        // 如果有dv_id则说明是删除操作
        if (dv_id != null) adminVideoService.deleteVideoById(dv_id);

        List<AdminVideo> adminVideoList;
        PageInfo pageInfo = null;

        // 如果有v_name则是搜索操作 否则是直接获取视频数据
        if (v_name!=null){
            adminVideoList = adminVideoService.getVideoByVideoName(v_name);
        }else if (choose.equals("all")){
            pageInfo = adminVideoService.getAllVideo(page);
        }else {
            pageInfo = adminVideoService.getVideoByClassName(choose,page);
        }

        model.addAttribute("video_choose_url","admin/"+choose+"/video");
        model.addAttribute("pageInfo",pageInfo);
        model.addAttribute("choose_class",choose);

        return "admin/video";
    }

    @RequestMapping("admin/add")
    public String addVideo(AdminAddVideo adminAddVideo, Model model,HttpServletRequest request){

        String choose = request.getParameter("choose");

        if (adminAddVideo.getV_name()==null){
            model.addAttribute("choose_add",choose);
            return "admin/add";
        }else if(adminAddVideo.getV_id()!=null){
            adminVideoService.updateVideo(adminAddVideo);
            return "redirect:/admin/video";
        }else {
            adminVideoService.insertVideo(adminAddVideo);
            model.addAttribute("choose_class","all");
            return "redirect:/admin/video";
        }

    }

    @RequestMapping(value = "admin/delete",method = RequestMethod.POST,produces = {"application/text;charset=UTF-8"})
    @ResponseBody
    public String deleteVideoById(@RequestBody String v_ids){
        /*前台ajax请求发送json数据到这里*/
        int[] vids = parseJsonVid(v_ids);
        adminVideoService.deleteVideoByIds(vids);

        return "成功删除："+vids.length;
    }

    private int[] parseJsonVid(String v_ids){
        JsonElement jsonElement = new JsonParser().parse(v_ids);
        JsonArray jsonArray = jsonElement.getAsJsonArray();
        int[] vids = new int[jsonArray.size()];

        for (int i = 0; i < jsonArray.size(); i++) {
            vids[i] = jsonArray.get(i).getAsInt();
        }
        return vids;
    }

    @RequestMapping(value = "admin/downloadImg",method = RequestMethod.POST,produces = {"application/text;charset=UTF-8"})
    @ResponseBody
    public String downloadImgById(@RequestBody String v_ids, HttpServletRequest request){

        int[] vids = parseJsonVid(v_ids);
        List<IClass> iClassList = adminVideoService.getVideoByIds(vids);

        int success = 0;

        for (int i = 0; i < iClassList.size(); i++) {

            String imgurl = iClassList.get(i).getImgurl();
            String class_name = iClassList.get(i).getClass_name();
            String downloadurl = iClassList.get(i).getDownload_imgurl();
            int v_id = iClassList.get(i).getV_id();

            if (imgurl.startsWith("images")){
                System.out.println("已缓存至本地图片");
                try {
                    if (downloadurl!=null&&downloadurl!=""){
                        CollectHJ.saveImgurl(downloadurl,
                                request.getRealPath("/")+"images/hj",v_id+".webp");
                        adminVideoService.updateImgById("images/hj/"+v_id+".webp",downloadurl,v_id);
                        success++;
                        continue;
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                    continue;
                }
            }

            if (class_name.equals("韩剧")){
                try {
                    CollectHJ.saveImgurl(imgurl,
                            request.getRealPath("/")+"images/hj",v_id+".webp");
                    adminVideoService.updateImgById("images/hj/"+v_id+".webp",imgurl,v_id);
                    success++;
                }catch (Exception e){
                    e.printStackTrace();
                    System.out.println("下载出错");
                    continue;
                }

            }
        }

        return "成功采集："+success+"个"+" 失败："+(iClassList.size()-success)+"个";

    }


    @RequestMapping("admin/edit/{v_id}")
    public String editVideoById(@PathVariable Integer v_id, Model model){

        AdminAddVideo adminAddVideo = adminVideoService.getEditVideo(v_id);
        adminAddVideo.setV_id(v_id);

        model.addAttribute("adminEditVideo",adminAddVideo);

        return "admin/add";
    }


    @RequestMapping("admin/403")
    public String unauthorized(){

        return "admin/403";
    }



}
