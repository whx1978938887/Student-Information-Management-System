package cn.gdufe.service.impl;

import cn.gdufe.dao.ClassDao;
import cn.gdufe.dao.impl.ClassDaoImpl;
import cn.gdufe.domain.Class;
import cn.gdufe.service.ClassService;

public class ClassServiceImpl implements ClassService {
    private final ClassDao dao = new ClassDaoImpl();

    @Override
    public void addClass(Class c) {
        dao.addClass(c);
    }

    @Override
    public Class findClass(String classId) {
        return dao.findClass(classId);
    }

    @Override
    public void deleteClass(String classId) {
        dao.deleteClass(classId);
    }

    @Override
    public void updateClass(Class c) {
        dao.updateClass(c);
    }
}
