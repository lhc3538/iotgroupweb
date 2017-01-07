package cn.iotweb.service;

import cn.iotweb.dao.UserDAO;
import cn.iotweb.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by WSL on 2016/10/23.
 */
@Service
public class UserService {

    @Autowired
    private UserDAO userDao;

    /**
     * 删除用户
     * @param uid
     * @return
     */
    public boolean deleteUser(String uid){
        return userDao.deleteUser(uid);
    }

    /**
     * 验证登录信息
     *
     * @param uid
     * @param passwd
     * @return
     */
    public User checkLogin(String uid, String passwd) {
        String sql = "select * from t_user where uid = \"" + uid + "\" and passwd = \"" + passwd + "\"";
        List<User> list = userDao.queryAllWithOption(sql);
        if (list.isEmpty() || null == list)
            return null;
        else
            return list.get(0);
    }

    /**
     * 验证登录信息
     *
     * @param uid
     * @param passwd
     * @return
     */
    public User checkLoginConsole(String uid, String passwd) {
        String sql = "select * from t_user where urole = 5 and uid = \"" + uid + "\" and passwd = \"" + passwd + "\"";
        List<User> list = userDao.queryAllWithOption(sql);
        if (list.isEmpty() || null == list)
            return null;
        else
            return list.get(0);
    }

    /**
     * 用户注册
     *
     * @param req
     * @return
     */
    public String saveUserInfo(HttpServletRequest req) {
        if (!checkUidAvailable(req.getParameter("uid")))
            return "用户名已存在";
        else {
            if (userDao.insert(
                    req.getParameter("uid"),
                    req.getParameter("uemail"),
                    req.getParameter("passwd"),
                    req.getParameter("uname"),
                    req.getParameter("uclass"),
                    req.getParameter("uphone")))
                return "注册成功";
            else
                return "SaveUserInfo Error";
        }
    }

    /**
     * 检查uid是否可用
     *
     * @param uid
     * @return
     */
    public boolean checkUidAvailable(String uid) {
        String sql = "select uid from t_user where uid = \"" + uid + "\"";
        return userDao.queryAllWithOption(sql).isEmpty();
    }

    /**
     * 获得所有的用户
     *
     * @return
     */
    public List<User> getAllUser() {
        return userDao.queryAll();
    }

    //
//    /**
//     * 信息验证
//     *
//     * @return
//     */
//    public String checkInfo(HttpServletRequest req) {
//        String uemail = req.getParameter("uemail");
//        if (uemail.length() <= 0 || uemail.length() > 35)
//            return "邮箱长度不正确";
//        String passwd = req.getParameter("passwd");
//        if (passwd.length() <= 0 || passwd.length() > 35)
//            return "密码长度不正确";
//        String uname = req.getParameter("uname");
//        if (uname.length() <= 0 || uname.length() > 35)
//            return "用户名长度不正确";
//        if (req.getParameter("uphone").length() != 11)
//            return "手机号不正确";
//        return null;
//    }
}
