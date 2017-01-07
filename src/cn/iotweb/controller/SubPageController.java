package cn.iotweb.controller;

import cn.iotweb.model.News;
import cn.iotweb.model.SubPage;
import cn.iotweb.model.User;
import cn.iotweb.service.NewsService;
import cn.iotweb.service.SubPageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by lhc35 on 2016/11/10.
 */
@Controller
@RequestMapping("/")
public class SubPageController {
    @Autowired
    SubPageService subPageService;

    /**
     * 访问添加页面
     *
     * @param model
     * @param session
     * @return
     */
    @RequestMapping(value = "back/addsubpage", method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
    public String judgeOpt(ModelMap model, HttpSession session) {
        SubPage subPage = new SubPage();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");//设置日期格式
        String oriDatetime = df.format(new Date());
        subPage.setDatetime(oriDatetime);
        model.addAttribute("subPage", subPage);
        model.addAttribute("uname", ((User) session.getAttribute("user")).getUname());
        return "back/addsubpage";
    }

    /**
     * 处理提交添加的post请求
     *
     * @param subPage
     * @param session
     * @param response
     */
    @RequestMapping(value = "back/addsubpage", method = RequestMethod.POST)
    @ResponseBody
    public void addSubPage(SubPage subPage, HttpSession session, HttpServletResponse response) {
        try {
            subPage.setUser(((User) session.getAttribute("user")).getUid());
            if (subPage.getId() == 0) //新增
                response.getWriter().print(subPageService.addSubPage(subPage));
            else    //修改
                response.getWriter().print(subPageService.modifySubPage(subPage));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 展示子页面
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "showsubpage", method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
    public String showNews(@RequestParam int id, ModelMap model, HttpSession session) {
        model.addAttribute("subpage", subPageService.getSubPageById(id));
        User user = (User) session.getAttribute("user");
        if (null == user) {
            model.addAttribute("info", "#login");
            model.addAttribute("uname", "登录");
        } else {
            model.addAttribute("info", "#");
            model.addAttribute("uname", user.getUname());
        }
        return "view/showsubpage";
    }

    /**
     * 管理子页面
     *
     * @param pageid
     * @param model
     * @param session
     * @return
     */
    @RequestMapping(value = "back/managesubpage", method = RequestMethod.GET)
    public String manageNews(@RequestParam int pageid, ModelMap model, HttpSession session) {
        model.addAttribute("uname", ((User) session.getAttribute("user")).getUname());
        model.addAttribute("list", subPageService.getAllList(pageid));
        model.addAttribute("pageid", pageid);
        return "back/managesubpage";
    }

    /**
     * 编辑子页面
     *
     * @param id
     * @param model
     * @param session
     * @return
     */
    @RequestMapping(value = "back/editsubpage", method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
    public String judgeOpt(int id, ModelMap model, HttpSession session) {
        model.addAttribute("uname", ((User) session.getAttribute("user")).getUname());
        SubPage subPage = subPageService.getSubPageById(id);
        model.addAttribute("subPage", subPage);
        return "back/addsubpage";
    }

    /**
     * 删除子页面
     *
     * @param id
     * @param response
     */
    @RequestMapping(value = "back/deletesubpage", method = RequestMethod.POST)
    public void deleteNews(int id, HttpServletResponse response) {
        try {
            response.getWriter().print(subPageService.deleteById(id));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
