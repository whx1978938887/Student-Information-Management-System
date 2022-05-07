package cn.gdufe.service;

import cn.gdufe.domain.Student;

public interface StudentService {

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
    void deleteStudent(String sid);

    /**
     * 更新学生信息
     * @param student 学生对象
     */
    void updateStudent(Student student);
}
