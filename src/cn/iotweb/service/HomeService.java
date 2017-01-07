package cn.iotweb.service;

import cn.iotweb.model.Home;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by lhc35 on 2016/10/27.
 */
@Service
public class HomeService {
    @Autowired
    private NewsService newsService = new NewsService();
    public Home getHomeInfo() {
        Home home = new Home();
        home.setArrayListNews(newsService.getNewsList(5));
        home.setArrayListBoard(newsService.getBoardList(5));
        return home;
    }
}
