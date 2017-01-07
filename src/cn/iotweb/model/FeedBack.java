package cn.iotweb.model;

/**
 * Created by wsx on 2016/10/28.
 */
public class FeedBack {
    private String id;
    private String name;//反馈者
    private String email;//反馈者邮箱
    private String subject;//反馈主题
    private String content;//反馈内容
    public FeedBack(){
    }
    public FeedBack(String name,String email,String subject,String content){
        this.name = name;
        this.email = email;
        this.subject = subject;
        this.content = content;
    }

    public String getName() {
        return name;
    }

    public String getId() {return id;}

    public String getEmail() {
        return email;
    }

    public String getSubject() {
        return subject;
    }

    public String getContent() {
        return content;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setId(String id) {this.id = id;}

    public void setEmail(String email) {
        this.email = email;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
