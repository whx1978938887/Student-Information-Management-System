package cn.gdufe.dao.impl;

import cn.gdufe.dao.TeacherDao;
import cn.gdufe.domain.Teacher;
import cn.gdufe.util.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class TeacherDaoImpl implements TeacherDao {
    private final JdbcTemplate template=new JdbcTemplate(JDBCUtils.getDataSource());

    @Override
    public void addTeacher(Teacher teacher) {
        //1.定义sql
        String sql="insert into teacher values(null,?,?,?,?,?,?,?,?)";
        //2.执行sql
        template.update(sql,teacher.getTid(),teacher.getName(),teacher.getAge(),
                teacher.getGender(),teacher.getGrade(),teacher.getCollege(),teacher.getSpecialty(),teacher.getAddress());
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
        String sql="update teacher set name=?,age=?,gender=?,grade=?,college=?,specialty=?,address=? where tid=?";
        //2.执行sql
        template.update(sql,teacher.getName(),teacher.getAge(),teacher.getGender(),
                teacher.getCollege(),teacher.getSpecialty(),teacher.getAddress(),teacher.getTid());
    }

    @Override
    public List<Teacher> findAllTeacher() {
        //1.定义sql
        String sql="select * from teacher";
        //2.执行sql
        return template.query(sql,new BeanPropertyRowMapper<>(Teacher.class));
    }

    @Override
    @SuppressWarnings("all")
    public List<Teacher> queryTeacher(Map<String, String[]> condition) {
        //1.定义sql
        String sql="select * from teacher where 1=1";
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
        return template.query(sql,new BeanPropertyRowMapper<>(Teacher.class),params.toArray());
    }
}
