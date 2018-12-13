package com.zl.controller.frontMen;


import com.zl.bean.User;
import com.zl.server.UserServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class RegisterController {

    @Autowired
    private UserServer userServer;

    @RequestMapping("/registerUser")
    public String  registerUser(HttpServletRequest request, User user){
        HttpSession session = request.getSession();
        if(user != null){
            boolean success = userServer.addUser(user);
            if(success){
                session.setAttribute("msg","注册成功,可以登录了");
                return "/frontDesk/logins/login";
            }
            else{
                session.setAttribute("msg","注册失败，请检查数据在进行注册操作");
                return "/frontDesk/register/registers";
            }

        }
        session.setAttribute("msg","请检查数据在进行注册操作");
        return "/frontDesk/register/registers";
    }
}
