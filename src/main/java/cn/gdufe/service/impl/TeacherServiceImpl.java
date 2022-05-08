package cn.gdufe.service.impl;

import cn.gdufe.dao.TeacherDao;
import cn.gdufe.dao.impl.TeacherDaoImpl;
import cn.gdufe.domain.Teacher;
import cn.gdufe.service.TeacherService;

import java.util.List;

public class TeacherServiceImpl implements TeacherService {
    private final TeacherDao dao = new TeacherDaoImpl();

    @Override
    public void addTeacher(Teacher teacher) {
        dao.addTeacher(teacher);
    }

    @Override
    public Teacher findTeacher(String tid) {
        return dao.findTeacher(tid);
    }

    @Override
    public void deleteTeacher(String tid) {
        dao.deleteTeacher(tid);
    }

    @Override
    public void updateTeacher(Teacher teacher) {
        dao.updateTeacher(teacher);
    }

    @Override
    public List<Teacher> findAllTeacher() {
        return dao.findAllTeacher();
    }
}
