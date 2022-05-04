package cn.gdufe.dao;

import cn.gdufe.domain.Class;
import java.util.List;
import java.util.Map;

public interface ClassDao {

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
     * 条件查询学生数量
     * @param condition
     * @return
     */
    int findTotalCount(Map<String, String[]> condition);

    /**
     * 分页查询班级信息
     * @param start
     * @param rows
     * @param condition
     * @return
     */
    List<Class> findByPage(int start, int rows, Map<String, String[]> condition);

    /**
     * 更新班级信息
     * @param c
     */
    void updateClass(Class c);
}
