package cn.iotweb.controller;

import cn.iotweb.dao.TagDAO;
import cn.iotweb.model.Source;
import cn.iotweb.model.User;
import cn.iotweb.service.SourceService;
import cn.iotweb.service.TagService;
import com.fasterxml.jackson.databind.util.JSONPObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.SystemEnvironmentPropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 文件上传控制器
 * Created by WSL on 2016/10/26.
 */
@Controller
public class UploadFileController {

    @Autowired
    private TagService tagService;
    @Autowired
    private SourceService sourceService;

    /**
     * 文件上传页面
     *
     * @return
     */
    @RequestMapping("back/uploadfile")
    public String uploadFilePage(HttpServletRequest req, ModelMap model) {
        model.addAttribute("tags", tagService.getAllTags());
        model.addAttribute("oriDatetime", new SimpleDateFormat("yyyy-MM-dd'T'HH:mm").format(new Date()));
        model.addAttribute("uname", ((User) req.getSession().getAttribute("user")).getUname());
        return "back/uploadfile";
    }

    /**
     * 文件上传
     *
     * @param req
     * @param resp
     */
    @RequestMapping("/back/uploadfiles")
    @ResponseBody
    public void test(HttpServletRequest req, HttpServletResponse resp) {
        try {
            MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) req;
            MultipartFile multipartFile = multipartRequest.getFile("fileToUpload");
            if (multipartFile.getSize() > 1073741824L) {
                resp.getWriter().print(new String("文件过大，请限制在1G以内"));
                return;
            }
            String realPath = req.getSession().getServletContext().getRealPath("download");
            String originalFilename = multipartFile.getOriginalFilename();
            int dotindex = originalFilename.lastIndexOf('.');
            String sourceid = String.valueOf(System.currentTimeMillis());
            String newname = originalFilename.substring(0, dotindex) + "_" + sourceid + originalFilename.substring(dotindex);
            File targetFile = new File(realPath + "\\" + newname);
            if (!sourceService.addSource(multipartRequest, newname, sourceid)) {
                resp.getWriter().print(new String("上传失败"));
                return;
            }
            multipartFile.transferTo(targetFile);
            resp.getWriter().print(new String("上传成功"));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
