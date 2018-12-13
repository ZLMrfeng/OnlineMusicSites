package com.zl.controller.backstage;

import com.alibaba.fastjson.JSONObject;
import com.google.gson.Gson;
import com.zl.bean.Songs;
import com.zl.server.SongServer;
import com.zl.util.LayuiReplay;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/backstage")
public class SongController {


    @Autowired
   private SongServer songServer;
    @RequestMapping("/songManager")
    @ResponseBody
    public  LayuiReplay<Songs>  querySongList(HttpServletResponse response, @RequestParam("page") Integer page, @RequestParam("limit") Integer limit) {
        response.setHeader("Access-Control-Allow-Origin", "*");//解决跨域的问题
        List<Songs> songsList = songServer.getSongList(page,limit);
        System.out.println(songsList);
        //return RecycleResult.ok(carouselList);
        //return carouselList;
        Integer count =songServer.getSongCount();
        LayuiReplay<Songs> layuiReplay = new LayuiReplay<>(0, "OK", count, songsList);
        return  layuiReplay;

    }

    @RequestMapping("/addSong")
    @ResponseBody
    public String songAddList(Songs songs){
       boolean success = songServer.addSong(songs);
        String jso="";
        if(success){
            Gson gson = new Gson();
            String json =gson.toJson(songs);
            System.out.println(json);
            jso="{\"code\":200,\"msg\":\"\",\"count\":"+0+",\"data\":"+json+"}";
        }
        return jso;
    }

    @RequestMapping("/songEdit")
    public @ResponseBody String  songEdit(Songs songs,
                                                  Map<String, Object> requestMap) {

        Songs song = songServer.getSongById(songs.getSongId());
        if(song == null){
            System.out.println("更新失败");
        }
        String jso="";
        boolean success=songServer.updateSong(songs);
        if(success) {

            Gson gson = new Gson();
            String json = gson.toJson(songs);
            System.out.println(json);
            //*****转为layui需要的json格式
            jso = "{\"code\":200,\"msg\":\"\",\"count\":" + 0 + ",\"data\":" + json + "}";
        }
        return jso;
    }


    @RequestMapping("/delSongManager")
    @ResponseBody
    public String delSongList(HttpServletResponse response, @RequestParam("songId") Integer songId){
        response.setHeader("Access-Control-Allow-Origin", "*");//解决跨域的问题
        songServer.delSong(songId);
        JSONObject json = new JSONObject();
        return json.toString();
    }


}
