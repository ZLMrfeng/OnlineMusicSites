package com.zl.controller.frontMen;

import com.zl.bean.User;
import com.zl.server.UserServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/frontDesk")
public class UserFrontController {

    @Autowired
    private UserServer userServer;


    @RequestMapping("/editPersonal")
    public String editUserDetail(HttpServletRequest request , HttpServletResponse response  ,User user){

        HttpSession session  = request.getSession();
        if(user != null) {
               boolean success = userServer.updateUser(user);
               if(success){
                   session.setAttribute("msg","修改成功");
                   return "redirect:/frontDesk/findValue/success.jsp";
               }
               else{
                   session.setAttribute("msg","修改失败，请重新检查一下信息");
                   return "redirect:/frontDesk/findValue/fail.jsp";
               }
        }
        return "redirect:/frontDesk/findValue/fail.jsp";
    }

    @RequestMapping("/editPersonalSet")
    public String editUserDetailSet(HttpServletRequest request , HttpServletResponse response, int userId,String countTurePassword,String countNewPassword){
        User user =userServer.getUserById(userId);
        HttpSession session  = request.getSession();
        if(user != null) {
            if(countTurePassword.equals(countNewPassword)) {
                user.setCountPassword(countNewPassword);
                boolean success = userServer.updateUser(user);
                if (success) {
                    session.setAttribute("msg", "修改成功");
                    return "redirect:/frontDesk/findValue/success.jsp";
                } else {
                    session.setAttribute("msg", "修改失败，请重新检查一下信息");
                    return "redirect:/frontDesk/findValue/fail.jsp";
                }
            }
        }
        return "redirect:/frontDesk/findValue/fail.jsp";
    }

    @RequestMapping("/editDetailPersonal")
    public String editUserDetailPeasons(HttpServletRequest request , HttpServletResponse response  ,User user){

        HttpSession session  = request.getSession();
        if(user != null) {
            boolean success = userServer.updateUser(user);
            if(success){
                session.setAttribute("msg","修改成功");
                return "redirect:/frontDesk/findValue/success.jsp";
            }
            else{
                session.setAttribute("msg","修改失败，请重新检查一下信息");
                return "redirect:/frontDesk/findValue/fail.jsp";
            }
        }
        return "redirect:/frontDesk/findValue/fail.jsp";
    }


}
