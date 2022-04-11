<%--@elvariable id="register_msg" type="注册信息"--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./css/register.css">
    <script type="text/javascript">
        function refreshCode(){
            //1.获取验证码图片对象
            let img_check = document.getElementById('img_check');
            //2.设置其src属性，加时间戳
            img_check.src='${pageContext.request.contextPath}/checkCodeServlet?time='+new Date().getTime();
        }
    </script>
</head>
<body>
    <div class="rg_layout">
        <div class="rg_left">
            <p>新用户注册</p>
            <p>USER REGISTER</p>
        </div>
    
        <div class="rg_center">
            <div class="rg_form">
                <!--定义表单-->
                <form action="${pageContext.request.contextPath}/registerServlet" method="post">
                    <table>
                        <tr>
                            <td class="td_left">
                                <label for="username">用户名</label>
                            </td>
                            <td class="td_right">
                                <input type="text" name="username" id="username" placeholder="请输入用户名">
                            </td>
                        </tr>
                        <tr>
                            <td class="td_left">
                                <label for="password">密码</label>
                            </td>
                            <td class="td_right">
                                <input type="password" name="password" id="password" placeholder="请输入密码">
                            </td>
                        </tr>
                        <tr>
                            <td class="td_left">
                                <label for="email">Email</label>
                            </td>
                            <td class="td_right">
                                <input type="email" name="email" id="email" placeholder="请输入邮箱">
                            </td>
                        </tr>
                        <tr>
                            <td class="td_left">
                                <label for="name">姓名</label>
                            </td>
                            <td class="td_right">
                                <input type="text" name="name" id="name" placeholder="请输入姓名">
                            </td>
                        </tr>
                        <tr>
                            <td class="td_left">
                                <label for="phone">手机号</label>
                            </td>
                            <td class="td_right">
                                <input type="text" name="phone" id="phone" placeholder="请输入手机号">
                            </td>
                        </tr>
                        <tr>
                            <td class="td_left">
                                <label>性别</label>
                            </td>
                            <td class="td_right">
                                <input type="radio" name="gender" value="male" checked="checked"> 男
                                <input type="radio" name="gender" value="female"> 女
                            </td>
                        </tr>
                        <tr>
                            <td class="td_left">
                                <label for="checkCode">验证码</label>
                            </td>
                            <td class="td_right">
                                <input type="text" name="checkCode" id="checkCode" placeholder="请输入验证码">
                                <a href="javascript:refreshCode()"><img id="img_check" src="${pageContext.request.contextPath}/checkCodeServlet" width="120" height="30" alt="看不清换一张"/></a>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <div>${register_msg}</div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <input type="submit" id="btn_sub" value="注册">
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>

        <div class="rg_right">
            <p>已有帐号?<a href="./login.jsp">立即登录</a></p>
        </div>
        
    </div>
</body>
</html>