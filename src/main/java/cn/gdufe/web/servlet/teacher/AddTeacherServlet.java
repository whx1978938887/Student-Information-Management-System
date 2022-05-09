package cn.gdufe.web.servlet.teacher;


import cn.gdufe.domain.Teacher;
import cn.gdufe.service.ClassService;
import cn.gdufe.service.TeacherService;
import cn.gdufe.service.impl.ClassServiceImpl;
import cn.gdufe.service.impl.TeacherServiceImpl;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

@WebServlet("/addTeacherServlet")
public class AddTeacherServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        //1.设置编码
        request.setCharacterEncoding("utf-8");

        //2.获取参数
        Map<String, String[]> map = request.getParameterMap();

        //3.调用service方法
        String tid = request.getParameter("tid");
        TeacherService service = new TeacherServiceImpl();
        Teacher findTeacher=service.findTeacher(tid);
        if (findTeacher!=null){
            //提示信息
            request.setAttribute("add_msg","教师已存在！");
            request.getRequestDispatcher("/menu.jsp").forward(request,response);
        }else{
            //封装teacher对象
            Teacher teacher = new Teacher();
            try {
                BeanUtils.populate(teacher,map);
            } catch (IllegalAccessException | InvocationTargetException e) {
                e.printStackTrace();
            }
            service.addTeacher(teacher);

            //更新class表
            ClassService service1=new ClassServiceImpl();
            service1.addTeacher(teacher);

            //跳转
            response.sendRedirect(request.getContextPath()+"/menu.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        this.doPost(request, response);
    }
}
