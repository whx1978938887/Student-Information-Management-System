package cn.gdufe.web.servlet.student;

import cn.gdufe.domain.Student;
import cn.gdufe.service.StudentService;
import cn.gdufe.service.impl.StudentServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/findListStudent")
public class StudentListServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.设置编码格式

        //2.获取对象
        StudentService service = new StudentServiceImpl();
        List<Student> list=service.findAllStudent();
        System.out.println(list);

        /*//3.将列表转为json
        ObjectMapper mapper=new ObjectMapper();
        //设置响应的数据格式为json
        response.setContentType("application/json;charset=utf-8");
        mapper.writeValue(response.getWriter(),map);*/

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
