package cn.gdufe.web.servlet.student;


import cn.gdufe.domain.Student;
import cn.gdufe.service.ClassService;
import cn.gdufe.service.StudentService;
import cn.gdufe.service.impl.ClassServiceImpl;
import cn.gdufe.service.impl.StudentServiceImpl;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

@WebServlet("/addStudentServlet")
public class AddStudentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        //1.设置编码
        request.setCharacterEncoding("utf-8");

        //2.获取参数
        Map<String, String[]> map = request.getParameterMap();

        //3.调用service方法
        String sid = request.getParameter("sid");
        StudentService service = new StudentServiceImpl();
        Student findStudent=service.findStudent(sid);
        if (findStudent!=null){
            //提示信息
            request.setAttribute("add_msg","学生已存在！");
            request.getRequestDispatcher("/menu.jsp").forward(request,response);
        }else{
            //封装student对象
            Student student = new Student();
            try {
                BeanUtils.populate(student,map);
            } catch (IllegalAccessException | InvocationTargetException e) {
                e.printStackTrace();
            }
            service.addStudent(student);

            //更新class表
            ClassService service1=new ClassServiceImpl();
            service1.addStudent(student);

            //跳转
            response.sendRedirect(request.getContextPath()+"/menu.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        this.doPost(request, response);
    }
}
