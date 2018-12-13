package com.zl.controller.frontMen;

import com.zl.bean.GeneralWorks;
import com.zl.bean.Singer;
import com.zl.bean.SongCollection;
import com.zl.bean.SpecialWorks;
import com.zl.server.GeneralWorksServer;
import com.zl.server.SingerServer;
import com.zl.server.SpecialWorksServer;
import com.zl.util.PageSystem;
import com.zl.util.SongListJson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/musicPlayer")
public class MusicController {
    @Autowired
    private GeneralWorksServer generalWorksServer;
   @Autowired
    private SingerServer singerServer;
   @Autowired
   private SpecialWorksServer specialWorksServer;
    @RequestMapping("/songById")
    public ModelAndView songLists(HttpServletRequest request, HttpServletResponse response, @RequestParam("id")int songId){
        ModelAndView modelAndView = new ModelAndView();
       List<GeneralWorks> generalWorksList = generalWorksServer.getGengralWorksId(songId);
         if(generalWorksList != null){
             modelAndView.setViewName("frontDesk/musics/playerlist");
             modelAndView.addObject("generalWorksList",generalWorksList);
             return modelAndView;
         }
        modelAndView.setViewName("frontDesk/findValue/fail");
        modelAndView.addObject("msg","没有该歌曲了");
        return modelAndView;

    }

    @RequestMapping("/songListById")
    @ResponseBody
    public SongListJson<SongCollection> songData(@RequestParam("id") int dataSongId){
        SongListJson<SongCollection> songListJson=null;

        List<GeneralWorks> generalWorksList = generalWorksServer.getGengralWorksId(dataSongId);
        List<SongCollection> songCollectionList =new ArrayList<>();
        if(generalWorksList != null) {
            for(GeneralWorks generalWorks:generalWorksList) {
                String name =generalWorks.getSongName();//歌曲名
                String artist =generalWorks.getSingernameChinese();//获取歌手名
                String url =generalWorks.getSongPath();
                String cover =generalWorks.getSingerImage();//歌手图像
                String lrc =generalWorks.getSongLrc();
                SongCollection songCollection = new SongCollection(name,artist,url,cover,lrc);
                songCollectionList.add(songCollection);
            }
            songListJson= new SongListJson<>(songCollectionList);
            return songListJson;
        }
        SongCollection songs = new SongCollection("摆渡","吕行","../music/吕行 - 摆渡.mp3","cover1.jpg","");
        songCollectionList.add(songs);
        songListJson= new SongListJson<>(songCollectionList);
       return songListJson;
    }


    @RequestMapping("/singerById")
    public String singerData(@RequestParam("id") int singerId,Model model){
        if(singerId != 0){
            Singer singer = singerServer.getSingerById(singerId);
            int count = generalWorksServer.getCeneralByIdCount(singerId);
            model.addAttribute("singer",singer);
            model.addAttribute("count",count);
        }
        return "frontDesk/singers/singerByIdList";
    }
    @RequestMapping("/searchSongList")
    public String searchSongList(HttpServletRequest request,@RequestParam("searchContext") String searchContext){
        HttpSession session = request.getSession();
        if(searchContext != null && !searchContext.equals("")){
            List<GeneralWorks> generalWorksList=generalWorksServer.getSearchList(searchContext);
            List<SpecialWorks> specialWorksList =specialWorksServer.getSearchList(searchContext);
            if (generalWorksList != null && !generalWorksList.isEmpty() ){

                session.setAttribute("generalWorksList",generalWorksList);
                session.setAttribute("searchContext",searchContext);
                session.setAttribute("flag",0);
                if(specialWorksList != null && !specialWorksList.isEmpty()){
                    session.setAttribute("specialWorksList",specialWorksList);
                    session.setAttribute("flags",0);
                    return "frontDesk/searchList";
                }
                else{
                    session.setAttribute("flags",1);
                    session.setAttribute("msg","没有"+searchContext+"查询结果");
                    return "frontDesk/searchList";
                }
            }
            else{
                session.setAttribute("flag",1);
                session.setAttribute("msg","没有"+searchContext+"查询结果");
                session.setAttribute("searchContext",searchContext);
                return "frontDesk/searchList";
            }
        }
        session.setAttribute("flag",1);
        session.setAttribute("searchContext",searchContext);
        session.setAttribute("msg","没有"+searchContext+"查询结果");
        return "frontDesk/searchList";
    }



}

