package cn.gdufe.dao;

import cn.gdufe.domain.User;


/**
 * 用户操作的dao
 */
public interface UserDao {
    /**
     * 通过用户名和密码登录
     * @param loginUser 登录的用户对象
     * @return 查询的用户对象
     */
    User findUserByUsernameAndPassword(User loginUser);

    /**
     * 通过用户名查询用户
     * @param username 用户id
     * @return 用户对象
     */
    User findUser(String username);

    /**
     * 添加用户
     * @param user 用户对象
     */
    void add(User user);

    /**
     * 更新用户信息
     * @param user 用户对象
     */
    void updateUser(User user);
}
