package cn.iotweb.dao;

import cn.iotweb.model.ShowPro;
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
 * Created by wsx on 2016/10/31.
 */
@Repository
public class ShowProDao extends IotWebDAO {
    public boolean addSP(String[] arr) {//添加一个展示工程
        String sql = "INSERT INTO t_showpro (`prank`, `pname`, `pimg`, `pinfo`, `phonor`) VALUES (?,?,?,?,?)";
        return jdbcTemplate.update(sql, new PreparedStatementSetter(){
            @Override
            public void setValues(PreparedStatement preparedStatement) throws SQLException {
                for(int i = 0; i < arr.length; i++)
                    preparedStatement.setObject(i + 1, arr[i]);
            }
        }) >  0? true : false;
    }

    public boolean modifyrank(String rank) {//将其他展示工程的位次改成0  意味着不显示
        String sql = "update t_showpro set prank=0 where prank='"+rank+"'";
        return jdbcTemplate.update(sql) >= 0 ? true : false;
    }

    public List<ShowPro> findAll() {//获取所有的展示工程描述    index.jsp中get
        String sql = "select * from t_showpro where prank != \"0\" order by prank limit 6";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper(ShowPro.class));
    }

    public ShowPro findByRank(String rank) {//获取其中一个展示工程的详细描述    index.jsp中展示面板的url
        String sql = "select * from t_showpro where prank = \"" + rank + "\"";
        List<ShowPro> list = jdbcTemplate.query(sql, new BeanPropertyRowMapper(ShowPro.class));
        return list.isEmpty() ? null : list.get(0);
    }
}
