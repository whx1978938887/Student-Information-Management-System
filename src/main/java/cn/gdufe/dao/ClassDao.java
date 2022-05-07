package cn.gdufe.dao;

import cn.gdufe.domain.Class;

public interface ClassDao {

    /**
     * 添加班级
     * @param c 班级对象
     */
    void addClass(Class c);

    /**
     * 通过id查询班级
     * @param classId 班级id
     * @return 班级对象
     */
    Class findClass(String classId);

    /**
     * 删除班级
     * @param classId 班级id
     */
    void deleteClass(String classId);

    /**
     * 更新班级信息
     * @param c 班级对象
     */
    void updateClass(Class c);
}
