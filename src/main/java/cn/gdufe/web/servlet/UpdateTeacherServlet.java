package cn.gdufe.web.servlet;

import cn.gdufe.domain.Teacher;
import cn.gdufe.service.TeacherService;
import cn.gdufe.service.impl.TeacherServiceImpl;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

@WebServlet("/updateTeacherServlet")
public class UpdateTeacherServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.设置编码
        request.setCharacterEncoding("utf-8");

        //2.获取参数
        Map<String, String[]> map = request.getParameterMap();
        //3.封装对象
        Teacher teacher = new Teacher();
        try {
            BeanUtils.populate(teacher,map);
        } catch (IllegalAccessException | InvocationTargetException e) {
            e.printStackTrace();
        }
        //4.调用service
        TeacherService service = new TeacherServiceImpl();
        service.updateTeacher(teacher);

        //5.跳转查询页面
        response.sendRedirect(request.getContextPath()+"/findTeacherByPageServlet");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
