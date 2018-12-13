package com.zl.controller.backstage;

import com.alibaba.fastjson.JSONObject;
import com.google.gson.Gson;
import com.zl.bean.Information;
import com.zl.server.InformationServer;
import com.zl.util.LayuiReplay;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/backstage")
public class InformationController {

    @Autowired
    private InformationServer informationServer;
    @RequestMapping("/informationManager")
    @ResponseBody
    public LayuiReplay<Information> queryCarouselList(HttpServletResponse response, @RequestParam("page") Integer page, @RequestParam("limit") Integer limit) {
        response.setHeader("Access-Control-Allow-Origin", "*");//解决跨域的问题
        List<Information> informationList = informationServer.getInformationList(page,limit);

        //return RecycleResult.ok(carouselList);
        //return carouselList;
        Integer count = informationServer.countInformation();
        LayuiReplay<Information> layuiReplay = new LayuiReplay<>(0, "OK", count, informationList);
        return layuiReplay;
    }

    @RequestMapping("/addInformation")
    @ResponseBody
    public String informationAddList(Information information){
        System.out.println(information.toString());
        boolean success = informationServer.addInformation(information);
        String jso="";
        if(success){
            Gson gson = new Gson();
            String json =gson.toJson(information);
            System.out.println(json);
            jso="{\"code\":200,\"msg\":\"\",\"count\":"+0+",\"data\":"+json+"}";
        }
        return jso;
    }

    @RequestMapping("/informationEdit")
    public @ResponseBody String  informationedit( Information information,
                                                  Map<String, Object> requestMap) {

         Information im =informationServer.getInformationById(information.getInformationId());
        if(im == null){
            System.out.println("更新失败");
        }
        String jso="";
        boolean success=informationServer.updateInformation(information);
        if(success) {

            Gson gson = new Gson();
            String json = gson.toJson(information);
            System.out.println(json);
            //*****转为layui需要的json格式
            jso = "{\"code\":200,\"msg\":\"\",\"count\":" + 0 + ",\"data\":" + json + "}";
        }
        return jso;
    }


    @RequestMapping("/delInformationManager")
    @ResponseBody
    public String delUserList(HttpServletResponse response, @RequestParam("informationId") Integer informationId){
        response.setHeader("Access-Control-Allow-Origin", "*");//解决跨域的问题
        informationServer.delInformation(informationId);
        JSONObject json = new JSONObject();
        return json.toString();
    }


}
