package cn.gdufe.service.impl;

import cn.gdufe.dao.ClassDao;
import cn.gdufe.dao.impl.ClassDaoImpl;
import cn.gdufe.domain.Class;
import cn.gdufe.service.ClassService;

import java.util.List;
import java.util.Map;

public class ClassServiceImpl implements ClassService {
    private final ClassDao dao = new ClassDaoImpl();

    @Override
    public List<Class> queryClass(Map<String, String[]> condition) {
        return dao.queryClass(condition);
    }

    @Override
    public List<Class> findAllClass() {
        return dao.findAllClass();
    }
}
