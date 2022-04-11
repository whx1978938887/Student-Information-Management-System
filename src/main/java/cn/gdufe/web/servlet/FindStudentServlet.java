package cn.gdufe.web.servlet;

import cn.gdufe.domain.Student;
import cn.gdufe.service.StudentService;
import cn.gdufe.service.impl.StudentServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/findStudentServlet")
public class FindStudentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.设置编码
        request.setCharacterEncoding("utf-8");

        //2.获取参数
        String sid = request.getParameter("sid");
        StudentService service = new StudentServiceImpl();
        Student student = service.findStudent(sid);

        //3.将user存入request
        request.setAttribute("student",student);

        //4.转发到update.jsp
        request.getRequestDispatcher("/edit_Student.jsp").forward(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
