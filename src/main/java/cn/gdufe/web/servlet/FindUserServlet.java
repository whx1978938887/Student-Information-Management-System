package cn.gdufe.web.servlet;

import cn.gdufe.domain.User;
import cn.gdufe.service.UserService;
import cn.gdufe.service.impl.UserServiceImpl;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/findUserServlet")
public class FindUserServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.设置编码
        request.setCharacterEncoding("utf-8");

        //2.获取参数
        String username = request.getParameter("username");
        UserService service = new UserServiceImpl();
        User user = service.findUser(username);

        //3.将user存入request
        request.setAttribute("user",user);

        //4.转发到update.jsp
        request.getRequestDispatcher("/edit_user.jsp").forward(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
