package cn.gdufe.service;

import cn.gdufe.domain.User;


/**
 * 用户管理的业务接口
 */
public interface UserService {

    /**
     * 登录
     * @param loginUser 请求登录的用户对象
     * @return 查询的用户对象
     */
    User login(User loginUser);

    /**
     * 通过用户名查询用户
     * @param username 用户名
     * @return 用户对象
     */
    User findUser(String username);

    /**
     * 添加用户
     * @param user 用户对象
     */
    void addUser(User user);

    /**
     * 更新用户信息
     * @param user 用户对象
     */
    void updateUser(User user);
}
