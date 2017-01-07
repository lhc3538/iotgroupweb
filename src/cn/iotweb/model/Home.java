package cn.iotweb.model;

import java.util.ArrayList;

/**
 * Created by lhc35 on 2016/10/27.
 */
public class Home {
    //业界新闻和动态公告的列表
    private ArrayList<News> arrayListNews;
    private ArrayList<News> arrayListBoard;

    public ArrayList<News> getArrayListNews() {
        return arrayListNews;
    }

    public void setArrayListNews(ArrayList<News> arrayListNews) {
        this.arrayListNews = arrayListNews;
    }

    public ArrayList<News> getArrayListBoard() {
        return arrayListBoard;
    }

    public void setArrayListBoard(ArrayList<News> arrayListBoard) {
        this.arrayListBoard = arrayListBoard;
    }


}
