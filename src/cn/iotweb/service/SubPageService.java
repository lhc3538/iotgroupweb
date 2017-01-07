package cn.iotweb.service;

import cn.iotweb.dao.SubPageDao;
import cn.iotweb.model.News;
import cn.iotweb.model.SubPage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by lhc35 on 2016/11/10.
 */
@Service
public class SubPageService {
    @Autowired
    private SubPageDao subPageDao;

    /**
     * 添加新的子页面
     * @param subPage
     * @return
     */
    public String addSubPage(SubPage subPage) {
        // 检查数据
        String result = checkData(subPage);
        if (!result.equals("success"))
            return result;  //数据不合法，返回不合法原因

        if (subPageDao.insert(subPage))
            return "success";
        else
            return "数据库操作失败";
    }

    /**
     * 通过id获取子页面
     * @param id
     * @return
     */
    public SubPage getSubPageById(int id) {
        return subPageDao.findById(id);
    }

    /**
     * 修改子页面
     * @param subPage
     * @return
     */
    public String modifySubPage(SubPage subPage) {
        if (subPageDao.updateById(subPage))
            return "success";
        else
            return "数据库操作失败";
    }

    /**
     * 通过id删除子页面
     * @param id
     * @return
     */
    public String deleteById(int id) {
        if (subPageDao.deleteById(id))
            return "success";
        else
            return "数据库操作失败";
    }

    /**
     * 获取某页所有子页面列表
     * @param pageid
     * @return
     */
    public ArrayList<SubPage> getAllList(int pageid) {
        int page_list_num = 15; //一页显示15条数据
        ArrayList<SubPage> arrayList = new ArrayList<SubPage>(subPageDao.getAllList());
        if (arrayList.size() > 0) {
            ArrayList<SubPage> pageList = new ArrayList<SubPage>();
            int startIndex = (pageid - 1) * page_list_num;
            int endIndex = pageid * page_list_num - 1;
            //超出范围返回空
            if (startIndex >= arrayList.size())
                return pageList;
            if (startIndex < 0)
                startIndex = 0;
            if (endIndex >= arrayList.size())
                endIndex = arrayList.size();
            if (endIndex < 0)
                endIndex = 0;
            pageList.addAll(arrayList.subList(startIndex, endIndex));
            return pageList;
        } else
            return arrayList;
    }

    /**
     * 检查数据
     *
     * @return
     */
    private String checkData(SubPage subPage) {
        if (subPage.getTitle() != null && subPage.getTitle().trim().isEmpty())
            return "子页面标题不能为空";
        if (subPage.getDatetime() != null && subPage.getDatetime().trim().isEmpty())
            return "请填写时间";
        if (subPage.getContent() != null && subPage.getContent().trim().isEmpty())
            return "子页面主体内容不能为空";
        if (subPage.getUser() != null && subPage.getUser().trim().isEmpty())
            return "操作者不能为空";
        return "success";
    }
}
