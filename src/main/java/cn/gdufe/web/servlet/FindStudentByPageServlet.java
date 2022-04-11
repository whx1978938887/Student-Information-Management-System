package cn.gdufe.web.servlet;

import cn.gdufe.domain.PageBean;
import cn.gdufe.domain.Student;
import cn.gdufe.service.StudentService;
import cn.gdufe.service.impl.StudentServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@WebServlet("/findStudentByPageServlet")
public class FindStudentByPageServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        //1.获取参数
        String currentPage=request.getParameter("currentPage");
        String rows=request.getParameter("rows");//每页显示条数
        if (currentPage==null||"".equals(currentPage)){
            currentPage="1";
        }
        if (rows==null||"".equals(rows)){
            rows="5";
        }
        //获取条件查询参数
        Map<String, String[]> condition = request.getParameterMap();

        //2.调用service查询
        StudentService service = new StudentServiceImpl();
        PageBean<Student> studentPageBean = service.findStudentByPage(currentPage,rows,condition);
        System.out.println(studentPageBean);
        //3.将PageBean存入request
        request.setAttribute("studentPageBean",studentPageBean);
        request.setAttribute("condition",condition);//将查询条件存入request
        //4.转发到menu.jsp
        request.getRequestDispatcher("/menu.jsp").forward(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
