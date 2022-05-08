package cn.gdufe.web.servlet.teacher;

import cn.gdufe.domain.Teacher;
import cn.gdufe.service.TeacherService;
import cn.gdufe.service.impl.TeacherServiceImpl;
import com.fasterxml.jackson.databind.json.JsonMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/findListTeacher")
public class TeacherListServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.设置编码格式
        request.setCharacterEncoding("utf-8");

        //2.获取数据
        TeacherService service=new TeacherServiceImpl();
        List<Teacher> list=service.findAllTeacher();

        //3.将数据封装为json
        JsonMapper mapper = new JsonMapper();
        String teachers = mapper.writeValueAsString(list);

        //4.将数据写入session
        HttpSession session = request.getSession();
        session.setAttribute("teachers",teachers);
        response.setContentType("Application/Json;charset=utf-8");
        mapper.writeValue(response.getWriter(),list);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}