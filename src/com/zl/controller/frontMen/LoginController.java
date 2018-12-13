package com.zl.controller.frontMen;

import com.zl.bean.User;
import com.zl.server.UserServer;
import com.zl.util.StringEmpty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.util.Random;

@Controller
@RequestMapping("/frontDesk")
public class LoginController {
    @Autowired
    private UserServer userServer;

    @RequestMapping("/login")
    public String login(HttpServletRequest request, HttpServletResponse response, Model model) {
        HttpSession session = request.getSession();
        String countName = request.getParameter("countName");
        String countPassword = request.getParameter("countPassword");
        String code = request.getParameter("code");
        String picode = (String) request.getSession().getAttribute("piccode");
        String checkCode = code.toUpperCase();
        User user = new User();
        user.setCountName(countName);
        user.setCountPassword(countPassword);
       /* if (StringEmpty.isEmpty(countName)) {
            if (StringEmpty.isEmpty(countPassword)) {
                if (StringEmpty.isEmpty(code)) {
                    User userName = userServer.getUserName(user);
                    if (userName != null) {
                        session.setAttribute("user", userName);
                        return "redirect:/index.jsp";
                    } else {
                        session.setAttribute("msg", "输入的信息有没查到误请重新输入");
                        return "redirect:/frontDesk/logins/login.jsp";
                    }
                }
                else{
                    session.setAttribute("msg", "输入的验证码有误请重新输入");
                    return "redirect:/frontDesk/logins/login.jsp";
                }
            } else {
                session.setAttribute("msg", "输入的信息有密码误请重新输入");
                return "redirect:/frontDesk/logins/login.jsp";
            }
        }*/
       if(userCheck(countName,countPassword,code)){
           if(checkCode.equals(picode)) {
               User userName = userServer.getUserName(user);
               if (userName != null) {
                   session.setAttribute("user", userName);
                   return "redirect:/index.jsp";
               } else {
                   session.setAttribute("msg", "输入的信息有没查到误请重新输入");
                   return "redirect:/frontDesk/logins/login.jsp";
               }
           }
           else{
               session.setAttribute("msg", "验证码不正确,重新输入");
               return "redirect:/frontDesk/logins/login.jsp";
           }
       }
        session.setAttribute("msg", "输入的信息都不对误请重新输入");
        return "redirect:/frontDesk/logins/login.jsp";
    }

    @RequestMapping("/ImageServlet")
    public void ImageCode(HttpServletRequest request, HttpServletResponse response) {
        BufferedImage bi = new BufferedImage(68, 22, BufferedImage.TYPE_INT_RGB);
        Graphics g = bi.getGraphics();
        Color c = new Color(200, 150, 255);
        g.setColor(c);
        g.fillRect(0, 0, 68, 22);

        char[] ch = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".toCharArray();
        Random r = new Random();
        int len = ch.length, index;
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < 4; i++) {
            index = r.nextInt(len);
            g.setColor(new Color(r.nextInt(88), r.nextInt(188), r.nextInt(255)));
            g.drawString(ch[index] + "", (i * 15) + 3, 18);
            sb.append(ch[index]);
        }
        request.getSession().setAttribute("piccode", sb.toString());
        try {
            ImageIO.write(bi, "JPG", response.getOutputStream());
        } catch (Exception e) {

        }
    }

    @RequestMapping("/loginBack")
    public String loginBack(HttpServletRequest request, HttpServletResponse response, Model model) {
        HttpSession session = request.getSession();
        String countName = request.getParameter("countName");
        String countPassword = request.getParameter("countPassword");
        String code = request.getParameter("code");
        String picode = (String) request.getSession().getAttribute("piccode");
        String checkCode = code.toUpperCase();
        User user = new User();
        user.setCountName(countName);
        user.setCountPassword(countPassword);

        if(userCheck(countName,countPassword,code)){
            User userName = userServer.getUserName(user);
            if (userName != null) {
                session.setAttribute("user", userName);
                return "redirect:/backstage/BackStage.jsp";
            } else {
                session.setAttribute("msg", "输入的信息有没查到误请重新输入");
                return "redirect:/frontDesk/logins/loginBack.jsp";
            }
        }
        session.setAttribute("msg", "输入的信息都不对误请重新输入");
        return "redirect:/frontDesk/logins/loginBack.jsp";
    }
    @RequestMapping("/exitSystem")
    public String exitSystem(HttpServletResponse response,HttpServletRequest request){
        HttpSession session = request.getSession();
         session.removeAttribute("user");
        return "redirect:/index.jsp";
    }


    public static boolean userCheck(String countName,String countPassword, String code){
        if (StringEmpty.isEmpty(countName)) {
            if (StringEmpty.isEmpty(countPassword)) {
                if (StringEmpty.isEmpty(code)) {
                    return true;
                }
                else{
                    return false;
                }
            }
            else{
                return false;
            }
        }
            return false;
    }


    @RequestMapping("/exitBackstageSystem")
    public String exitBackstageSystem(HttpServletResponse response,HttpServletRequest request){
        HttpSession session = request.getSession();
        session.removeAttribute("user");
        return "redirect:/frontDesk/logins/login.jsp";
    }

    @RequestMapping("/register")
    public String checkRegister(){
        return "/frontDesk/register/registers";
    }
}
