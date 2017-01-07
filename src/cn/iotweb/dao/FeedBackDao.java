package cn.iotweb.dao;

import cn.iotweb.model.FeedBack;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by wsx on 2016/10/28.
 */
@Repository
public class FeedBackDao extends IotWebDAO{
    /**
     * 插入feedback的项
     * @param feedback
     * @return
     */
    public boolean insert(FeedBack feedback){
        String sql = "insert into t_feedback values(NULL,?, ?, ?, ?)";
        int[] result = jdbcTemplate.batchUpdate(sql, new BatchPreparedStatementSetter(){
            @Override
            public void setValues(PreparedStatement ps, int i) throws SQLException {
                ps.setString(1,feedback.getName());
                ps.setString(2,feedback.getEmail());
                ps.setString(3,feedback.getSubject());
                ps.setString(4,feedback.getContent());
            }
            @Override
            public int getBatchSize(){return 1;}
        });
        return result[0] == 1 ? true : false;
    }

    /**
     * 获取反馈列表
     * @return
     */
    public List<FeedBack> getFeedBackList(){
        String sql = "select * from t_feedback";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper(FeedBack.class));
    }
    public boolean rmoneFeedback(String id){
        String sql="delete from t_feedback where id=?";
        int[] result = jdbcTemplate.batchUpdate(sql, new BatchPreparedStatementSetter(){

            @Override
            public void setValues(PreparedStatement ps, int i) throws SQLException {
                ps.setString(1,id);
            }

            @Override
            public int getBatchSize() {
                return 1;
            }
        });
        return result[0] == 1 ? true : false;
    }
}
