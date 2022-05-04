package cn.gdufe.service.impl.dao;

import cn.gdufe.domain.User;


/**
 * 用户操作的dao
 */
public interface UserDao {
    /**
     * 通过用户名和密码登录
     */
    User findUserByUsernameAndPassword(User loginUser);

    /**
     * 通过用户名查询用户
     * @param username
     * @return
     */
    User findUser(String username);

    /**
     * 添加用户
     * @param user
     */
    void add(User user);

    /**
     * 更新用户信息
     * @param user
     */
    void updateUser(User user);
}
