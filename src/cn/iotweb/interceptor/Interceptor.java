package cn.iotweb.interceptor;

import cn.iotweb.model.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 用户登录拦截器
 * Created by WSL on 2016/10/20.
 */
public class Interceptor implements HandlerInterceptor {

    /**
     * 判断session中是否有值或判断请求是否是login 返回true
     * 否则，返回false
     */
    @Override
    public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object object) throws Exception {
        System.out.println(req.getRequestURI() + "==>" + req.getRequestURL());
        //允许直接通过的
        String[] allow = {
                "/",
                "logout",
                "source",
                "searchSource",
                "getSource",
                "getDownloadOrder",
                "getTimeOrder",
                "download",/*点击下载时允许，方法中判断*/

                "login",
                "register",
                "userRegister",
                "loginConsole",
                "checkloginconsole",
                "checkUIDAvailable",

                "feedback",
                "showpro",
                "shownews",
                "showsubpage",
                "shownewslist",

                "back"};
        for (String temp : allow) {
            if (req.getRequestURL().toString().endsWith(temp)) {
                return true;
            }
        }
        //需登录的

        //未登录，放回false
        User user = (User) req.getSession().getAttribute("user");
        if (null == user) {
            resp.sendRedirect("/");
            return false;
        }
        //登录了，如果是后台请求，用户有权限通过，否则return false
        String[] back = {
                "showfeedback",
                "rmonefeedback",

                "addnews",
                "editnews",
                "managenews",
                "deletenews",

                "addsubpage",
                "editsubpage",
                "deletesubpage",
                "managesubpage",

                "addshowpro",
                "addproajax",

                "uploadfiles",
                "uploadfile",

                "manageuser",
                "updateuser",
                "deleteuser",
                "getalluser",

                "getallsource",
                "managesource",
                "updatesource",
                "deletesource",
                "editsource"
        };
        for (String temp : back) {
            if (req.getRequestURL().toString().endsWith(temp)) {
                if (user.getUrole() != 5) {
                    resp.sendRedirect("/back");
                    return false;
                } else
                    return true;
            }
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
            throws Exception {
    }

    @Override
    public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
            throws Exception {
    }
}
