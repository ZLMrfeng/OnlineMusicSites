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
                session.setAttribute("msg","ע��ɹ�,���Ե�¼��");
                return "/frontDesk/logins/login";
            }
            else{
                session.setAttribute("msg","ע��ʧ�ܣ����������ڽ���ע�����");
                return "/frontDesk/register/registers";
            }

        }
        session.setAttribute("msg","���������ڽ���ע�����");
        return "/frontDesk/register/registers";
    }
}
