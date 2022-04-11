package cn.gdufe.service;

import cn.gdufe.domain.PageBean;
import cn.gdufe.domain.Student;

import java.util.Map;

public interface StudentService {

    /**
     * 添加学生
     * @param student
     */
    void addStudent(Student student);

    /**
     * 通过id查询学生
     * @param sid
     * @return
     */
    Student findStudent(String sid);


    /**
     * 删除学生
     * @param sid
     */
    void deleteStudent(String sid);

    /**
     * 分页查询学生
     * @param currentPage 当前页码
     * @param rows
     * @param condition
     * @return
     */
    PageBean<Student> findStudentByPage(String currentPage, String rows, Map<String, String[]> condition);

    /**
     * 更新学生信息
     * @param student
     */
    void updateStudent(Student student);
}
