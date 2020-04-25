package cn.bcat.hanju.admin.controller;

import cn.bcat.hanju.admin.service.AdminIndexService;
import cn.bcat.hanju.admin.service.AdminVideoService;
import cn.bcat.hanju.pojo.admin.AdminIndex;
import cn.bcat.hanju.pojo.web.IClass;
import cn.bcat.hanju.util.DownloadThread;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@SessionAttributes({"adminIndex"})
public class AdminIndexController {

    @Autowired
    private AdminIndexService adminIndexService;

    @Autowired
    private AdminVideoService adminVideoService;


    @RequestMapping(value = {"admin/index","admin"})
    public String adminIndex(Model model){

        AdminIndex adminIndex = new AdminIndex() ;
        adminIndex.setMenber_number(adminIndexService.getMenberNumber().getMenber_number());
        adminIndex.setVideo_number(adminIndexService.getVideoNumber().getVideo_number());
        adminIndex.setVisit_number(adminIndexService.getVisitNumber().getVisit_number());
        adminIndex.setCollection_number(adminIndexService.getCollectionNumber().getCollection_number());
        adminIndex.setHj_number(adminIndexService.getClassNumberByName("韩剧"));
        adminIndex.setZy_number(adminIndexService.getClassNumberByName("综艺"));
        adminIndex.setDy_number(adminIndexService.getClassNumberByName("电影"));

        int v = adminIndex.getVideo_number();
        int hj = adminIndex.getHj_number();
        int zy = adminIndex.getZy_number();
        int dy = adminIndex.getDy_number();

        Map map = new HashMap();
        map.put("hj",((double)hj/v)*100+"%");
        map.put("zy",((double)zy/v)*100+"%");
        map.put("dy",((double)dy/v)*100+"%");

        model.addAttribute("adminIndex",adminIndex);
        model.addAttribute("press",map);

        return "admin/index";
    }


    @RequestMapping(value = "admin/downloadImgByClass",produces = {"application/text;charset=UTF-8"})
    @ResponseBody
    public String downloadImg(@RequestParam String class_name,
                              HttpServletRequest request){

        System.out.println("===================");
        int count = 0;
        int success = 0;
        int error = 0;

        if (class_name.equals("hj")){
            int[] vids = adminIndexService.getVidsByClassName("韩剧");
            List<IClass> iClassList = adminVideoService.getVideoByIds(vids);


            while (count<iClassList.size()){
                for (int i = 1; i < 6; i++) {

                    DownloadThread downloadThread = new DownloadThread();
                    downloadThread.setAdminVideoService(adminVideoService);
                    downloadThread.setiClassList(iClassList);
                    downloadThread.setRequest(request);
                    downloadThread.setCount(count);
                    downloadThread.setError(error);
                    downloadThread.setSuccess(success);

                    new Thread(downloadThread).start();

                    count++;
                }
            }
            System.out.println(" ");

        }

        while (Thread.activeCount()<=1){
            return "success : " + success + " error : " + error ;
        }
        return "success : " + success + " error : " + error ;
    }

}

