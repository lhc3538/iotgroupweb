package cn.iotweb.service;

import cn.iotweb.dao.ShowProDao;
import cn.iotweb.model.ShowPro;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.util.List;

/**
 * Created by wsx on 2016/10/31.
 */
@Service
public class ShowProService {
    @Autowired
    private ShowProDao spDao;

    public ShowPro getSPById(String prank){
        return spDao.findByRank(prank);
    }

    public List<ShowPro> getshowprolist() throws IndexOutOfBoundsException{
        List<ShowPro> list = spDao.findAll();
        return list;
    }

    public boolean addshowpro(MultipartHttpServletRequest mreq,String path){
        String[] arr = new String[5];
        arr[2] = path;
        arr[0]=mreq.getParameter("prank");
        arr[1]=mreq.getParameter("pname");
        arr[3]=mreq.getParameter("pinfo");
        arr[4]=mreq.getParameter("phonor");
        return spDao.modifyrank(arr[0]) && spDao.addSP(arr);
    }


}
