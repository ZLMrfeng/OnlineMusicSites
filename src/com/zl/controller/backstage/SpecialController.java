package com.zl.controller.backstage;

import com.alibaba.fastjson.JSONObject;
import com.google.gson.Gson;
import com.zl.bean.Special;
import com.zl.server.SpecialServer;
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
public class SpecialController {
    @Autowired
    private SpecialServer specialServer;
    @RequestMapping("/specialManager")
    @ResponseBody
    public LayuiReplay<Special>  querySpecialList(HttpServletResponse response, @RequestParam("page") Integer page, @RequestParam("limit") Integer limit) {
        response.setHeader("Access-Control-Allow-Origin", "*");//解决跨域的问题
        List<Special> specialList = specialServer.getSpecialList(page,limit);

        //return RecycleResult.ok(carouselList);
        //return carouselList;
        Integer count = specialServer.getSpecialCount();
        LayuiReplay<Special> layuiReplay = new LayuiReplay<>(0, "OK", count, specialList);
        return layuiReplay;

    }

    @RequestMapping("/specialAdd")
    @ResponseBody
    public String specialAddList(Special special){

        boolean success = specialServer.addSpecial(special);
        String jso="";
        if(success){
            Gson gson = new Gson();
            String json =gson.toJson(special);
            System.out.println(json);
            jso="{\"code\":200,\"msg\":\"\",\"count\":"+0+",\"data\":"+json+"}";
        }
        return jso;
    }

    @RequestMapping("/specialEdit")
    public @ResponseBody String  specialEdit(Special special ) {

        Special specials = specialServer.getSpecialById(special.getSpecialId());
        if(specials == null){
            System.out.println("更新失败");
        }
        String jso="";
        boolean success=specialServer.updateSpecial(special);
        if(success) {

            Gson gson = new Gson();
            String json = gson.toJson(special);
            System.out.println(json);
            //*****转为layui需要的json格式
            jso = "{\"code\":200,\"msg\":\"\",\"count\":" + 0 + ",\"data\":" + json + "}";
        }
        return jso;
    }


    @RequestMapping("/delSpecialManager")
    @ResponseBody
    public String delSpecialList(HttpServletResponse response, @RequestParam("specialId") Integer specialId){
        response.setHeader("Access-Control-Allow-Origin", "*");//解决跨域的问题
        specialServer.delSpecial(specialId);
        JSONObject json = new JSONObject();
        return json.toString();
    }




}
