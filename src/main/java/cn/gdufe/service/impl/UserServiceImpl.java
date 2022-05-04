package cn.gdufe.service.impl;

import cn.gdufe.dao.UserDao;
import cn.gdufe.dao.impl.UserDaoImpl;
import cn.gdufe.domain.User;
import cn.gdufe.service.UserService;


public class UserServiceImpl implements UserService {
    private final UserDao dao = new UserDaoImpl();

    @Override
    public User login(User loginUser) {
        return dao.findUserByUsernameAndPassword(loginUser);
    }

    @Override
    public User findUser(String username) {
        return dao.findUser(username);
    }

    @Override
    public void addUser(User user) {
        dao.add(user);
    }

    @Override
    public void updateUser(User user) {
        dao.updateUser(user);
    }

}
