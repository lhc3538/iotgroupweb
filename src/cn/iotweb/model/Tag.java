package cn.iotweb.model;

/**
 * 标签类
 * Created by WSL on 2016/10/23.
 */
public class Tag {
    private String tagid;//tagid
    private String tagname;//名称

    public Tag() {
    }

    public Tag(String tagname, String tagid) {
        this.tagname = tagname;
        this.tagid = tagid;
    }

    public String getTagid() {
        return tagid;
    }

    public void setTagid(String tagid) {
        this.tagid = tagid;
    }

    public String getTagname() {
        return tagname;
    }

    public void setTagname(String tagname) {
        this.tagname = tagname;
    }
}
