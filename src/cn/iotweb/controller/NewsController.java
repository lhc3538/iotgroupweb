package cn.iotweb.controller;

import cn.iotweb.model.News;
import cn.iotweb.model.User;
import cn.iotweb.service.NewsService;
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
 * Created by lhc35 on 2016/10/22.
 */
@Controller
@RequestMapping("/")
public class NewsController {
    @Autowired
    NewsService newsService;

    @RequestMapping(value = "back/addnews", method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
    public String judgeOpt(ModelMap model, HttpSession session) {
        model.addAttribute("uname", ((User) session.getAttribute("user")).getUname());
        News news = new News();
        news.setPv(1);
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");//设置日期格式
        String oriDatetime = df.format(new Date());
        news.setDatetime(oriDatetime);
        model.addAttribute("news", news);
        return "back/addnews";
    }

    @RequestMapping(value = "back/addnews", method = RequestMethod.POST)
    @ResponseBody
    public void addNews(News news, HttpSession session, HttpServletResponse response) {
        try {
            news.setUser(((User) session.getAttribute("user")).getUid());
            if (news.getId() == 0) //新增
                response.getWriter().print(newsService.addNews(news));
            else    //修改
                response.getWriter().print(newsService.modifyNews(news));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping(value = "back/editnews", method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
    public String judgeOpt(int id, ModelMap model, HttpSession session) {
        model.addAttribute("uname", ((User) session.getAttribute("user")).getUname());
        News news = newsService.getNewsById(id);
        model.addAttribute("news", news);
        return "back/addnews";
    }

    @RequestMapping(value = "shownews", method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
    public String showNews(@RequestParam int id, ModelMap model, HttpSession session) {
        newsService.updatePv(id);
        User user = (User) session.getAttribute("user");
        if (null == user) {
            model.addAttribute("info", "#login");
            model.addAttribute("uname", "登录");
        } else {
            model.addAttribute("info", "#");
            model.addAttribute("uname", user.getUname());
        }
        model.addAttribute("news", newsService.getNewsById(id));
        return "view/shownews";
    }

    @RequestMapping(value = "shownewslist", method = RequestMethod.GET)
    public String showNewsList(@RequestParam int pageid, @RequestParam String module, ModelMap model, HttpSession session) {
        model.addAttribute("list", newsService.getListByPageid(pageid, module));
        model.addAttribute("module", module);
        model.addAttribute("pageid", pageid);
        User user = (User) session.getAttribute("user");
        if (null == user) {
            model.addAttribute("info", "#login");
            model.addAttribute("uname", "登录");
        } else {
            model.addAttribute("info", "#");
            model.addAttribute("uname", user.getUname());
        }
        return "view/shownewslist";
    }

    @RequestMapping(value = "back/managenews", method = RequestMethod.GET)
    public String manageNews(@RequestParam int pageid, ModelMap model, HttpSession session) {
        model.addAttribute("uname", ((User) session.getAttribute("user")).getUname());
        model.addAttribute("list", newsService.getAllList(pageid));
        model.addAttribute("pageid", pageid);
        return "back/managenews";
    }

    @RequestMapping(value = "back/deletenews", method = RequestMethod.POST)
    public void deleteNews(int id, HttpServletResponse response) {
        try {
            response.getWriter().print(newsService.deleteById(id));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
