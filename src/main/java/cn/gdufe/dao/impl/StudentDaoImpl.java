package cn.gdufe.dao.impl;

import cn.gdufe.dao.StudentDao;
import cn.gdufe.domain.Student;
import cn.gdufe.util.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.Map;

public class StudentDaoImpl implements StudentDao {
    private final JdbcTemplate template=new JdbcTemplate(JDBCUtils.getDataSource());

    @Override
    public void addStudent(Student student) {
        //1.定义sql
        String sql="insert into student values(null,?,?,?,?,?,?,?)";
        //2.执行sql
        template.update(sql,student.getSid(),student.getName(),student.getAge(),
                student.getGender(),student.getGrade(),student.getClassId(),student.getAddress());
    }

    @Override
    public Student findStudent(String sid) {
        //1.定义sql
        String sql="select * from student where sid=?";
        //2.执行sql
        try{
            return template.queryForObject(sql,new BeanPropertyRowMapper<>(Student.class),sid);
        }catch (Exception e){
            return null;
        }
    }

    @Override
    public void delStudent(String sid) {
        String sql="delete from student where sid=?";
        template.update(sql,sid);
    }

    @Override
    public void updateStudent(Student student) {
        //1.定义sql
        String sql="update student set name=?,age=?,gender=?,grade=?,classId=?,address=? where sid=?";
        //2.执行sql
        template.update(sql,student.getName(),student.getAge(),student.getGender(),
                student.getClassId(),student.getAddress(),student.getSid());
    }

    @Override
    public Map<String, Object> findAllStudent() {
        //1.定义sql
        String sql="select * from student";
        return template.queryForMap(sql);
    }
}
