package cn.iotweb.dao;

import cn.iotweb.model.News;
import cn.iotweb.model.SubPage;
import cn.iotweb.model.Tag;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by lhc35 on 2016/11/10.
 */
@Repository
public class SubPageDao extends IotWebDAO {
    /**
     * 插入一条记录
     * @param subPage
     * @return
     */
    public boolean insert(SubPage subPage) {
        String sql = "insert into t_subpage values(null,?, ?, ?, ?)";
        int result = jdbcTemplate.update(sql, new PreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement ps) throws SQLException {
                ps.setString(1, subPage.getTitle());
                ps.setString(2, subPage.getDatetime());
                ps.setString(3, subPage.getContent());
                ps.setString(4, subPage.getUser());
            }
        });
        return result == 1 ? true : false;
    }

    /**
     * 通过id查找一条记录
     * @param id
     * @return
     */
    public SubPage findById(int id) {
        String sql = "select * from t_subpage where id = ?" ;
        SubPage subPage = (SubPage) jdbcTemplate.queryForObject(sql, new Object[]{id}, new BeanPropertyRowMapper(SubPage.class));
        return subPage;
    }

    /**
     *修改一条记录
     * @param subPage
     * @return
     */
    public boolean updateById(SubPage subPage) {
        String sql = "UPDATE t_subpage SET title = ?," +
                "datetime = ?, " +
                "content = ?, " +
                "user = ?" +
                "WHERE id = ?";
        int[] result = jdbcTemplate.batchUpdate(sql, new BatchPreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement ps, int i) throws SQLException {
                ps.setString(1, subPage.getTitle());
                ps.setString(3, subPage.getDatetime());
                ps.setString(6, subPage.getContent());
                ps.setString(8, subPage.getUser());
                ps.setInt(9, subPage.getId());
            }
            @Override
            public int getBatchSize() {
                return 1;
            }
        });

        return result[0] == 1 ? true : false;
    }


    /**
     * 获取所有列表
     * @return
     */
    public List<SubPage> getAllList() {
        String sql = "select id,title,datetime from t_subpage order by id";
        return jdbcTemplate.query(sql, new Object[]{}, new BeanPropertyRowMapper(SubPage.class));
    }

    /**
     * 根据id删除一条记录
     * @param id
     * @return
     */
    public boolean deleteById(int id) {
        String sql = "delete from t_subpage where id=?";
        int[] result = jdbcTemplate.batchUpdate(sql, new BatchPreparedStatementSetter(){
            @Override
            public void setValues(PreparedStatement ps, int i) throws SQLException {
                ps.setInt(1,id);
            }
            @Override
            public int getBatchSize() {
                return 1;
            }
        });
        return result[0] == 1 ? true : false;
    }
}
