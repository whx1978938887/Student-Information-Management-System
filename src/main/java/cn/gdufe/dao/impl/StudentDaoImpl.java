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
    public int findTotalCount(Map<String, String[]> condition) {
        //1.定义模板初始化sql
        String sql="select count(*) from student where 1=1 ";
        StringBuilder sb=new StringBuilder(sql);
        //2.遍历map
        //定义参数的集合
        List<Object> params= new ArrayList<>();
        Set<String> keySet = condition.keySet();
        for (String k : keySet) {
            //排除分页条件参数
            if ("currentPage".equals(k)||"rows".equals(k)){
                continue;
            }
            //获取value
            String value = condition.get(k)[0];
            //判断value是否有值
            if (value!=null&& !"".equals(value)){
                //有值
                sb.append(" and "+k+" like ? ");
                params.add("%"+value+"%");//？条件的值
            }
        }
        return template.queryForObject(sb.toString(),Integer.class,params.toArray());
    }

    @Override
    public List<Student> findByPage(int start, int rows, Map<String, String[]> condition) {
        String sql="select * from student where 1=1 ";
        StringBuilder sb=new StringBuilder(sql);
        //2.遍历map
        //定义参数的集合
        List<Object> params= new ArrayList<>();
        Set<String> keySet = condition.keySet();
        for (String k : keySet) {
            //排除分页条件参数
            if ("currentPage".equals(k)||"rows".equals(k)){
                continue;
            }
            //获取value
            String value = condition.get(k)[0];
            //判断value是否有值
            if (value!=null&& !"".equals(value)){
                //有值
                sb.append(" and "+k+" like ? ");
                params.add("%"+value+"%");//？条件的值
            }
        }
        //添加分页查询
        sb.append(" limit ?, ?");
        //添加分页查询参数值
        params.add(start);
        params.add(rows);
        sql=sb.toString();
        System.out.println(sql);
        System.out.println(params);
        return template.query(sql, new BeanPropertyRowMapper<>(Student.class),params.toArray());
    }

    @Override
    public void updateStudent(Student student) {
        //1.定义sql
        String sql="update student set name=?,age=?,gender=?,grade=?,classId=?,address=? where sid=?";
        //2.执行sql
        template.update(sql,student.getName(),student.getAge(),student.getGender(),
                student.getClassId(),student.getAddress(),student.getSid());
    }
}
