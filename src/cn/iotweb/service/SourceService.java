package cn.iotweb.service;

import cn.iotweb.dao.SourceDAO;
import cn.iotweb.model.Source;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.File;
import java.util.List;

/**
 * Created by WSL on 2016/10/26.
 */
@Service
public class SourceService {

    private static final String realPath = System.getProperty("IOTWeb.root") + "download\\";

    @Autowired
    private SourceDAO sourceDao;

    /**
     * 根据关键词搜索资源
     *
     * @return
     */
    public List<Source> searchSource(String keyword) {
        return sourceDao.queryWithKeyWord(keyword);
    }

    /**
     * 根据查询条件获取资源
     *
     * @param tagids
     * @return
     */
    public List<Source> getSourceWithOption(String tagids) {
        return sourceDao.getSourcesWithOption(tagids.split(";"));
    }

    /**
     * 添加一个资源到数据库
     *
     * @param multipartRequest
     * @param filename
     * @param sourceid
     * @return
     */
    public boolean addSource(MultipartHttpServletRequest multipartRequest, String filename, String sourceid) {
        String[] arr = new String[9];
        arr[0] = sourceid;
        arr[1] = multipartRequest.getParameter("sourcename");
        arr[2] = filename;
        arr[3] = "admin";
        arr[4] = multipartRequest.getParameter("uploadtime");
        arr[5] = multipartRequest.getParameter("srole");
        arr[6] = multipartRequest.getParameter("sdescribe");
        arr[7] = multipartRequest.getParameter("stype");
        arr[8] = multipartRequest.getParameter("tagstext");
        return sourceDao.insertASource(arr) && sourceDao.insertSourceTag(multipartRequest.getParameter("tagids").split(";"), sourceid);
    }

    /**
     * 检查文件是否存在及权限
     *
     * @param sourceid
     * @return
     */
    public String checkFile(int urole, String sourceid) {
        String arr[] = sourceDao.querySourcePathAndSrole(sourceid);
        if (null == arr) {
            return "文件不存在";
        } else if (Integer.valueOf(arr[1]) > urole) {
            return "权限不足";
        } else {
            return realPath + arr[0];
        }
    }

    /**
     * 按下载量查询
     *
     * @return
     */
    public List<Source> getDownloadOrder() {
        return sourceDao.queryForVisits();
    }

    /**
     * 按时间查询
     *
     * @return
     */
    public List<Source> getTimeOrder() {
        return sourceDao.queryForTime();
    }

    /**
     * 更新资源的下载次数
     *
     * @param id
     * @return
     */
    public boolean updateDownoadTime(String id) {
        return sourceDao.updateDownloadTime(id);
    }

    /**
     * 获得所有的资源
     *
     * @return
     */
    public List<Source> getAllSource() {
        return sourceDao.getAllSource();
    }

    /**
     * 删除资源
     *
     * @param sourcepath
     * @return
     */
    public boolean deleteSource(String sourcepath) {
        File file = new File(realPath + sourcepath);
        if (file.exists())
            file.delete();
        return sourceDao.deleteSource(sourcepath);
    }

    /**
     * 获取一条资源
     *
     * @param id
     * @return
     */
    public Source getASource(String id) {
        List<Source> list = sourceDao.getASource(id);
        return list.isEmpty() ? null : list.get(0);
    }

    public boolean updateSource(String sourceid,
                                String sourcename,
                                String uploadtime,
                                String srole,
                                String sdescribe,
                                String stype,
                                String tagstext,
                                String tagids) {
        return sourceDao.updateSource(sourceid, sourcename, uploadtime, srole, sdescribe, stype, tagstext, tagids);
    }
}
