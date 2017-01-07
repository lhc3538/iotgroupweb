package cn.iotweb.model;

/**
 * Created by lhc35 on 2016/11/10.
 */
public class SubPage {
    //页面id
    private int id = 0;
    //标题
    private String title;
    //最后修改时间时间
    private String datetime;
    //内容
    private String content;
    //发布者
    private String user;

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

    public String getDatetime() {
        return datetime;
    }

    public void setDatetime(String datetime) {
        this.datetime = datetime;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }



}
