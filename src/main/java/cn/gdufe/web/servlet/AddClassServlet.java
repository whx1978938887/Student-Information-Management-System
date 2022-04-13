package cn.gdufe.web.servlet;

import cn.gdufe.domain.Class;
import cn.gdufe.service.ClassService;
import cn.gdufe.service.impl.ClassServiceImpl;
import org.apache.commons.beanutils.BeanUtils;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

@WebServlet("/addClassServlet")
public class AddClassServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        //1.设置编码
        request.setCharacterEncoding("utf-8");

        //2.获取参数
        Map<String, String[]> map = request.getParameterMap();

        //3.调用service方法
        String classId = request.getParameter("classId");
        ClassService service = new ClassServiceImpl();
        Class findClass=service.findClass(classId);
        if (findClass!=null){
            //提示信息
            request.setAttribute("add_msg","班级已存在！");
            request.getRequestDispatcher("/menu.jsp").forward(request,response);
        }else{
            //封装student对象
            Class c = new Class();
            try {
                BeanUtils.populate(c,map);
            } catch (IllegalAccessException | InvocationTargetException e) {
                e.printStackTrace();
            }
            service.addClass(c);

            //跳转
            response.sendRedirect(request.getContextPath()+"/menu.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        this.doPost(request, response);
    }
}
