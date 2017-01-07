package cn.iotweb.controller;

import cn.iotweb.model.Home;
import cn.iotweb.model.User;
import cn.iotweb.service.HomeService;
import cn.iotweb.service.ShowProService;
import cn.iotweb.service.SourceService;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;

/**
 * Created by WSL on 2016/10/27.
 */
@Controller

public class DownloadFileController {

    @Autowired
    private SourceService sourceService;

    /**
     * 下载文件
     *
     * @param sourceid
     * @param response
     * @param model
     * @return
     * @throws IOException
     */
    @RequestMapping("/download")
    public String download(String sourceid, HttpServletRequest req, HttpServletResponse response, ModelMap model) throws IOException {
        User user = (User) req.getSession().getAttribute("user");
        if (null == user) {
            model.addAttribute("state", "请先登录");
            return "view/downloadstate";
        }
        String result = sourceService.checkFile(user.getUrole(), sourceid);
        if (result.equals("权限不足")) {
            model.addAttribute("state", "权限不足");
            return "view/downloadstate";
        }
        if (result.equals("文件不存在")) {
            model.addAttribute("state", "文件不存在");
            return "view/downloadstate";
        }
        File file = new File(result);
        if(!file.exists()){
            model.addAttribute("state", "文件不存在");
            return "view/downloadstate";
        }
        OutputStream out = null;
        try {
            sourceService.updateDownoadTime(sourceid);
            response.reset();
            response.setContentType("application/octet-stream; charset=utf-8");
            System.out.print(file.getName());
            response.setHeader("Content-disposition", "attachment; filename="
                    + new String(file.getName().getBytes("utf-8"), "ISO8859-1"));
            out = response.getOutputStream();
            out.write(FileUtils.readFileToByteArray(file));
            out.flush();
            model.addAttribute("state", "正在下载");
            return "view/downloadstate";
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (out != null) {
                try {
                    out.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        model.addAttribute("state", "下载错误");
        return "view/downloadstate";
    }
}
