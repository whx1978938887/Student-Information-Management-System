package cn.gdufe.dao.impl;

import cn.gdufe.dao.ClassDao;
import cn.gdufe.domain.Class;
import cn.gdufe.util.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

public class ClassDaoImpl implements ClassDao {
    private final JdbcTemplate template=new JdbcTemplate(JDBCUtils.getDataSource());

    @Override
    public void addClass(Class c) {
        //1.定义sql
        String sql="insert into class values(null,?,?,?,?,?,?,?)";
        //2.执行sql
        template.update(sql,c.getClassId(),c.getYear(),c.getSpecialty(),
                c.getCollege(),c.getNumber(),c.getProportion(),c.getHeadteacher());
    }

    @Override
    public Class findClass(String classId) {
        //1.定义sql
        String sql="select * from class where classId=?";
        //2.执行sql
        try{
            return template.queryForObject(sql,new BeanPropertyRowMapper<>(Class.class),classId);
        }catch (Exception e){
            return null;
        }
    }

    @Override
    public void deleteClass(String classId) {
        //1.定义sql
        String sql="delete from class where classId=?";
        //2.执行sql
        template.update(sql,classId);
    }

    @Override
    public void updateClass(Class c) {
        //1.定义sql
        String sql="update class set year=?,specialty=?,college=?,number=?,proportion=?,headteacher=? where classId=?";
        //2.执行sql
        template.update(sql,c.getYear(),c.getSpecialty(),c.getCollege(),c.getNumber(),
                c.getProportion(),c.getHeadteacher(),c.getClassId());
    }
}