package cn.gdufe.web.servlet.course;

import cn.gdufe.domain.Class;
import cn.gdufe.service.ClassService;
import cn.gdufe.service.impl.ClassServiceImpl;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/queryClassServlet")
public class QueryClassServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.设置编码格式
        request.setCharacterEncoding("utf-8");

        //2.获取参数
        Map<String, String[]> condition = request.getParameterMap();

        //3.查询班级数据
        ClassService service=new ClassServiceImpl();
        List<Class> list= service.queryClass(condition);

        //4.响应
        HttpSession session = request.getSession();
        session.setAttribute("cs",list);
        System.out.println(list);
        request.getRequestDispatcher("/selectClass.jsp").forward(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
