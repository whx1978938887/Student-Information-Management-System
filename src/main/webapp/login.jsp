<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/login.css">
</head>
<body>
    <div class="rg_layout">

        <div class="rg_left">
            <p>用户登录</p>
            <p>USER LOGIN</p>
        </div>

        <div class="rg_center">
            <div class="rg_form">
                <form action="${pageContext.request.contextPath}/loginServlet" method="post">
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
                            <td colspan="2">
                                <input type="submit" id="btn_sub" value="登录">
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>

        <div class="rg_right">
            <p><a href="./register.jsp">立即注册</a></p>
        </div>
    </div>
</body>
</html>