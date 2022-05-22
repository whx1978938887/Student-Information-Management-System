package cn.gdufe.dao.impl;

import cn.gdufe.dao.UserDao;
import cn.gdufe.domain.User;
import cn.gdufe.util.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

public class UserDaoImpl implements UserDao {
    private final JdbcTemplate template=new JdbcTemplate(JDBCUtils.getDataSource());

    @Override
    public User findUserByUsernameAndPassword(User loginUser){
        User user;
        try{
            //1.定义sql
            String sql="select * from user where username=? and password=?";
            //2.查询数据
            user = template.queryForObject(sql,
                    new BeanPropertyRowMapper<>(User.class),
                    loginUser.getUsername(), loginUser.getPassword());
            return user;
        }catch (Exception e){
            return null;
        }
    }

    @Override
    public User findUser(String username) {
        //1.定义sql语句
        String sql="select * from user where username=?";
        //2.查询数据
        try{
            return template.queryForObject(sql,
                    new BeanPropertyRowMapper<>(User.class),username);
        }catch (Exception e){
            return null;
        }
    }

    @Override
    public void add(User user) {
        //1.定义sql
        String sql="insert into user values(null,?,?,?,?,?,?)";
        //2.执行sql
        template.update(sql,user.getUsername(),user.getPassword(),
                user.getEmail(),user.getName(),user.getPhone(),user.getGender());
    }

    @Override
    public void updateUser(User user) {
        //1.定义sql
        String sql="update user set name=?,password=?,email=?,name=?,phone=?,gender=? where username=?";
        //2.执行sql
        template.update(sql,user.getName(),user.getPassword(),user.getEmail(),user.getName(),user.getPhone(),
              user.getGender(),user.getUsername());
    }
}
