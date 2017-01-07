package cn.iotweb.service;

import cn.iotweb.dao.NewsDao;
import cn.iotweb.model.News;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by lhc35 on 2016/10/26.
 */
@Service
public class NewsService {
    @Autowired
    private NewsDao newsDao;

    public String addNews(News news) {
        String result = checkData(news);
        if (!result.equals("success"))
            return result;
        if (newsDao.insert(news))
            return "success";
        else
            return "数据库操作失败";
    }

    public News getNewsById(int id) {
        return newsDao.findById(id);
    }

    public String modifyNews(News news) {
        if (newsDao.updateById(news))
            return "success";
        else
            return "数据库操作失败";
    }

    /**
     * 获取最新添加的新闻列表
     *
     * @param num 获取条数
     * @return
     */
    public ArrayList<News> getNewsList(int num) {
        return new ArrayList<News>(newsDao.getNewsList(num));
    }

    /**
     * 获取最新添加的动态公告
     *
     * @param num 获取条数
     * @return
     */
    public ArrayList<News> getBoardList(int num) {
        return new ArrayList<News>(newsDao.getBoardList(num));
    }

    /**
     * 获取某页某类型列表
     *
     * @return
     */
    public ArrayList<News> getListByPageid(int pageid, String module) {
        int page_list_num = 15; //一页显示15条数据
        ArrayList<News> arrayList = new ArrayList<>();
        if (module.equals("业界新闻"))
            arrayList = new ArrayList<News>(newsDao.getAllNewsList());
        else if (module.equals("动态公告"))
            arrayList = new ArrayList<News>(newsDao.getAllBoardList());
        else
            return arrayList;
        if (arrayList.size() > 0) {
            ArrayList<News> pageList = new ArrayList<News>();
            int startIndex = (pageid - 1) * page_list_num;
            int endIndex = pageid * page_list_num - 1;
            //超出范围返回空
            if (startIndex >= arrayList.size())
                return pageList;
            if (startIndex < 0)
                startIndex = 0;
            if (endIndex >= arrayList.size())
                endIndex = arrayList.size();
            if (endIndex < 0)
                endIndex = 0;
            pageList.addAll(arrayList.subList(startIndex, endIndex));
            return pageList;
        } else
            return arrayList;
    }

    /**
     * 获取某页所有列表
     *
     * @param pageid
     * @return
     */
    public ArrayList<News> getAllList(int pageid) {
        int page_list_num = 15; //一页显示15条数据
        ArrayList<News> arrayList = new ArrayList<News>(newsDao.getAllList());
        if (arrayList.size() > 0) {
            ArrayList<News> pageList = new ArrayList<News>();
            int startIndex = (pageid - 1) * page_list_num;
            int endIndex = pageid * page_list_num - 1;
            //超出范围返回空
            if (startIndex >= arrayList.size())
                return pageList;
            if (startIndex < 0)
                startIndex = 0;
            if (endIndex >= arrayList.size())
                endIndex = arrayList.size();
            if (endIndex < 0)
                endIndex = 0;
            pageList.addAll(arrayList.subList(startIndex, endIndex));
            return pageList;
        } else
            return arrayList;
    }

    /**
     * 通过id删除一条记录
     * @param id
     * @return
     */
    public String deleteById(int id) {
        if (newsDao.deleteById(id))
            return "success";
        else
            return "数据库操作失败";
    }

    /**
     * 检查数据
     *
     * @return
     */
    private String checkData(News news) {
        if (news.getTitle() != null && news.getTitle().trim().isEmpty())
            return "标题不能为空";
        if (news.getModule() != null && news.getModule().trim().isEmpty())
            return "请选择新闻类型";
        if (news.getDatetime() != null && news.getDatetime().trim().isEmpty())
            return "请填写时间";
        if (news.getDescription() != null && news.getDescription().length() > 300)
            return "描述不能超过300字";
        if (news.getKeyword() != null && news.getKeyword().length() > 50)
            return "关键字太多";
        if (news.getContent() != null && news.getContent().trim().isEmpty())
            return "新闻内容不能为空";
        if (news.getPv() < 0)
            return "访问量不能为负";
        if (news.getUser() != null && news.getUser().trim().isEmpty())
            return "发布者不能为空";
        return "success";
    }

    /**
     * 点击量自增1
     * @param id
     * @return
     */
    public boolean updatePv(int id) {
        return newsDao.updatePv(id);
    }
}
