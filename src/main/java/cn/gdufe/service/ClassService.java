package cn.gdufe.service;

import cn.gdufe.domain.Class;

public interface ClassService {

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
     * 更新班级信息 班级对象
     * @param c 班级对象
     */
    void updateClass(Class c);
}
