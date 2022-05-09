package cn.gdufe.web.servlet.student;

import cn.gdufe.domain.Student;
import cn.gdufe.service.StudentService;
import cn.gdufe.service.impl.StudentServiceImpl;
import com.fasterxml.jackson.databind.json.JsonMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/findStudentServlet")
public class FindStudentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.设置编码
        request.setCharacterEncoding("utf-8");

        //2.获取数据
        String sid = request.getParameter("sid");
        StudentService service = new StudentServiceImpl();
        Student student = service.findStudent(sid);

        //3.将数据转为json
        JsonMapper mapper = new JsonMapper();
        String json = mapper.writeValueAsString(student);

        //4.将数据存入session
        HttpSession session = request.getSession();
        session.setAttribute("student",json);
        response.setContentType("application/json;charset=utf-8");
        mapper.writeValue(response.getWriter(),student);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
