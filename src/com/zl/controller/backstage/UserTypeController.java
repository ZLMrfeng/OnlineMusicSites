package com.zl.controller.backstage;

import com.alibaba.fastjson.JSONObject;
import com.google.gson.Gson;
import com.zl.bean.UserType;
import com.zl.server.UserTypeServer;
import com.zl.util.LayuiReplay;
import com.zl.util.PageSystem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("/backstage")
public class UserTypeController {
    @Autowired
    private UserTypeServer userTypeServer;
    @RequestMapping("/userTypeManager")
    @ResponseBody
    public LayuiReplay<UserType> queryUserTypeList(HttpServletResponse response, @RequestParam("page") Integer page, @RequestParam("limit") Integer limit) {
        response.setHeader("Access-Control-Allow-Origin", "*");//解决跨域的问题
        List<UserType> userTypeList = userTypeServer.getUserTypeList(page,limit);

        Integer count =userTypeServer.getUserTypeCount();//获取总条数

        LayuiReplay<UserType> LayuiReplay = new LayuiReplay<>(0,"ok",count,userTypeList);

        return LayuiReplay;
    }

    @RequestMapping("/userTypeAdd")
    @ResponseBody
    public String userTypeAddList(UserType userType){

        boolean success = userTypeServer.addUserType(userType);
        String jso="";
        if(success){
            Gson gson = new Gson();
            String json =gson.toJson(userType);
            System.out.println(json);
            jso="{\"code\":200,\"msg\":\"\",\"count\":"+0+",\"data\":"+json+"}";
        }
        return jso;
    }

    @RequestMapping("/userTypeEdit")
    public @ResponseBody String  userTypeedit(UserType userType) {

        UserType  userId = userTypeServer.getUserTypeById(userType.getUserTypeId());
        if(userId == null){
            System.out.println("更新失败");
        }
        String jso="";
        boolean success=userTypeServer.updateUserType(userType);
        if(success) {

            Gson gson = new Gson();
            String json = gson.toJson(userType);
            System.out.println(json);
            //*****转为layui需要的json格式
            jso = "{\"code\":200,\"msg\":\"\",\"count\":" + 0 + ",\"data\":" + json + "}";
        }
        return jso;
    }


    @RequestMapping("/delUserTypeManager")
    @ResponseBody
    public String delUserList(HttpServletResponse response, @RequestParam("userTypeId") Integer userTypeId){
        response.setHeader("Access-Control-Allow-Origin", "*");//解决跨域的问题
        userTypeServer.delUserType(userTypeId);
        JSONObject json = new JSONObject();
        return json.toString();
    }




}
