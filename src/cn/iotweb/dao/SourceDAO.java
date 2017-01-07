package cn.iotweb.dao;

import cn.iotweb.model.Source;
import cn.iotweb.model.Tag;
import org.springframework.jdbc.core.*;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

/**
 * Created by WSL on 2016/10/25.
 */
@Repository
public class SourceDAO extends IotWebDAO {

    /**
     * 按下载量查询
     *
     * @return
     */
    public List<Source> queryForVisits() {
        String sql = "select * from t_source order by visits desc limit 5";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper(Source.class));
    }

    /**
     * 按时间查询
     *
     * @return
     */
    public List<Source> queryForTime() {
        String sql = "select * from t_source order by uploadtime desc limit 5";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper(Source.class));
    }

    /**
     * 根据资源id查询资源路径
     *
     * @param sourceid
     * @return
     */
    public String[] querySourcePathAndSrole(String sourceid) {
        String sql = "select srole, path from t_source where sourceid = \"" + sourceid + "\"";
        List<String[]> list = jdbcTemplate.query(sql, new RowMapper<String[]>() {
            @Override
            public String[] mapRow(ResultSet resultSet, int i) throws SQLException {
                String[] value = new String[2];
                value[0] = resultSet.getString("path");
                value[1] = String.valueOf(resultSet.getInt("srole"));
                return value;
            }
        });
        return list.isEmpty() ? null : list.get(0);
    }

    /**
     * 检查权限
     *
     * @param sourceid
     * @return
     */
    public boolean queryFileAccess(String sourceid) {
        String sql = "select srole from t_source where t_source.author = t_user.uid and urole >= srole";
        List<String> list = jdbcTemplate.queryForList(sql, String.class);
        return !list.isEmpty();
    }

    /**
     * 插入一条数据到资源表
     *
     * @param source
     * @return
     */
    public boolean insertASource(String[] source) {
        String sql = "INSERT INTO t_source VALUES (?, ?, ?, ?, ?, 0, ?, ?, ?, ?)";
        return jdbcTemplate.update(sql, new PreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement ps) throws SQLException {
                for (int i = 0; i < source.length; i++) {
                    ps.setObject(i + 1, source[i]);
                }
            }
        }) == 1 ? true : false;
    }

    /**
     * 插入资源标签映射表
     *
     * @param tagids
     * @return
     */
    public boolean insertSourceTag(String[] tagids, String sourceid) {
        String sql = "INSERT INTO t_source_tag VALUES (?, ?)";
        int a[] = jdbcTemplate.batchUpdate(sql, new BatchPreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement ps, int i) throws SQLException {
                ps.setString(1, sourceid);
                ps.setString(2, tagids[i]);
            }

            @Override
            public int getBatchSize() {
                return tagids.length;
            }
        });
        return true;
    }

    /**
     * 根据条件查询符合条件的资源
     *
     * @param tags
     * @return
     */
    public List<Source> getSourcesWithOption(String[] tags) {
        if (tags.length == 0)
            return new LinkedList<Source>();
        String sql = "";
        String sql1 = "select DISTINCT t_source.sourceid, sourcename, path, author, uploadtime, visits, srole , sdescribe , stype, tagstext from t_source, t_tag, t_source_tag where ";
        String sql2 = " t_source.sourceid = t_source_tag.sourceid and ";
        String sql3 = " t_tag.tagid = t_source_tag.tagid";
        if (tags.length > 0) {
            String sql4 = " and ( t_tag.tagid = " + tags[0];
            for (int i = 1; i < tags.length; i++) {
                sql4 += " or " + "  t_tag.tagid = " + tags[i];
            }
            sql4 += ")";
            sql = sql1 + sql2 + sql3 + sql4;
        } else {
            sql = sql1 + sql2 + sql3;
        }
        System.out.println(sql);
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper(Source.class));
    }

    /**
     * 根据关键词查询
     *
     * @param keyWord
     * @return
     */
    public List<Source> queryWithKeyWord(String keyWord) {
        keyWord = keyWord.toUpperCase();
        String sql = "select DISTINCT t_source.sourceid, sourcename, path, author, uploadtime, visits, srole , sdescribe , stype, tagstext from t_source, t_tag, t_source_tag ";
        String sql1 = " where t_source.sourceid = t_source_tag.sourceid and t_tag.tagid = t_source_tag.tagid ";
        String sql2 = " and (upper(sourcename) like '%" + keyWord + "%'";
        String sql3 = " or upper(author) like '%" + keyWord + "%'";
        String sql4 = " or upper(stype) like '%" + keyWord + "%'";
        String sql5 = " or upper(sdescribe) like '%" + keyWord + "%'";
        String sql6 = " or upper(tagname) like '%" + keyWord + "%')";
        sql += sql1 + sql2 + sql3 + sql4 + sql5 + sql6;
        System.out.print(sql);
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper(Source.class));
    }

    /**
     * 更新资源的下载次数
     *
     * @param id
     * @return
     */
    public boolean updateDownloadTime(String id) {
        String sql = "update t_source set visits = visits + 1 where sourceid = '" + id + "'";
        return jdbcTemplate.update(sql) > 0 ? true : false;
    }

    /**
     * 获得所有的资源
     *
     * @return
     */
    public List<Source> getAllSource() {
        return jdbcTemplate.query("select * from t_source", new BeanPropertyRowMapper(Source.class));
    }

    /**
     * 删除资源
     *
     * @param sourcepath
     * @return
     */
    public boolean deleteSource(String sourcepath) {
        return jdbcTemplate.update("delete from t_source where path = \"" + sourcepath + "\"") > 0 ? true : false;
    }

    /**
     * 获取一条资源
     *
     * @param id
     * @return
     */
    public List<Source> getASource(String id) {
        return jdbcTemplate.query("select * from t_source where sourceid = '" + id + "'", new BeanPropertyRowMapper(Source.class));
    }

    /**
     * 更新资源
     *
     * @param strs
     * @return
     */
    public boolean updateSource(String tagids, String sourceid, String... strs) {
        try {
            String sql = "delete from t_source_tag where sourceid = '" + sourceid + "'";
            jdbcTemplate.update(sql);
            insertSourceTag(tagids.split(";"), sourceid);
            sql = "update t_source set sourcename = ?, uploadtime = ?, srole = ?, sdescribe = ?, stype = ?, tagstext = ? where sourceid = '" + sourceid + "'";
            return jdbcTemplate.update(sql, new PreparedStatementSetter() {

                @Override
                public void setValues(PreparedStatement ps) throws SQLException {
                    for (int i = 0; i < strs.length; i++) {
                        ps.setObject(i + 1, strs[i]);
                    }
                }
            }) > 0 ? true : false;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
