package cn.gdufe.web.servlet.teacher;

import cn.gdufe.domain.Teacher;
import cn.gdufe.service.ClassService;
import cn.gdufe.service.TeacherService;
import cn.gdufe.service.impl.ClassServiceImpl;
import cn.gdufe.service.impl.TeacherServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/delTeacherServlet")
public class DelTeacherServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        //1.获取id
        String tid = request.getParameter("tid");
        //2.调用service删除
        TeacherService service = new TeacherServiceImpl();
        Teacher teacher = service.findTeacher(tid);
        service.deleteTeacher(tid);

        //更新class表
        ClassService service1=new ClassServiceImpl();
        service1.deleteTeacher(teacher);

        //3.跳转到查询所有Servlet
        response.sendRedirect(request.getContextPath()+"/findListTeacher");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
