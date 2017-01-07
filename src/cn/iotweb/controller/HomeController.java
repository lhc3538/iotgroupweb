package cn.iotweb.controller;

import cn.iotweb.model.Home;
import cn.iotweb.model.User;
import cn.iotweb.service.HomeService;
import cn.iotweb.service.ShowProService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by lhc35 on 2016/10/27.
 */
@Controller
@RequestMapping("/")
public class HomeController {
    @Autowired
    private HomeService homeService;
    @Autowired
    ShowProService spservice;

    @RequestMapping(value = "", method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
    public String judgeOpt(ModelMap model, HttpSession session) {
        Home home = homeService.getHomeInfo();
        model.addAttribute("home", home);
        model.addAttribute("prolist", spservice.getshowprolist());
        User user = (User) session.getAttribute("user");
        if (null == user) {
            model.addAttribute("info", "#login");
            model.addAttribute("uname", "登录");
        } else {
            model.addAttribute("info", "#");
            model.addAttribute("uname", user.getUname());
        }
        return "view/index";
    }

    @RequestMapping(value = "logout")
    public String Logout(ModelMap model, HttpSession session) {
        session.removeAttribute("user");
        Home home = homeService.getHomeInfo();
        model.addAttribute("home", home);
        model.addAttribute("prolist", spservice.getshowprolist());
        User user = (User) session.getAttribute("user");
        if (null == user) {
            model.addAttribute("info", "#login");
            model.addAttribute("uname", "登录");
        }
        return "view/index";
    }
}
