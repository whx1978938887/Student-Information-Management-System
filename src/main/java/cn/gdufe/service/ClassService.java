package cn.gdufe.service;

import cn.gdufe.domain.Class;
import cn.gdufe.domain.Student;
import cn.gdufe.domain.Teacher;

import java.util.List;
import java.util.Map;

public interface ClassService {

    /**
     * 按条件查询班级
     * @param condition 条件
     * @return 满足条件的班级
     */
    List<Class> queryClass(Map<String, String[]> condition);

    /**
     * 查询所有班级
     * @return 所有班级
     */
    List<Class> findAllClass();

    /**
     * 班级学生数+1
     * @param student 学生对象
     */
    void addStudent(Student student);

    /**
     * 班级学生数-1
     * @param student 学生对象
     */
    void deleteStudent(Student student);

    /**
     * 班级教师数+1
     * @param teacher 教师对象
     */
    void addTeacher(Teacher teacher);

    /**
     * 班级教师数-1
     * @param teacher 教师对象
     */
    void deleteTeacher(Teacher teacher);
}
