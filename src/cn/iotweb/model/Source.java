package cn.iotweb.model;

/**
 * 资源类
 * Created by WSL on 2016/10/23.
 */
public class Source {
    private String sourceid;//id
    private String sourcename;//资源名
    private String path;//路径
    private String author;//作者
    private String uploadtime;//上传时间
    private int visits;//访问量
    private int srole;//权限
    private String sdescribe;//描述
    private String stype;//类型 综合/文档/视频/源码
    private String tagstext;//标签文本

    public Source() {
    }

    public String getSourceid() {
        return sourceid;
    }

    public void setSourceid(String sourceid) {
        this.sourceid = sourceid;
    }

    public String getSourcename() {
        return sourcename;
    }

    public void setSourcename(String sourcename) {
        this.sourcename = sourcename;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getUploadtime() {
        return uploadtime;
    }

    public void setUploadtime(String uploadtime) {
        this.uploadtime = uploadtime;
    }

    public int getVisits() {
        return visits;
    }

    public void setVisits(int visits) {
        this.visits = visits;
    }

    public int getSrole() {
        return srole;
    }

    public void setSrole(int srole) {
        this.srole = srole;
    }

    public String getSdescribe() {
        return sdescribe;
    }

    public void setSdescribe(String sdescribe) {
        this.sdescribe = sdescribe;
    }

    public String getStype() {
        return stype;
    }

    public void setStype(String stype) {
        this.stype = stype;
    }

    public String getTagstext() {
        return tagstext;
    }

    public void setTagstext(String tagstext) {
        this.tagstext = tagstext;
    }

}
