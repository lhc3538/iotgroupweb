package cn.iotweb.controller;

import cn.iotweb.model.SubPage;
import cn.iotweb.model.User;
import cn.iotweb.service.SubPageService;
import cn.iotweb.service.UserService;
import com.sun.deploy.net.HttpResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * 控制器
 * Created by WSL on 2016/10/21.
 */

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    /**
     * 用户登录控制器
     */
    @RequestMapping(value = "/login")
    public void loginUser(@RequestParam("uid") String uid, @RequestParam("passwd") String passwd, HttpSession session, HttpServletResponse response) {
        try {
            User user = userService.checkLogin(uid, passwd);
            if (null != user) {
                session.setAttribute("user", user);
                response.getWriter().print("true");
            } else {
                response.getWriter().print("false");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 用户注册界面
     */
    @RequestMapping(value = "/register")
    public String register(ModelMap model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (null == user) {
            model.addAttribute("info", "#login");
            model.addAttribute("uname", "登录");
        } else {
            model.addAttribute("info", "#");
            model.addAttribute("uname", user.getUname());
        }
        return "view/register";
    }
    /**
     * 用户注册控制器
     */
    @RequestMapping(value = "/userRegister")
    public void registerUser(HttpServletRequest req, HttpServletResponse response) {
        try {
            response.getWriter().print(userService.saveUserInfo(req));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 用户注册检查用户名是否可用
     *
     * @param uid
     * @param response
     */
    @RequestMapping(value = "/checkUIDAvailable")
    public void checkUIDAvailable(String uid, HttpServletResponse response) {
        try {
            response.getWriter().print(userService.checkUidAvailable(uid) ? "true" : "用户名已存在");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/back")
    public String loginConsole() {
        return "back/loginConsole";
    }

    /**
     * 登录控制台页面
     *
     * @return
     */
    @RequestMapping("/back/checkloginconsole")
    public void loginConsole(@RequestParam("uid") String uid, @RequestParam("passwd") String passwd, HttpSession session, HttpServletResponse resp, ModelMap model) throws IOException {
        User user = userService.checkLoginConsole(uid, passwd);
        if (null != user) {
            model.addAttribute("uname", user.getUname());
            session.setAttribute("user", user);
            resp.getWriter().print("true");
        } else
            resp.getWriter().print("false");
    }

    /**
     * 管理用户界面
     *
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("/back/manageuser")
    public String manageUser(ModelMap model, HttpSession session) {
        model.addAttribute("uname", ((User) session.getAttribute("user")).getUname());
        return "back/manageuser";
    }

    /**
     * 获得所有的用户
     *
     * @return
     */
    @RequestMapping("/back/getalluser")
    @ResponseBody
    public List<User> getAllUser() {
        List<User> list = userService.getAllUser();
        for (User user : list) {
            user.setPasswd("<button class=\"btn btn-default\" onclick=\"editUser('" + user.getUid() + "')\"><i class=\"glyphicon glyphicon-pencil\"></i></button><button class=\"btn btn-default\" onclick=\"deleteUser('" + user.getUid() + "')\"><i class=\"glyphicon glyphicon-trash\"></i></button>");
        }
        return list;
    }

    /**
     * 删除用户
     *
     * @param uid
     */
    @RequestMapping("/back/deleteuser")
    public void deleteUser(String uid, HttpServletResponse resp) throws IOException {
        if (uid.equals("admin"))
            resp.getWriter().print("管理员不可删");
        resp.getWriter().print(userService.deleteUser(uid) ? "删除成功" : "删除失败");
    }

    /**
     * 更新用户资料
     */
    @RequestMapping("/back/updateuser")
    public void updateUser(String uid, HttpServletResponse resp) throws IOException {
        resp.getWriter().print("更新成功");
    }
}
