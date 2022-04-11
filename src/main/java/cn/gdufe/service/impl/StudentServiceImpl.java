package cn.gdufe.service.impl;

import cn.gdufe.dao.StudentDao;
import cn.gdufe.dao.impl.StudentDaoImpl;
import cn.gdufe.domain.PageBean;
import cn.gdufe.domain.Student;
import cn.gdufe.service.StudentService;

import java.util.List;
import java.util.Map;

public class StudentServiceImpl implements StudentService {
    private final StudentDao dao = new StudentDaoImpl();

    @Override
    public void addStudent(Student student) {
        dao.addStudent(student);
    }

    @Override
    public Student findStudent(String sid) {
        return dao.findStudent(sid);
    }

    @Override
    public void deleteStudent(String sid) {
        dao.delStudent(sid);
    }

    @Override
    public PageBean<Student> findStudentByPage(String _currentPage, String _rows, Map<String, String[]> condition) {
        int currentPage=Integer.parseInt(_currentPage);
        int rows=Integer.parseInt(_rows);
        if (currentPage<=0){
            currentPage=1;
        }
        //1.创建空pageBean对象
        PageBean<Student> studentPageBean = new PageBean<>();
        //2.设置参数
        studentPageBean.setCurrentPage(currentPage);
        studentPageBean.setRows(rows);
        //3.调用dao查询总记录数
        int totalCount=dao.findTotalCount(condition);
        studentPageBean.setTotalCount(totalCount);
        //4.调用dao查询List集合
        //计算开始的记录索引
        int start=(currentPage-1)*rows;
        List<Student> list=dao.findByPage(start,rows,condition);
        studentPageBean.setList(list);
        //5.计算总页码数
        int totalPage=(totalCount%rows)==0?(totalCount/rows):(totalCount/rows)+1;
        studentPageBean.setTotalPage(totalPage);
        return studentPageBean;
    }

    @Override
    public void updateStudent(Student student) {
        dao.updateStudent(student);
    }
}
