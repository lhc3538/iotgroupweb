package cn.iotweb.dao;

import cn.iotweb.model.Tag;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Tag IotWebDAO
 * Created by WSL on 2016/10/23.
 */
@Repository
public class TagDAO extends IotWebDAO {

    /**
     * 查询所有的tag
     *
     * @return
     */
    public List<Tag> queryAllTags() {
        return jdbcTemplate.query("SELECT * FROM t_tag", new BeanPropertyRowMapper(Tag.class));
    }

    /**
     * 插入单个
     *
     * @param tag
     */
    public void insert(Tag tag) {
        String sql = "INSERT INTO t_tag VALUES (?, ?)";
        jdbcTemplate.update(sql, new Object[]{tag.getTagid(), tag.getTagname()});
    }

    /**
     * 插入多个
     *
     * @param tags
     */
    public void insertBatch(final List<Tag> tags) {
        String sql = "INSERT INTO t_tag VALUES (?, ?)";
        jdbcTemplate.batchUpdate(sql, new BatchPreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement ps, int i) throws SQLException {
                Tag tag = tags.get(i);
                ps.setString(1, tag.getTagid());
                ps.setString(2, tag.getTagname());
            }

            @Override
            public int getBatchSize() {
                return tags.size();
            }
        });
    }

    /**
     * insert batch example with SQL
     *
     * @param sql
     */
    public void insertBatchSQL(final String sql) {
        jdbcTemplate.batchUpdate(new String[]{sql});
    }

    /**
     * query single row with RowMapper
     *
     * @param tagid
     * @return
     */
    public Tag findByTagId(int tagid) {
        String sql = "SELECT * FROM t_tag WHERE tagid = ?";
        Tag customer = (Tag) jdbcTemplate.queryForObject(sql, new Object[]{tagid}, new RowMapper() {

            @Override
            public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
                Tag tag = new Tag();
                tag.setTagid(rs.getString("tagid"));
                tag.setTagname(rs.getString("tagname"));
                return tag;
            }
        });
        return customer;
    }

    /**
     * query single row with BeanPropertyRowMapper (Customer.class)
     *
     * @param tagid
     * @return
     */
    public Tag findByTagId2(int tagid) {
        String sql = "SELECT * FROM t_tag WHERE tagid = ?";
        Tag customer = (Tag) jdbcTemplate.queryForObject(sql, new Object[]{tagid}, new BeanPropertyRowMapper(Tag.class));
        return customer;
    }

    /**
     * 查询所有的tag
     *
     * @return
     */
    public List<Tag> findAllTags() {
        String sql = "SELECT * FROM t_tag";
        List<Tag> tags = new ArrayList<Tag>();
        List<Map<String, Object>> rows = jdbcTemplate.queryForList(sql);
        for (Map row : rows) {
            Tag tag = new Tag((String) row.get("tagname"), (String) row.get("tagid"));
            tags.add(tag);
        }
        return tags;
    }

    public String findCustomerNameById(int custId) {
        String sql = "SELECT NAME FROM CUSTOMER WHERE CUST_ID = ?";
        String name = (String) jdbcTemplate.queryForObject(sql, new Object[]{custId}, String.class);
        return name;
    }
}
