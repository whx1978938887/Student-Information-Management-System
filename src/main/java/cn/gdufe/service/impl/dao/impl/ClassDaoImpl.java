package cn.gdufe.service.impl.dao.impl;

import cn.gdufe.service.impl.dao.ClassDao;
import cn.gdufe.domain.Class;
import cn.gdufe.util.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

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
    public int findTotalCount(Map<String, String[]> condition) {
        //1.定义模板初始化sql
        String sql="select count(*) from class where 1=1 ";
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
    public List<Class> findByPage(int start, int rows, Map<String, String[]> condition) {
        String sql="select * from class where 1=1 ";
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
        return template.query(sql, new BeanPropertyRowMapper<>(Class.class),params.toArray());
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