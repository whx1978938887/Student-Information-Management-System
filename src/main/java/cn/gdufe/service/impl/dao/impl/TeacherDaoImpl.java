package cn.gdufe.service.impl.dao.impl;

import cn.gdufe.service.impl.dao.TeacherDao;
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
    public Teacher findTeacherByCondition(String key, String condition) {
        //1.定义sql
        condition="%"+condition+"%";
        String sql="select * from teacher where "+key+"=?";
        //2.执行sql
        try{
            return template.queryForObject(sql,new BeanPropertyRowMapper<>(Teacher.class),condition);
        }catch (Exception e){
            return null;
        }
    }

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
    public int findTotalCount(Map<String, String[]> condition) {
        //1.定义模板初始化sql
        String sql="select count(*) from teacher where 1=1 ";
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
    public List<Teacher> findByPage(int start, int rows, Map<String, String[]> condition) {
        String sql="select * from teacher where 1=1 ";
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
        return template.query(sql, new BeanPropertyRowMapper<>(Teacher.class),params.toArray());
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
