package cn.gdufe.service.impl.dao;

import cn.gdufe.domain.Student;

import java.util.List;
import java.util.Map;

public interface StudentDao {

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
    void delStudent(String sid);

    /**
     * 条件查询学生数量
     * @param condition
     * @return
     */
    int findTotalCount(Map<String, String[]> condition);

    /**
     * 分页查询学生信息
     * @param start
     * @param rows
     * @param condition
     * @return
     */
    List<Student> findByPage(int start, int rows, Map<String, String[]> condition);

    /**
     * 更新学生信息
     * @param student
     */
    void updateStudent(Student student);
}
