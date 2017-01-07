package cn.iotweb.dao;

import cn.iotweb.model.News;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by lhc35 on 2016/10/26.
 */
@Repository
public class NewsDao extends IotWebDAO{

    public boolean insert(News news) {
        String sql = "insert into t_news values(null,?, ?, ?, ?, ?, ?, ?, ?)";
        int[] result = jdbcTemplate.batchUpdate(sql, new BatchPreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement ps, int i) throws SQLException {
                ps.setString(1, news.getTitle());
                ps.setString(2, news.getModule());
                ps.setString(3, news.getDatetime());
                ps.setString(4, news.getDescription());
                ps.setString(5, news.getKeyword());
                ps.setString(6, news.getContent());
                ps.setInt(7, news.getPv());
                ps.setString(8, news.getUser());
            }

            @Override
            public int getBatchSize() {
                return 1;
            }
        });
        return result[0] == 1 ? true : false;
    }

    public News findById(int id) {
        String sql = "select * from t_news where id = ?" ;
        News news = (News) jdbcTemplate.queryForObject(sql, new Object[]{id}, new RowMapper() {

            @Override
            public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
                News news_temp = new News();
                news_temp.setId(rs.getInt("id"));
                news_temp.setTitle(rs.getString("title"));
                news_temp.setModule( rs.getString("module"));
                news_temp.setDatetime(rs.getString("datetime"));
                news_temp.setDescription(rs.getString("description"));
                news_temp.setKeyword(rs.getString("keyword"));
                news_temp.setContent(rs.getString("content"));
                news_temp.setPv(rs.getInt("pv"));
                news_temp.setUser(rs.getString("user"));
                return news_temp;
            }
        });
        return news;
    }

    public boolean updateById(News news) {
        String sql = "UPDATE t_news SET title = ?," +
                "module = ?," +
                "datetime = ?, " +
                "description = ?, " +
                "keyword = ?," +
                "content = ?, " +
                "pv = ?, " +
                "user = ?" +
                "WHERE id = ?";
        int[] result = jdbcTemplate.batchUpdate(sql, new BatchPreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement ps, int i) throws SQLException {
                ps.setString(1, news.getTitle());
                ps.setString(2, news.getModule());
                ps.setString(3, news.getDatetime());
                ps.setString(4, news.getDescription());
                ps.setString(5, news.getKeyword());
                ps.setString(6, news.getContent());
                ps.setInt(7, news.getPv());
                ps.setString(8, news.getUser());
                ps.setInt(9, news.getId());
            }

            @Override
            public int getBatchSize() {
                return 1;
            }
        });

        return result[0] == 1 ? true : false;
    }

    /**
     * 获取业界新闻后num条数据
     * @param num
     * @return
     */
    public List<News> getNewsList(int num) {
        String sql = "select id,title,datetime from t_news where module = \"业界新闻\" order by id limit ?";
        return jdbcTemplate.query(sql,  new Object[]{num},new BeanPropertyRowMapper(News.class));
    }
    /**
     * 获取公告后num条数据
     * @param num
     * @return
     */
    public List<News> getBoardList(int num) {
        String sql = "select id,title,datetime from t_news where module = \"动态公告\" order by id limit ?";
        return jdbcTemplate.query(sql, new Object[]{num}, new BeanPropertyRowMapper(News.class));
    }

    /**
     * 获取所有新闻列表
     * @return
     */
    public List<News> getAllNewsList() {
        String sql = "select id,title,datetime from t_news where module = \"业界新闻\" order by id";
        return jdbcTemplate.query(sql, new Object[]{}, new BeanPropertyRowMapper(News.class));
    }

    /**
     * 获取所有公告列表
     * @return
     */
    public List<News> getAllBoardList() {
        String sql = "select id,title,datetime from t_news where module = \"动态公告\" order by id";
        return jdbcTemplate.query(sql, new Object[]{}, new BeanPropertyRowMapper(News.class));
    }

    /**
     * 获取所有列表
     * @return
     */
    public List<News> getAllList() {
        String sql = "select id,title,module,datetime from t_news order by id";
        return jdbcTemplate.query(sql, new Object[]{}, new BeanPropertyRowMapper(News.class));
    }

    public boolean deleteById(int id) {
        String sql = "delete from t_news where id=?";
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

    /**
     * 更新新闻点击量
     * @param id
     * @return
     */
    public boolean updatePv(int id) {
        String sql = "update t_news set pv = pv + 1 where id = ?";
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
