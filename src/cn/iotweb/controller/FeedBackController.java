package cn.iotweb.controller;

import cn.iotweb.model.FeedBack;
import cn.iotweb.service.FeedBackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


/**
 * Created by wsx on 2016/10/25.
 */
@Controller
public class FeedBackController {
    @Autowired
    FeedBackService fbservice = new FeedBackService();

    @RequestMapping(value = "/feedback", method = RequestMethod.POST)
    public void sb_feedback(FeedBack fb, HttpServletResponse response) {
        try {
            response.getWriter().print(fbservice.addFeedBack(fb));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping(value = "/back/showfeedback")
    public String seefeedback(ModelMap model) {
        model.addAttribute("feedbacklist", fbservice.getFeedBackList());
        return "back/showfeedback";
    }

    @RequestMapping(value = "/back/rmonefeedback", method = RequestMethod.POST)
    public void rmonefeedback(HttpServletRequest req, HttpServletResponse resp) {
        try {
            String id = req.getParameter("id");
            resp.getWriter().print(fbservice.rmoneFeedBack(id));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
