package cn.gdufe.web.servlet;

import cn.gdufe.service.StudentService;
import cn.gdufe.service.impl.StudentServiceImpl;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/delStudentServlet")
public class DelStudentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.获取id
        String sid = request.getParameter("sid");
        //2.调用service删除
        StudentService service = new StudentServiceImpl();
        service.deleteStudent(sid);

        //3.跳转到查询所有Servlet
        response.sendRedirect(request.getContextPath()+"/menu.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
