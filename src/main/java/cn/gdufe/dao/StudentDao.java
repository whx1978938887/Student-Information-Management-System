package cn.gdufe.dao;

import cn.gdufe.domain.Student;

import java.util.List;
import java.util.Map;

public interface StudentDao {

    /**
     * 添加学生
     * @param student 学生对象
     */
    void addStudent(Student student);

    /**
     * 通过id查询学生
     * @param sid 学生id
     * @return 学生对象
     */
    Student findStudent(String sid);

    /**
     * 删除学生
     * @param sid 学生id
     */
    void delStudent(String sid);

    /**
     * 更新学生信息
     * @param student 学生对象
     */
    void updateStudent(Student student);

    /**
     * 查询学生列表
     * @return 学生列表
     */
    List<Student> findAllStudent();
}
