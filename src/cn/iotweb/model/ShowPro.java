package cn.iotweb.model;

/**
 * Created by wsx on 2016/10/31.
 */
public class ShowPro {
    String pname;
    String pimg;
    String pinfo;
    String phonor;
    String prank;

    public ShowPro(){
    }

    public ShowPro(String pname, String pimg, String pinfo, String phonor, String prank) {
        this.pname = pname;
        this.pimg = pimg;
        this.pinfo = pinfo;
        this.phonor = phonor;
        this.prank = prank;
    }

    public String getPname() {
        return pname;
    }

    public String getPimg() {
        return pimg;
    }

    public String getPinfo() {
        return pinfo;
    }

    public String getPhonor() {
        return phonor;
    }

    public String getPrank() {
        return prank;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public void setPimg(String pimg) {
        this.pimg = pimg;
    }

    public void setPinfo(String pinfo) {
        this.pinfo = pinfo;
    }

    public void setPhonor(String phonor) {
        this.phonor = phonor;
    }

    public void setPrank(String prank) {
        this.prank = prank;
    }
}
