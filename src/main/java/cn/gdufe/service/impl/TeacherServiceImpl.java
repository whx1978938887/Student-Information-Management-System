package cn.gdufe.service.impl;

import cn.gdufe.service.impl.dao.TeacherDao;
import cn.gdufe.service.impl.dao.impl.TeacherDaoImpl;
import cn.gdufe.domain.PageBean;
import cn.gdufe.domain.Teacher;
import cn.gdufe.service.TeacherService;

import java.util.List;
import java.util.Map;

public class TeacherServiceImpl implements TeacherService {
    private final TeacherDao dao = new TeacherDaoImpl();

    @Override
    public void addTeacher(Teacher teacher) {
        dao.addTeacher(teacher);
    }

    @Override
    public Teacher findTeacher(String tid) {
        return dao.findTeacher(tid);
    }

    @Override
    public void deleteTeacher(String tid) {
        dao.deleteTeacher(tid);
    }

    @Override
    public PageBean<Teacher> findTeacherByPage(String _currentPage, String _rows, Map<String, String[]> condition) {
        int currentPage=Integer.parseInt(_currentPage);
        int rows=Integer.parseInt(_rows);
        if (currentPage<=0){
            currentPage=1;
        }
        //1.创建空PageBean对象
        PageBean<Teacher> teacherPageBean = new PageBean<>();
        //2.设置参数
        teacherPageBean.setCurrentPage(currentPage);
        teacherPageBean.setRows(rows);
        //3.调用dao查询总记录数
        int totalCount=dao.findTotalCount(condition);
        teacherPageBean.setTotalPage(totalCount);
        //4.调用dao查询List集合
        //计算开始的记录索引
        int start=(currentPage-1)*rows;
        List<Teacher> list=dao.findByPage(start,rows,condition);
        teacherPageBean.setList(list);
        //5.计算总页码
        int totalPage=(totalCount%rows)==0?(totalCount/rows):(totalCount/rows)+1;
        teacherPageBean.setTotalPage(totalPage);
        return teacherPageBean;
    }

    @Override
    public void updateTeacher(Teacher teacher) {
        dao.updateTeacher(teacher);
    }
}
