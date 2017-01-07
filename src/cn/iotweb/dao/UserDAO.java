package cn.iotweb.dao;

import cn.iotweb.model.User;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.stereotype.Repository;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by WSL on 2016/10/24.
 */
@Repository
public class UserDAO extends IotWebDAO {

    /**
     * 查询所有的用户
     *
     * @return
     */
    public List<User> queryAll() {
        return jdbcTemplate.query("select * from t_user", new BeanPropertyRowMapper(User.class));
    }

    /**
     * 删除一个用户
     * @param uid
     * @return
     */
    public boolean deleteUser(String uid) {
        return jdbcTemplate.update("delete from t_user where uid = \"" + uid + "\"") > 0 ? true : false;
    }

    /**
     * 插入一条用户记录
     *
     * @param args
     * @return
     */
    public boolean insert(String... args) {
        String sql = "insert into t_user values(?, ?, ?, ?, ?, ?, 1, now(), 0)";
        return jdbcTemplate.update(sql, new PreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement ps) throws SQLException {
                for (int j = 0; j < args.length; j++)
                    ps.setObject(j + 1, args[j]);
            }
        }) == 1 ? true : false;
    }

    /**
     * 有条件的查询所有
     *
     * @return
     */
    public List<User> queryAllWithOption(String sql) {
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper(User.class));
    }
}
