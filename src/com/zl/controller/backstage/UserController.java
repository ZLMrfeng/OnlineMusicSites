package com.zl.controller.backstage;


import com.alibaba.fastjson.JSONObject;
import com.google.gson.Gson;
import com.zl.bean.User;
import com.zl.server.UserServer;
import com.zl.util.LayuiReplay;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;



@Controller
@RequestMapping("/backstage")
public class UserController {

    @Autowired
    private UserServer userServer;
     @RequestMapping("/UserManager")
     @ResponseBody
    public LayuiReplay<User> queryCarouselList(HttpServletResponse response, @RequestParam("page") Integer page, @RequestParam("limit") Integer limit) {
        response.setHeader("Access-Control-Allow-Origin", "*");//解决跨域的问题
        List<User> carouselList = userServer.getUserList(page,limit);

        //return RecycleResult.ok(carouselList);
        //return carouselList;
        Integer count = userServer.getUserCount();
         LayuiReplay<User> layuiReplay = new LayuiReplay<>(0, "OK", count, carouselList);
        return layuiReplay;
    }

    @RequestMapping("/userAdd")
    @ResponseBody
    public String userAddList(User user){
         System.out.println(user.toString());
         boolean success = userServer.addUser(user);
         String jso="";
         if(success){
             Gson gson = new Gson();
             String json =gson.toJson(user);
             System.out.println(json);
             jso="{\"code\":200,\"msg\":\"\",\"count\":"+0+",\"data\":"+json+"}";
         }
         return jso;
    }

    @RequestMapping("/userEdit")
    public @ResponseBody String  informationedit( User user,
                                                 Map<String, Object> requestMap) {
        System.out.println(user.getUserId());
         Integer userId =user.getUserId();
        if(userId == 0){
            System.out.println("更新失败");
        }
        String jso="";
        boolean success=userServer.updateUser(user);
        if(success) {

            Gson gson = new Gson();
            String json = gson.toJson(user);
            System.out.println(json);
            //*****转为layui需要的json格式
            jso = "{\"code\":200,\"msg\":\"\",\"count\":" + 0 + ",\"data\":" + json + "}";
        }
        return jso;
    }


    @RequestMapping("/delUserManager")
    @ResponseBody
    public String delUserList(HttpServletResponse response, @RequestParam("userId") Integer userId){
        response.setHeader("Access-Control-Allow-Origin", "*");//解决跨域的问题
        userServer.delUser(userId);
        JSONObject json = new JSONObject();
         return json.toString();
    }

    @RequestMapping("/userByIdSystem")
    @ResponseBody
    public LayuiReplay<User> userByIdList(HttpServletResponse response, @RequestParam("userId")Integer userId) {
        response.setHeader("Access-Control-Allow-Origin", "*");//解决跨域的问题
        User user = userServer.getUserById(userId);
         List<User> carouselList = new ArrayList<>();
        carouselList.add(user);
        //return RecycleResult.ok(carouselList);
        //return carouselList;
        Integer count = userServer.getUserCount();
        LayuiReplay<User> layuiReplay = new LayuiReplay<>(0, "OK", count, carouselList);
        return layuiReplay;
    }

    @RequestMapping("/userDetail")
    public String userDetailList(HttpServletResponse response, HttpServletRequest request,@RequestParam("id") int userId){
         User user = userServer.getUserById(userId);
        HttpSession session =request.getSession();
        if(user != null){
             session.setAttribute("user",user);
             return "redirect:/frontDesk/person/userDetailSet.jsp";
         }
         return "redirect:/index.jsp";
    }
    @RequestMapping("/userDetails")
    public String userDetailsList(HttpServletResponse response, HttpServletRequest request,@RequestParam("id") int userId){
        User user = userServer.getUserById(userId);
        HttpSession session =request.getSession();
        if(user != null){
            session.setAttribute("user",user);
            return "redirect:/frontDesk/person/userPasswordSet.jsp";
        }
        return "redirect:/index.jsp";
    }
    @RequestMapping("/userCenter")
    public String userDetailLists(HttpServletResponse response, HttpServletRequest request,@RequestParam("id") int userId){
        User user = userServer.getUserById(userId);
        HttpSession session =request.getSession();
        if(user != null){
            session.setAttribute("user",user);
            return "redirect:/frontDesk/person/personalcenter.jsp";
        }
        return "redirect:/index.jsp";
    }

    @RequestMapping("/searchUserList")
    public String searchUserList(HttpServletRequest request,@RequestParam("userName") String userName){

         HttpSession session = request.getSession();
         if(userName !=  null && ! userName.equals("")){
             List<User> userList =userServer.getUserListOver(userName);
             if(userList != null && !userList.isEmpty()){
                 session.setAttribute("userList",userList);
                 session.setAttribute("searchText",userName);
                 return "backstage/user/searchUserList";
             }
             else{
                 session.setAttribute("msg","没有"+userName+"内容");
                 return "backstage/user/searchUserList";
             }
         }
         session.setAttribute("msg","没有"+userName+"内容");
        return "backstage/user/searchUserList";
    }
}
