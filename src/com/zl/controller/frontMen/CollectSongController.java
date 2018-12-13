package com.zl.controller.frontMen;


import com.zl.bean.CollectSong;
import com.zl.bean.GeneralWorks;
import com.zl.bean.Singer;
import com.zl.server.CollectSongServer;
import com.zl.server.GeneralWorksServer;
import com.zl.server.SingerServer;
import com.zl.util.PageSystem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

import static jdk.nashorn.internal.objects.Global.println;


@Controller
@RequestMapping("/frontDesk")
public class CollectSongController {

    @Autowired
    private CollectSongServer collectSongServer;
    @Autowired
    private GeneralWorksServer generalWorksServer;
    @Autowired
    private SingerServer singerServer;

    @RequestMapping("/collectSongList")
    public String addData(HttpServletRequest request, @RequestParam("id") int singerId, @RequestParam("name") int userId) {

        CollectSong collectSong = new CollectSong(singerId, userId);
        HttpSession session = request.getSession();
        boolean success = collectSongServer.addCollectSong(collectSong);
        if (success) {
            session.setAttribute("msg", "收藏成功");
            return "/frontDesk/findValue/success";
        }
        session.setAttribute("msg", "收藏失败");
        return "/frontDesk/findValue/fail";
    }

    @RequestMapping("/collectSong1List")
    public String addDatas(HttpServletRequest request, @RequestParam("id") int songId, @RequestParam("name") int userId) {

        CollectSong collectSong = new CollectSong( 0,userId,songId);
        System.out.println(collectSong);
        HttpSession session = request.getSession();
        boolean success = collectSongServer.addCollectSong(collectSong);
        if (success) {
            session.setAttribute("msg", "收藏成功");
            return "/frontDesk/findValue/success";
        }
        session.setAttribute("msg", "收藏失败");
        return "/frontDesk/findValue/fail";
    }

    @RequestMapping("/collectionList")
    @ResponseBody
    public PageSystem<Singer> getSingerByIdLists(@RequestParam("page") Integer page, @RequestParam("limit") Integer limit, @RequestParam("userId") int userId) {

        List<Singer> singerList = new ArrayList<>();
        List<GeneralWorks> songList = new ArrayList<>();
        List<CollectSong> collectSongList = collectSongServer.getCollectSongList(page, limit, userId);

        for (CollectSong collectSong : collectSongList) {
            Singer singer = singerServer.getSingerById(collectSong.getSingerId());
            GeneralWorks generalWorksSong = generalWorksServer.getGengralWorksBySingerId(collectSong.getSongId());
            singerList.add(singer);
            songList.add(generalWorksSong);
        }
        System.out.println(singerList);
        if (page == null || page <= 0) {
            page = 1;
        }
        if (limit == null || limit <= 0) {
            limit = 6;
        }
        int start = (page - 1) * limit;
        int count = singerList.size();//获取总条数
        int currentPage = 0;
        if ((count % limit) == 0) {
            currentPage = count / limit;
        } else {
            currentPage = count / limit + 1;
        }
        PageSystem<Singer> pageSystem = new PageSystem<>(count, limit, start, currentPage, singerList);
        return pageSystem;
    }

    @RequestMapping("/collectionListSong")
    @ResponseBody
    public PageSystem<GeneralWorks> getSongByIdLists(@RequestParam("page") Integer page, @RequestParam("limit") Integer limit, @RequestParam("userId") int userId) {


        List<GeneralWorks> songList = new ArrayList<>();
        List<CollectSong> collectSongList = collectSongServer.getCollectSongList(page, limit, userId);

        for (CollectSong collectSong : collectSongList) {
            GeneralWorks generalWorksSong = generalWorksServer.getGengralWorksById(collectSong.getSongId());

            songList.add(generalWorksSong);
        }

        if (page == null || page <= 0) {
            page = 1;
        }
        if (limit == null || limit <= 0) {
            limit = 6;
        }
        int start = (page - 1) * limit;
        int count = songList.size();//获取总条数
        int currentPage = 0;
        if ((count % limit) == 0) {
            currentPage = count / limit;
        } else {
            currentPage = count / limit + 1;
        }
        PageSystem<GeneralWorks> pageSystem = new PageSystem<>(count, limit, start, currentPage, songList);
        return pageSystem;
    }
}
