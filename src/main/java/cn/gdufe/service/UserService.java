package cn.gdufe.service;

import cn.gdufe.domain.User;


/**
 * 用户管理的业务接口
 */
public interface UserService {

    /**
     * 登录
     * @param loginUser
     * @return
     */
    User login(User loginUser);

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
    void addUser(User user);

    /**
     * 更新用户信息
     * @param user
     */
    void updateUser(User user);
}
