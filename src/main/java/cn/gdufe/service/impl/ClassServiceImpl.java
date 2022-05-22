package cn.gdufe.service.impl;

import cn.gdufe.dao.ClassDao;
import cn.gdufe.dao.impl.ClassDaoImpl;
import cn.gdufe.domain.Class;
import cn.gdufe.domain.Student;
import cn.gdufe.domain.Teacher;
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

    @Override
    public void addStudent(Student student) {
        dao.addStudent(student);
    }

    @Override
    public void deleteStudent(Student student) {
        dao.deleteStudent(student);
    }

    @Override
    public void addTeacher(Teacher teacher) {
        dao.addTeacher(teacher);
    }

    @Override
    public void deleteTeacher(Teacher teacher) {
        dao.deleteTeacher(teacher);
    }
}
