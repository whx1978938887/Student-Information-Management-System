package cn.gdufe.service.impl;

import cn.gdufe.dao.StudentDao;
import cn.gdufe.dao.impl.StudentDaoImpl;
import cn.gdufe.domain.Student;
import cn.gdufe.service.StudentService;

import java.util.List;
import java.util.Map;

public class StudentServiceImpl implements StudentService {
    private final StudentDao dao = new StudentDaoImpl();

    @Override
    public void addStudent(Student student) {
        dao.addStudent(student);
    }

    @Override
    public Student findStudent(String sid) {
        return dao.findStudent(sid);
    }

    @Override
    public void deleteStudent(String sid) {
        dao.delStudent(sid);
    }

    @Override
    public void updateStudent(Student student) {
        dao.updateStudent(student);
    }

    @Override
    public List<Student> findAllStudent() {
        return dao.findAllStudent();
    }

    @Override
    public List<Student> queryStudent(Map<String, String[]> condition) {
        return dao.queryStudent(condition);
    }
}
