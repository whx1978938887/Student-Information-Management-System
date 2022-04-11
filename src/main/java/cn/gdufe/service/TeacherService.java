package cn.gdufe.service;

import cn.gdufe.domain.PageBean;
import cn.gdufe.domain.Teacher;

import java.util.Map;

public interface TeacherService {

    /**
     * 添加教师
     * @param teacher
     */
    void addTeacher(Teacher teacher);

    /**
     * 通过id查找教师
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
     * 分页查询教师
     * @param currentPage
     * @param rows
     * @param condition
     * @return
     */
    PageBean<Teacher> findTeacherByPage(String currentPage, String rows, Map<String, String[]> condition);

    /**
     * 更新教师信息
     * @param teacher
     */
    void updateTeacher(Teacher teacher);
}
