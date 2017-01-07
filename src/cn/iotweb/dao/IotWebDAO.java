package cn.iotweb.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

/**
 * Created by WSL on 2016/10/26.
 */
@Repository
public class IotWebDAO {
    @Autowired
    protected JdbcTemplate jdbcTemplate;
}
