package cn.iotweb.service;

import cn.iotweb.dao.TagDAO;
import cn.iotweb.model.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by WSL on 2016/10/26.
 */
@Service
public class TagService {
    @Autowired
    private TagDAO tagDao;

    public List<Tag> getAllTags() {
        return tagDao.queryAllTags();
    }
}
