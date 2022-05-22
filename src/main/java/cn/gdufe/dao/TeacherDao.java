package cn.gdufe.dao;

import cn.gdufe.domain.Teacher;

import java.util.List;
import java.util.Map;

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

    /**
     * 查询所有教师
     * @return 所有教师集合
     */
    List<Teacher> findAllTeacher();

    /**
     * 按条件查询教师
     * @param condition 条件
     * @return 满足条件的教师
     */
    List<Teacher> queryTeacher(Map<String, String[]> condition);
}
