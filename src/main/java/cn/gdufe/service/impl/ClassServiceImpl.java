package cn.gdufe.service.impl;

import cn.gdufe.dao.ClassDao;
import cn.gdufe.dao.impl.ClassDaoImpl;
import cn.gdufe.domain.Class;
import cn.gdufe.domain.PageBean;
import cn.gdufe.service.ClassService;

import java.util.List;
import java.util.Map;

public class ClassServiceImpl implements ClassService {
    private final ClassDao dao = new ClassDaoImpl();

    @Override
    public void addClass(Class c) {
        dao.addClass(c);
    }

    @Override
    public Class findClass(String classId) {
        return dao.findClass(classId);
    }

    @Override
    public void deleteClass(String classId) {
        dao.deleteClass(classId);
    }

    @Override
    public PageBean<Class> findClassByPage(String _currentPage, String _rows, Map<String, String[]> condition) {
        int currentPage=Integer.parseInt(_currentPage);
        int rows=Integer.parseInt(_rows);
        if (currentPage<=0){
            currentPage=1;
        }
        //1.创建空pageBean对象
        PageBean<Class> classPageBean = new PageBean<>();
        //2.设置参数
        classPageBean.setCurrentPage(currentPage);
        classPageBean.setRows(rows);
        //3.调用dao查询总记录数
        int totalCount=dao.findTotalCount(condition);
        classPageBean.setTotalCount(totalCount);
        //4.调用dao查询List集合
        //计算开始的记录索引
        int start=(currentPage-1)*rows;
        List<Class> list=dao.findByPage(start,rows,condition);
        classPageBean.setList(list);
        //5.计算总页码数
        int totalPage=(totalCount%rows)==0?(totalCount/rows):(totalCount/rows)+1;
        classPageBean.setTotalPage(totalPage);
        return classPageBean;
    }

    @Override
    public void updateClass(Class c) {
        dao.updateClass(c);
    }
}
