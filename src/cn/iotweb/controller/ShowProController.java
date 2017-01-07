package cn.iotweb.controller;

import cn.iotweb.model.User;
import cn.iotweb.service.ShowProService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;

/**
 * Created by wsx on 2016/10/31.
 */
@Controller
public class ShowProController {
    @Autowired
    ShowProService spservice = new ShowProService();

    @RequestMapping(value = "/showpro",method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
    public String showpro(@RequestParam String prank, ModelMap model, HttpSession session){
        User user = (User) session.getAttribute("user");
        if (null == user) {
            model.addAttribute("info", "#login");
            model.addAttribute("uname", "登录");
        } else {
            model.addAttribute("info", "#");
            model.addAttribute("uname", user.getUname());
        }
        model.addAttribute("pro", spservice.getSPById(prank));
        return "/view/showpro";
    }
    @RequestMapping(value = "/back/addshowpro")
    public String addpro(){
        return "/back/addshowpro";
    }

    @RequestMapping(value = "/back/addproajax")
    @ResponseBody
    public void addproajax(HttpServletRequest req, HttpServletResponse resp){
        try {
            MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) req;
            MultipartFile multipartFile = multipartRequest.getFile("pimg");
            if (multipartFile.getSize() > 5242880) {
                resp.getWriter().print(new String("图片过大，请限制在5M以内"));
                return;
            }
            String realPathprefix = req.getSession().getServletContext().getRealPath("showpro");
            File f = new File(realPathprefix);
            if(!f.exists()){
                f.mkdir();
            }
            String relaPathprefix = "../../showpro";

            String originalFilename = multipartFile.getOriginalFilename();
            int dotindex = originalFilename.lastIndexOf('.');
            String sourceid = String.valueOf(System.currentTimeMillis());
            String newname = sourceid + originalFilename.substring(dotindex);

            String realPath = realPathprefix + "\\" + newname;
            String relaPath = relaPathprefix + "/" +newname;

            File targetFile = new File(realPath);
            if (!spservice.addshowpro(multipartRequest,relaPath)) {
                resp.getWriter().print(new String("上传失败"));
                return;
            }
            multipartFile.transferTo(targetFile);
            resp.getWriter().print(new String("上传成功"));
        }catch (Exception e) {
            e.printStackTrace();
        }
    }
}
