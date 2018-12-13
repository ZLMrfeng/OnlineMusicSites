package com.zl.controller.frontMen;


import com.zl.bean.GeneralWorks;
import com.zl.bean.Singer;
import com.zl.server.GeneralWorksServer;
import com.zl.server.SingerServer;
import com.zl.util.PageSystem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/frontDesk")
public class SingerFrontController {

    @Autowired
    public SingerServer singerServer;

    @Autowired
    private GeneralWorksServer generalWorksServer;
    @RequestMapping("/index")
    @ResponseBody
    public PageSystem<Singer> getSingerList(@RequestParam("page") Integer page, @RequestParam("limit") Integer limit){
        List<Singer> singerList = singerServer.getSingerList(page,limit);

        System.out.println(singerList+" "+page+" "+limit);
        if(page == null || page <=0){
            page=1;
        }
        if(limit == null || limit <=0){
            limit=6;
        }
        int start = (page-1 )* limit;
        int count=singerServer.getSingerCount();//获取总条数
        int currentPage=0;
        if((count % limit) == 0){
            currentPage= count /limit;
        }else{
            currentPage= count /limit +1;
        }
        PageSystem<Singer> pageSystem = new PageSystem<Singer>(count,limit,start,currentPage,singerList);
        return  pageSystem;
    }

    @RequestMapping("singerListById")
   public String getSingerByIdList(@RequestParam("id") int singerId, Model model){
        if(singerId != 0){
            Singer singer = singerServer.getSingerById(singerId);
            int count = generalWorksServer.getCeneralByIdCount(singerId);
            model.addAttribute("singer",singer);
            model.addAttribute("count",count);
        }
        return "frontDesk/singers/singerByIdList";
   }

    @RequestMapping("/personalPage")
    @ResponseBody
    public PageSystem<GeneralWorks> getSingerByIdLists(@RequestParam("page") Integer page, @RequestParam("limit") Integer limit, @RequestParam("singerId") int singerId){
        List<GeneralWorks> singerList =generalWorksServer.getGeneralByIdList(page,limit,singerId);
        System.out.println(singerList);
        if(page == null || page <=0){
            page=1;
        }
        if(limit == null || limit <=0){
            limit=6;
        }
        int start = (page-1 )* limit;
        int count=generalWorksServer.getCeneralByIdCount(singerId);//获取总条数
        int currentPage=0;
        if((count % limit) == 0){
            currentPage= count /limit;
        }else{
            currentPage= count /limit +1;
        }
        PageSystem<GeneralWorks> pageSystem = new PageSystem<>(count,limit,start,currentPage,singerList);
        return  pageSystem;
    }


    @RequestMapping("/singerCollection")
    public String getSingerCollection(HttpServletRequest request , @RequestParam("page")int page, @RequestParam("limit") int limit){
        HttpSession session = request.getSession();
        List<Singer> singerList = singerServer.getSingerList(page,limit);
        int total =0;
        int pages =0;
        if(singerList != null && !singerList.isEmpty()){
            total = singerServer.getSingerCount();//获取总条数
            pages = (page - 1)*limit;//开始页面
            int totalCount = 0;//有多少页
            if((total % limit) ==0){
                totalCount =total / limit;
            }else{
                totalCount =total / limit+1;
            }
            PageSystem<Singer> pageSystem = new PageSystem<>(4,total,limit,pages,totalCount,singerList);
            session.setAttribute("pageSystem",pageSystem);
            return  "frontDesk/singers/singerList";
        }
        session.setAttribute("msg","没有歌手数据");
        return  "frontDesk/singers/singerList";
    }

}
