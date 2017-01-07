package cn.iotweb.service;

import cn.iotweb.dao.FeedBackDao;
import cn.iotweb.model.FeedBack;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by wsx on 2016/10/28.
 */
@Service
public class FeedBackService {
    @Autowired
    private FeedBackDao fbDao;

    public String addFeedBack(FeedBack feedback){
        String result = checkData(feedback);
        if (!result.equals("success"))
            return result;
        if (fbDao.insert(feedback))
            return "success";
        else
            return "数据库操作失败";
    }

    private String checkData(FeedBack feedback){
        if(feedback.getName()!=null&& feedback.getName().trim().isEmpty())
            return "姓名不能为空";
        if(feedback.getEmail()!=null&& feedback.getEmail().trim().isEmpty())
            return "邮箱不能为空";
        if(feedback.getSubject()!=null&& feedback.getSubject().trim().isEmpty())
            return "主题不能为空";
        if(feedback.getContent()!=null&& feedback.getContent().trim().isEmpty())
            return "内容不能为空";
        return "success";
    }

    public List<FeedBack> getFeedBackList() {
        return fbDao.getFeedBackList();
    }

    public String rmoneFeedBack(String id){
        if(fbDao.rmoneFeedback(id))
            return "success";
        return "数据库操作失败";
    }


}
