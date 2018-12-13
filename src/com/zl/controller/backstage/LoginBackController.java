package com.zl.controller.backstage;

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
@RequestMapping("/backstage")
public class LoginBackController {
    @Autowired
    private UserServer userServer;

    @RequestMapping("/exitBackstageSystem")
    public String exitBackstageSystem(HttpServletResponse response,HttpServletRequest request){
        HttpSession session = request.getSession();
        session.removeAttribute("user");
        return "redirect:/frontDesk/logins/loginBack.jsp";
    }
}
