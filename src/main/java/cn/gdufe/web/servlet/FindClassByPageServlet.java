package cn.gdufe.web.servlet;

import cn.gdufe.domain.Class;
import cn.gdufe.domain.PageBean;
import cn.gdufe.service.ClassService;
import cn.gdufe.service.impl.ClassServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@WebServlet("/findClassByPageServlet")
public class FindClassByPageServlet extends HttpServlet {
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
        ClassService service = new ClassServiceImpl();
        PageBean<Class> classPageBean = service.findClassByPage(currentPage,rows,condition);
        System.out.println(classPageBean);
        //3.将PageBean存入request
        request.setAttribute("classPageBean",classPageBean);
        request.setAttribute("condition",condition);//将查询条件存入request
        //4.转发到menu.jsp
        request.getRequestDispatcher("/menu.jsp").forward(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
