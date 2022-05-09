package cn.gdufe.dao.impl;

import cn.gdufe.dao.ClassDao;
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
    @SuppressWarnings("all")
    public List<Class> queryClass(Map<String, String[]> condition) {
        //1.定义sql
        String sql="select * from class where 1=1";
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
        return template.query(sql,new BeanPropertyRowMapper<>(Class.class),params.toArray());
    }

    @Override
    public List<Class> findAllClass() {
        //1.定义sql
        String sql="select * from class";
        //2.执行sql
        return template.query(sql,new BeanPropertyRowMapper<>(Class.class));
    }

}