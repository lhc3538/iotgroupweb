package cn.iotweb.model;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by lhc35 on 2016/10/21.
 */

public class News extends JdbcDaoSupport {

    //文章id
    private int id = 0;
    //标题
    private String title;
    //文章类型
    private String module;
    //发布时间
    private String datetime;
    //描述
    private String description;
    //关键词
    private String keyword;
    //内容
    private String content;
    //访问量
    private int pv;
    //发布者
    private String user;

    /**
     * 自动传参必须有无参构造函数
     */
    public News() {
    }

    public News(int id, String title, String module, String datetime, String description, String keyword, String content, int pv, String user) {
        this.id = id;
        this.title = title;
        this.module = module;
        this.datetime = datetime;
        this.description = description;
        this.keyword = keyword;
        this.content = content;
        this.pv = pv;
        this.user = user;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getModule() {
        return module;
    }

    public void setModule(String module) {
        this.module = module;
    }

    public String getDatetime() {
        return datetime;
    }

    public void setDatetime(String datetime) {
        this.datetime = datetime;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getPv() {
        return pv;
    }

    public void setPv(int pv) {
        this.pv = pv;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

}
