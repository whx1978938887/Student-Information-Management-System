package cn.gdufe.web.servlet;

import cn.gdufe.domain.User;
import cn.gdufe.service.UserService;
import cn.gdufe.service.impl.UserServiceImpl;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

@WebServlet("/registerServlet")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.设置编码
        request.setCharacterEncoding("utf-8");

        //2.获取数据
        //2.1获取用户填写验证码
        String checkCode = request.getParameter("checkCode");

        //3.验证码校验
        HttpSession session = request.getSession();
        String checkCode_server = (String) session.getAttribute("checkCode_server");
        session.removeAttribute("checkCode_server");//确保验证码一次性
        if(!checkCode_server.equalsIgnoreCase(checkCode)){
            //验证码不正确
            //提示信息
            request.setAttribute("register_msg","验证码错误！");
            //跳转登录页面
            request.getRequestDispatcher("/register.jsp").forward(request,response);

            return;
        }

        //4.调用Service查询用户
        String username = request.getParameter("username");
        UserService service = new UserServiceImpl();
        User loginUser = service.findUser(username);
        //6.判断用户是否存在
        if(loginUser != null){
            //用户存在 注册失败
            //提示信息
            request.setAttribute("register_msg","注册失败，用户已存在！");
            //跳转页面
            request.getRequestDispatcher("/register.jsp").forward(request,response);
        }else{
            //用户不在在
            //注册成功
            System.out.println("注册成功");
            Map<String, String[]> map = request.getParameterMap();
            //封装User对象
            User user = new User();
            try {
                BeanUtils.populate(user,map);
            } catch (IllegalAccessException | InvocationTargetException e) {
                e.printStackTrace();
            }
            //调用service添加用户
            service.addUser(user);

            //跳转页面
            response.sendRedirect(request.getContextPath()+"/register.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
