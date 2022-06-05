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

@WebServlet("/findTeacherServlet")
public class FindTeacherServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.设置编码
        request.setCharacterEncoding("utf-8");

        //2.获取参数
        String tid = request.getParameter("tid");
        TeacherService service = new TeacherServiceImpl();
        Teacher teacher = service.findTeacher(tid);

        //3.将数据存入session
        HttpSession session = request.getSession();
        session.setAttribute("teacher",teacher);
        request.getRequestDispatcher("/teacher-update.jsp").forward(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
