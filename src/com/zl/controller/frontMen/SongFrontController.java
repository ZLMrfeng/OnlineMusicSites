package com.zl.controller.frontMen;

import com.zl.bean.GeneralWorks;
import com.zl.bean.SpecialWorks;
import com.zl.server.GeneralWorksServer;
import com.zl.server.SpecialWorksServer;
import com.zl.util.PageSystem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/frontDesk")
public class SongFrontController {

    @Autowired
    private GeneralWorksServer generalWorksServer;

    @Autowired
    private SpecialWorksServer specialWorksServer;

    @RequestMapping("/generalList")
    @ResponseBody
    public PageSystem<GeneralWorks> getSongAndSingerList(@RequestParam("page" ) Integer page,@RequestParam("limit") Integer limit){

        List<GeneralWorks> generalWorksList = generalWorksServer.getGeneralList(page,limit);
        System.out.println(generalWorksList);
        int total = generalWorksServer.getGeneralCount();
        int pages = 0;
        if((total % limit) == 0){
            pages = total/limit;
        }else{
            pages = total/limit +1;
        }
        if(page == null || page <=0){
            page=1;
        }
        if(limit == null || limit <=0){
            limit=10;
        }
       Integer start =(page -1)*limit;
         return new PageSystem<GeneralWorks>(total,limit,start,pages,generalWorksList);

    }

    @RequestMapping("/songList")
    @ResponseBody
    public PageSystem<SpecialWorks> getSingerList(@RequestParam("page") Integer page, @RequestParam("limit") Integer limit) {
        List<SpecialWorks> specialWorksList = specialWorksServer.getGeneralList(page, limit);

        System.out.println(specialWorksList + " " + page + " " + limit);
        if (page == null || page <= 0) {
            page = 1;
        }
        if (limit == null || limit <= 0) {
            limit = 6;
        }
        int start = (page - 1) * limit;
        int count = specialWorksServer.getGeneralCount();//获取总条数
        int currentPage = 0;
        if ((count % limit) == 0) {
            currentPage = count / limit;
        } else {
            currentPage = count / limit + 1;
        }
        PageSystem<SpecialWorks> pageSystem = new PageSystem<>(count, limit, start, currentPage, specialWorksList);
        return pageSystem;
    }


    @RequestMapping("/specialPage")
    @ResponseBody
    public PageSystem<SpecialWorks> getSingerByIdLists(@RequestParam("page") Integer page, @RequestParam("limit") Integer limit, @RequestParam("specialId") int specialId){
        List<SpecialWorks> singerList =specialWorksServer.getGeneralByIdList(page,limit,specialId);

        if(page == null || page <=0){
            page=1;
        }
        if(limit == null || limit <=0){
            limit=6;
        }
        int start = (page-1 )* limit;
        int count=specialWorksServer.getCeneralByIdCount(specialId);//获取总条数
        int currentPage=0;
        if((count % limit) == 0){
            currentPage= count /limit;
        }else{
            currentPage= count /limit +1;
        }
        PageSystem<SpecialWorks> pageSystem = new PageSystem<>(count,limit,start,currentPage,singerList);
        return  pageSystem;
    }

    @RequestMapping("specialListById")
    public String getSingerByIdLists(@RequestParam("id") int specialId, Model model){
        if(specialId != 0){
            SpecialWorks specialWorks = specialWorksServer.getSomeThingList(specialId);
            int count = generalWorksServer.getCeneralByIdCount(specialId);
            model.addAttribute("specialWorks",specialWorks);
            model.addAttribute("count",count);
        }
        return "frontDesk/special/specialList";
    }
}
