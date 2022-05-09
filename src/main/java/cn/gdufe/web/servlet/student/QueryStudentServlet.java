package cn.gdufe.web.servlet.student;

import cn.gdufe.domain.Student;
import cn.gdufe.service.StudentService;
import cn.gdufe.service.impl.StudentServiceImpl;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/queryStudentServlet")
public class QueryStudentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.设置编码格式
        request.setCharacterEncoding("utf-8");

        //2.获取参数
        Map<String, String[]> condition = request.getParameterMap();

        //3.查询学生数据
        StudentService service=new StudentServiceImpl();
        List<Student> list= service.queryStudent(condition);

        //4.响应
        ObjectMapper mapper = new ObjectMapper();
        response.setContentType("application/json;charset=utf-8");
        mapper.writeValue(response.getWriter(),list);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
