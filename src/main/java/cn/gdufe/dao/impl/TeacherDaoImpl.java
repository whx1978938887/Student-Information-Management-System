package cn.gdufe.dao.impl;

import cn.gdufe.dao.TeacherDao;
import cn.gdufe.domain.Teacher;
import cn.gdufe.util.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

public class TeacherDaoImpl implements TeacherDao {
    private final JdbcTemplate template=new JdbcTemplate(JDBCUtils.getDataSource());

    @Override
    public void addTeacher(Teacher teacher) {
        //1.定义sql
        String sql="insert into teacher values(null,?,?,?,?,?,?,?)";
        //2.执行sql
        template.update(sql,teacher.getTid(),teacher.getName(),teacher.getAge(),
                teacher.getGender(),teacher.getGrade(),teacher.getClassId(),teacher.getAddress());
    }

    @Override
    public Teacher findTeacher(String tid) {
        //1.定义sql
        String sql="select * from teacher where tid=?";
        //2.执行sql
        try{
            return template.queryForObject(sql,new BeanPropertyRowMapper<>(Teacher.class),tid);
        }catch (Exception e){
            return null;
        }
    }

    @Override
    public void deleteTeacher(String tid) {
        String sql="delete from teacher where tid = ?";
        template.update(sql,tid);
    }

    @Override
    public void updateTeacher(Teacher teacher) {
        //1.定义sql
        String sql="update teacher set name=?,age=?,gender=?,grade=?,classId=?,address=? where tid=?";
        //2.执行sql
        template.update(sql,teacher.getName(),teacher.getAge(),teacher.getGender(),
                teacher.getClassId(),teacher.getAddress(),teacher.getTid());
    }
}
