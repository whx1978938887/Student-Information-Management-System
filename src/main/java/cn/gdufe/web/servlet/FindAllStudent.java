package cn.gdufe.web.servlet;

import cn.gdufe.service.StudentService;
import cn.gdufe.service.impl.StudentServiceImpl;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@WebServlet("/findAllStudent")
public class FindAllStudent extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.设置编码格式

        //2.获取对象
        StudentService service = new StudentServiceImpl();
        Map<String,Object> map=service.findAllStudent();

        //3.将列表转为json
        ObjectMapper mapper=new ObjectMapper();
        //设置响应的数据格式为json
        response.setContentType("application/json;charset=utf-8");
        mapper.writeValue(response.getWriter(),map);

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
