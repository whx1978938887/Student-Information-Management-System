<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>学生信息管理系统</title>
    <link rel="stylesheet" href="css/menu.css">
    <link rel="stylesheet" href="css/edit.css">
    <link rel="stylesheet" href="css/query.css">
    <script type="text/javascript">
        window.onload=function (){
            let personal_btn = document.getElementById('personal_btn');
            let personal_btn1 = document.getElementById('personal_btn1');
            let personal_ins = document.querySelectorAll('.personal_in');
            let per_ls = document.querySelectorAll('.per_l');
            personal_btn.onclick=function (){
                for (let i = 0; i < personal_ins.length; i++) {
                    personal_ins[i].style.display='block';
                }
                for (let i = 0; i < per_ls.length; i++) {
                    per_ls[i].style.display='none';
                }
                personal_btn1.style.display='block';
            }
        }
    </script>
</head>

<body>
    <div class="menu">
        <div class="left">
            <ul>
                <li class="tab_list left_l">
                    <span class="iconfont iconfont_left">&#xe924;</span>
                    <a href="#" class="left_a">主页面</a>
                    <span class="iconfont iconfont_right">&#xeb6d;</span>
                </li>
                <ul class="tab">
                    <li class="left_l hide_color">
                        <span class="iconfont iconfont_left">&#xe99d;</span>
                        <a href="${pageContext.request.contextPath}/main.jsp" class="left_a">控制面板</a>
                    </li>
                </ul>
                <li class="tab_list left_l">
                    <span class="iconfont iconfont_left">&#xe607;</span>
                    <a href="#" class="left_a">学生信息管理</a>
                    <span class="iconfont iconfont_right">&#xeb6d;</span>
                </li>
                <ul class="tab">
                    <li class="left_l hide_color">
                        <span class="iconfont iconfont_left">&#xe99d;</span>
                        <a href="${pageContext.request.contextPath}/addStudent.jsp" class="left_a">添加学生信息</a>
                    </li>
                    <li class="left_l hide_color">
                        <span class="iconfont iconfont_left">&#xe99d;</span>
                        <a href="${pageContext.request.contextPath}/selectStudent.jsp" class="left_a">查询学生信息</a>
                    </li>
                </ul>

                <li class="tab_list left_l">
                    <span class="iconfont iconfont_left">&#xe607;</span>
                    <a href="#" class="left_a">教师信息管理</a>
                    <span class="iconfont iconfont_right">&#xeb6d;</span>
                </li>
                <ul class="tab">
                    <li class="left_l hide_color">
                        <span class="iconfont iconfont_left">&#xe99d;</span>
                        <a href="${pageContext.request.contextPath}/addTeacher.jsp" class="left_a">添加教师信息</a>
                    </li>
                    <li class="left_l hide_color">
                        <span class="iconfont iconfont_left">&#xe99d;</span>
                        <a href="${pageContext.request.contextPath}/selectTeacher.jsp" class="left_a">查询教师信息</a>
                    </li>
                </ul>
                <li class="tab_list left_l">
                    <span class="iconfont iconfont_left">&#xe607;</span>
                    <a href="#" class="left_a">班级信息管理</a>
                    <span class="iconfont iconfont_right">&#xeb6d;</span>
                </li>
                <ul class="tab">
                    <li class="left_l hide_color">
                        <span class="iconfont iconfont_left">&#xe99d;</span>
                        <a href="${pageContext.request.contextPath}/selectClass.jsp" class="left_a">查询班级信息</a>
                    </li>
                </ul>
                <li class="tab_list left_l">
                    <span class="iconfont iconfont_left">&#xe70b;</span>
                    <a href="#" class="left_a">个人中心</a>
                    <span class="iconfont iconfont_right">&#xeb6d;</span>
                </li>
                <ul class="tab">
                    <li class="left_l hide_color">
                        <span class="iconfont iconfont_left">&#xe99d;</span>
                        <a href="${pageContext.request.contextPath}/updateUserServlet" class="left_a">个人中心</a>
                    </li>
                </ul>
            </ul>
        </div>
        <div class="right">
            <div class="title">
                用户名：${user.username}&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/exitServlet">退出</a>
            </div>
            <div class="content">
                <form action="${pageContext.request.contextPath}/updateUserServlet" method="post">
                    <table id="personal" cellpadding="0" cellspacing="0">
                        <caption id="per_captional">
                            <span id="personal_icon" class="iconfont iconfont_left">&#xe70b;</span>
                            账号信息
                        </caption>
                        <tr>
                            <th class="personal_th" width="200px">用户名 :</th>
                            <th class="personal_th">
                                <div>${user.username}</div>
                                <!--隐藏域 提交id-->
                                <input type="hidden" name="username" value="${user.username}">
                                <div class="personal_warn">请输入8个以内字符!</div>
                            </th>
                        </tr>
                        <tr>
                            <th class="personal_th" width="200px">姓名:</th>
                            <th class="personal_th">
                                <div class="per_l">${user.name}</div>
                                <input type="text" name="name" id="name" class="personal_in" value="${user.name}">
                                <div class="personal_warn">请输入9位正整数!</div>
                            </th>
                        </tr>
                        <tr>
                            <th class="personal_th" width="200px">密码 :</th>
                            <th class="personal_th">
                                <div class="per_l">${user.password}</div>
                                <input type="text" name="password" id="per_password" class="personal_in" value="${user.password}">
                                <div class="personal_warn">请输入12个以内非中文字符!</div>
                            </th>
                        </tr>
                        <tr>
                            <th class="personal_th" width="200px">邮箱 :</th>
                            <th class="personal_th">
                                <div class="per_l">${user.email}</div>
                                <input type="text" name="email" id="per_name" class="personal_in" value="${user.email}">
                                <div class="personal_warn">请输入8个以内中文字符!</div>
                            </th>
                        </tr>
                        <tr>
                            <th class="personal_th" width="200px">手机号 :</th>
                            <th class="personal_th">
                                <div class="per_l">${user.phone}</div>
                                <input type="text" name="phone" id="per_phonenum" class="personal_in" value="${user.phone}">
                                <div class="personal_warn">请输入11位正整数!</div>
                            </th>
                        </tr>
                        <tr>
                            <th class="personal_th" width="200px">性别 :</th>
                            <th class="personal_th">
                                <div class="per_l">${user.gender}</div>
                                <c:if test="${user.gender=='男'}">
                                    <div class="personal_in" id="personal_sex">
                                        <input type="radio" name="gender" value="男" checked="checked"> 男
                                        <input type="radio" name="gender" value="女"> 女
                                    </div>
                                </c:if>
                                <c:if test="${user.gender=='女'}">
                                    <div class="personal_in" id="personal_sex">
                                        <input type="radio" name="gender" value="男"> 男
                                        <input type="radio" name="gender" value="女" checked="checked"> 女
                                    </div>
                                </c:if>
                            </th>
                        </tr>
                        <tr>
                            <th>
                                <input type="button" id="personal_btn" value="编辑">
                            </th>
                            <th>
                                <input type="submit" id="personal_btn1" value="确定">
                            </th>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
        <script src="js/menu.js"></script>
    </div>
</body>

</html>
