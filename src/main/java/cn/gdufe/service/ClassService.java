package cn.gdufe.service;

import cn.gdufe.domain.Class;
import cn.gdufe.domain.PageBean;

import java.util.Map;

public interface ClassService {

    /**
     * 添加班级
     * @param c
     */
    void addClass(Class c);

    /**
     * 通过id查询班级
     * @param classId
     * @return
     */
    Class findClass(String classId);

    /**
     * 删除班级
     * @param classId
     */
    void deleteClass(String classId);

    /**
     * 分页查询班级
     * @param currentPage
     * @param rows
     * @param condition
     * @return
     */
    PageBean<Class> findClassByPage(String currentPage, String rows, Map<String, String[]> condition);

    /**
     * 更新班级信息
     * @param c
     */
    void updateClass(Class c);
}
