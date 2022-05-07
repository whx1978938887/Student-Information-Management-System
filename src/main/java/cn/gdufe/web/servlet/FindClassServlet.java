package cn.gdufe.web.servlet;

import cn.gdufe.domain.Class;
import cn.gdufe.service.ClassService;
import cn.gdufe.service.impl.ClassServiceImpl;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/findClassServlet")
public class FindClassServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.设置编码
        request.setCharacterEncoding("utf-8");

        //2.获取参数
        String classId = request.getParameter("classId");
        ClassService service = new ClassServiceImpl();
        Class c = service.findClass(classId);

        //3.将user存入request
        request.setAttribute("c",c);

        //4.转发到update.jsp
        request.getRequestDispatcher("/edit_class.jsp").forward(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
