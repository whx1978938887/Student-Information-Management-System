package cn.gdufe.dao.impl;

import cn.gdufe.dao.StudentDao;
import cn.gdufe.domain.Student;
import cn.gdufe.util.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class StudentDaoImpl implements StudentDao {
    private final JdbcTemplate template=new JdbcTemplate(JDBCUtils.getDataSource());

    @Override
    public void addStudent(Student student) {
        //1.定义sql
        String sql="insert into student values(null,?,?,?,?,?,?,?,?)";
        //2.执行sql
        template.update(sql,student.getSid(),student.getName(),student.getAge(),
                student.getGender(),student.getGrade(),student.getCollege(),student.getSpecialty(),student.getAddress());
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
        String sql="update student set name=?,age=?,gender=?,grade=?,college=?,specialty=?,address=? where sid=?";
        //2.执行sql
        template.update(sql,student.getName(),student.getAge(),student.getGender(),
                student.getGrade(),student.getCollege(),student.getSpecialty(),student.getAddress(),student.getSid());
    }

    @Override
    public List<Student> findAllStudent() {
        //1.定义sql
        String sql="select * from student";
        //2.执行sql
        return template.query(sql,new BeanPropertyRowMapper<>(Student.class));
    }

    @Override
    @SuppressWarnings("all")
    public List<Student> queryStudent(Map<String, String[]> condition) {
        //1.定义sql
        String sql="select * from student where 1=1";
        StringBuilder sb = new StringBuilder(sql);
        //2.遍历map
        //定义参数的集合
        List<Object> params=new ArrayList<>();
        Set<String> keySet = condition.keySet();
        for (String k : keySet) {
            //获取value
            String value = condition.get(k)[0];
            if (value!=null&&!"".equals(value)){
                //参数有值
                sb.append(" and "+k+" like ? ");
                params.add("%"+value+"%");
            }
        }
        sql=sb.toString();
        return template.query(sql,new BeanPropertyRowMapper<>(Student.class),params.toArray());
    }
}
