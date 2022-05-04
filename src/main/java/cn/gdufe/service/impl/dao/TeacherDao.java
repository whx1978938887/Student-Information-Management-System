package cn.gdufe.service.impl.dao;

import cn.gdufe.domain.Teacher;

import java.util.List;
import java.util.Map;

public interface TeacherDao {
    /**
     * 通过条件查询教师
     * @param key
     * @param tid
     * @return
     */
    Teacher findTeacherByCondition(String key, String tid);

    /**
     * 添加教师
     * @param teacher
     */
    void addTeacher(Teacher teacher);

    /**
     * 通过id查询教师
     * @param tid
     * @return
     */
    Teacher findTeacher(String tid);

    /**
     * 删除教师
     * @param tid
     */
    void deleteTeacher(String tid);

    /**
     * 条件查询记录数量
     * @param condition
     * @return
     */
    int findTotalCount(Map<String, String[]> condition);

    /**
     * 分页查询教师信息
     * @param start
     * @param rows
     * @param condition
     * @return
     */
    List<Teacher> findByPage(int start, int rows, Map<String, String[]> condition);

    /**
     * 更新教师信息
     * @param teacher
     */
    void updateTeacher(Teacher teacher);
}
