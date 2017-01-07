package cn.iotweb.model;

/**
 * 用户类
 * Created by WSL on 2016/10/20.
 */
public class User{
    private String uid; //id
    private String uemail;//邮箱
    private String passwd;//密码
    private String uname;//姓名
    private String uclass;//班级
    private String uphone;//手机号
    private int urole;//权限
    private int uscore;//积分
    private String regtime;//注册时间

    public User(String uid, String uemail, String passwd, String uname, String uclass, String uphone, int urole, int uscore, String regtime) {
        this.uid = uid;
        this.uemail = uemail;
        this.passwd = passwd;
        this.uname = uname;
        this.uclass = uclass;
        this.uphone = uphone;
        this.urole = urole;
        this.uscore = uscore;
        this.regtime = regtime;
    }

    public User() {
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getUemail() {
        return uemail;
    }

    public void setUemail(String uemail) {
        this.uemail = uemail;
    }

    public String getPasswd() {
        return passwd;
    }

    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getUclass() {
        return uclass;
    }

    public void setUclass(String uclass) {
        this.uclass = uclass;
    }

    public String getUphone() {
        return uphone;
    }

    public void setUphone(String uphone) {
        this.uphone = uphone;
    }

    public int getUrole() {
        return urole;
    }

    public void setUrole(int urole) {
        this.urole = urole;
    }

    public int getUscore() {
        return uscore;
    }

    public void setUscore(int uscore) {
        this.uscore = uscore;
    }

    public String getRegtime() {
        return regtime;
    }

    public void setRegtime(String regtime) {
        this.regtime = regtime;
    }
}

