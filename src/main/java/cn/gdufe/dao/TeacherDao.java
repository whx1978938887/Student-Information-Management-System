package cn.gdufe.dao;

import cn.gdufe.domain.Teacher;

public interface TeacherDao {

    /**
     * 添加教师
     * @param teacher 教师对象
     */
    void addTeacher(Teacher teacher);

    /**
     * 通过id查询教师
     * @param tid 教师id
     * @return 教师对象
     */
    Teacher findTeacher(String tid);

    /**
     * 删除教师
     * @param tid 教师id
     */
    void deleteTeacher(String tid);

    /**
     * 更新教师信息
     * @param teacher 教师对象
     */
    void updateTeacher(Teacher teacher);
}
