package cn.gdufe.dao;

import cn.gdufe.domain.Class;

import java.util.List;
import java.util.Map;

public interface ClassDao {

    /**
     * 按条件查询班级
     * @param condition 条件
     * @return 满足条件的班级
     */
    List<Class> queryClass(Map<String, String[]> condition);

    /**
     * 查询所有班级
     * @return 所有班级
     */
    List<Class> findAllClass();
}
