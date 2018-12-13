package com.zl.controller.backstage;


import com.alibaba.fastjson.JSONObject;
import com.google.gson.Gson;
import com.zl.bean.Singer;
import com.zl.server.SingerServer;

import com.zl.util.LayuiReplay;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;


import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("/backstage")
public class SingerController {

    @Autowired
    public SingerServer singerServer;


    @RequestMapping("/singerManager")
    @ResponseBody
    public LayuiReplay<Singer> querySingerList(HttpServletResponse response, @RequestParam("page") Integer page, @RequestParam("limit") Integer limit) {
        response.setHeader("Access-Control-Allow-Origin", "*");//解决跨域的问题
        List<Singer> singerList = singerServer.getSingerList(page,limit);

        //return RecycleResult.ok(carouselList);
        //return carouselList;
        Integer count =singerServer.getSingerCount();
        LayuiReplay<Singer> layuiReplay = new LayuiReplay<Singer>(0, "OK", count, singerList);
        return  layuiReplay;

    }

    @RequestMapping("/addSinger")
    @ResponseBody
    public String singerAddList(Singer singer){
        boolean success = singerServer.addSinger(singer);
        String jso="";
        if(success){
            Gson gson = new Gson();
            String json =gson.toJson(singer);
            System.out.println(json);
            jso="{\"code\":200,\"msg\":\"\",\"count\":"+0+",\"data\":"+json+"}";
        }
        return jso;
    }

    @RequestMapping("/singerEdit")
    public @ResponseBody String  singerEdit(Singer singer) {

        Singer song = singerServer.getSingerById(singer.getSingerId());
        if(song == null){
            System.out.println("更新失败");
        }
        String jso="";
        boolean success=singerServer.updateSinger(singer);
        if(success) {

            Gson gson = new Gson();
            String json = gson.toJson(singer);
            System.out.println(json);
            //*****转为layui需要的json格式
            jso = "{\"code\":200,\"msg\":\"\",\"count\":" + 0 + ",\"data\":" + json + "}";
        }
        return jso;
    }


    @RequestMapping("/delSingerManager")
    @ResponseBody
    public String delSongList(HttpServletResponse response, @RequestParam("singerId") Integer singerId){
        response.setHeader("Access-Control-Allow-Origin", "*");//解决跨域的问题
        singerServer.delSinger(singerId);
        JSONObject json = new JSONObject();
        return json.toString();
    }



}
