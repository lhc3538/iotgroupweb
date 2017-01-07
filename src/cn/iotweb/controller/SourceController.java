package cn.iotweb.controller;

import cn.iotweb.model.Source;
import cn.iotweb.model.User;
import cn.iotweb.service.SourceService;
import cn.iotweb.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

/**
 * 资料控制器
 * Created by WSL on 2016/10/23.
 */
@Controller
public class SourceController {

    @Autowired
    private TagService tagService;
    @Autowired
    private SourceService sourceService;

    /**
     * 资源界面加载控制器
     *
     * @return
     */
    @RequestMapping("/source")
    public String source(HttpServletRequest req, ModelMap model, HttpSession session) {
        model.addAttribute("tags", tagService.getAllTags());
        model.addAttribute("sources", sourceService.getSourceWithOption("0"));
        model.addAttribute("downloadOrder", sourceService.getDownloadOrder());
        model.addAttribute("timeOrder", sourceService.getTimeOrder());
        User user = (User) session.getAttribute("user");
        if (null == user) {
            model.addAttribute("info", "#login");
            model.addAttribute("uname", "登录");
        } else {
            model.addAttribute("info", "#");
            model.addAttribute("uname", user.getUname());
        }
        return "view/source";
    }

    /**
     * 搜索资源控制器
     *
     * @throws IOException
     */
    @RequestMapping("/searchSource")
    @ResponseBody
    public List<Source> sourchSearch(@RequestParam("keyword") String keyword) throws IOException {
        return sourceService.searchSource(keyword);
    }

    /**
     * 根据条件获取资源
     *
     * @param tagids 标签集合
     * @return
     */
    @RequestMapping("/getSource")
    @ResponseBody
    public List<Source> getSource(@RequestParam("tagids") String tagids, HttpServletResponse resp) throws IOException {
        System.out.print(tagids);
        if (null == tagids || "" == tagids)
            return new LinkedList<Source>();
        return sourceService.getSourceWithOption(tagids);
    }

    /**
     * 获得下载量排名
     *
     * @return
     */
    @RequestMapping("/getDownloadOrder")
    @ResponseBody
    public List<Source> getDownloadOrder() throws IOException {
        return sourceService.getDownloadOrder();
    }

    /**
     * 获得时间排名
     *
     * @return
     */
    @RequestMapping("/getTimeOrder")
    @ResponseBody
    public List<Source> getTimeOrder() throws IOException {
        return sourceService.getTimeOrder();
    }

    /**
     * 获得所有的资源
     *
     * @return
     */
    @RequestMapping("/back/getallsource")
    @ResponseBody
    public List<Source> getAllUser() {
        List<Source> list = sourceService.getAllSource();
        for (Source s : list) {
            s.setPath("<button class=\"btn btn-default\" onclick=\"editSource('" + s.getSourceid() + "')\"><i class=\"glyphicon glyphicon-pencil\"></i></button><button class=\"btn btn-default\" onclick=\"deleteSource('" + s.getPath() + "')\"><i class=\"glyphicon glyphicon-trash\"></i></button>");
        }
        return list;
    }

    /**
     * 管理资源界面
     *
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("/back/managesource")
    public String manageUser(ModelMap model, HttpSession session) {
        model.addAttribute("uname", ((User) session.getAttribute("user")).getUname());
        return "back/managesource";
    }

    /**
     * 删除资源
     *
     * @param sourcepath
     */
    @RequestMapping("/back/deletesource")
    public void deleteSource(String sourcepath, HttpServletResponse resp) throws IOException {
        resp.getWriter().print(sourceService.deleteSource(sourcepath) ? "删除成功" : "删除失败");
    }

    /**
     * 更新资源
     */
    @RequestMapping("/back/updatesource")
    public void updateSource(String sourceid,
                             String sourcename,
                             String uploadtime,
                             String srole,
                             String sdescribe,
                             String stype,
                             String tagstext,
                             String tagids,
                             HttpServletResponse resp) throws IOException {
        boolean result = sourceService.updateSource(tagids, sourceid, sourcename, uploadtime, srole, sdescribe, stype, tagstext);
        resp.getWriter().print(result ? "更新成功" : "更新失败");
    }

    /**
     * 获取一条资源
     *
     * @param sourceid
     * @param model
     * @return
     */
    @RequestMapping("/back/editsource")
    public String getASource(String sourceid, ModelMap model) {
        Source source = sourceService.getASource(sourceid);
        if (null != source) {
            model.addAttribute("sourceid", source.getSourceid());
            model.addAttribute("title", source.getSourcename());
            model.addAttribute("oriDatetime", new SimpleDateFormat("yyyy-MM-dd'T'HH:mm").format(new Date()));
            model.addAttribute("sdescribe", source.getSdescribe());
            model.addAttribute("type", source.getStype());
            model.addAttribute("role", source.getSrole());
            model.addAttribute("tags", tagService.getAllTags());
        }
        return "back/editsource";
    }
}
