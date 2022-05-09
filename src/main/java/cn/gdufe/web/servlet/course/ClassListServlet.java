package cn.gdufe.web.servlet.course;

import cn.gdufe.domain.Class;
import cn.gdufe.service.ClassService;
import cn.gdufe.service.impl.ClassServiceImpl;
import com.fasterxml.jackson.databind.json.JsonMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/findListClass")
public class ClassListServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.设置编码
        request.setCharacterEncoding("utf-8");

        //2.获取参数
        ClassService service = new ClassServiceImpl();
        List<Class> c = service.findAllClass();

        //3.响应
        JsonMapper mapper = new JsonMapper();
        response.setContentType("application/json;charset=utf-8");
        mapper.writeValue(response.getWriter(),c);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
