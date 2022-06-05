<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>首页</title>
    <link rel="stylesheet" href="./css/bootstrap.css">
    <link rel="stylesheet" href="css/main.css">
    <script type="text/javascript" src="js/jquery-2.1.0.min.js"></script>
    <script type="text/javascript" src="./js/bootstrap.js"></script>
</head>
<body>
<div class="content">

    <!--侧边栏-->
    <div class="left left-content">
        <!--列表组-->
        <div class="list-group">
            <a href="${pageContext.request.contextPath}/main.jsp" class="list-group-item">首页</a>
            <a href="${pageContext.request.contextPath}/student-list.jsp" class="list-group-item">学生信息管理</a>
            <a href="${pageContext.request.contextPath}/teacher-list.jsp" class="list-group-item">教师信息管理</a>
            <a href="${pageContext.request.contextPath}/class-list.jsp" class="list-group-item">班级信息管理</a>
            <a href="${pageContext.request.contextPath}/findUserServlet" class="list-group-item active">用户</a>
        </div>
    </div>


    <!--内容-->
    <div class="right right-content">

        <!--用户信息及操作-->
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="left">用户空间</div>
                <div class="btn-group right">
                    <a href="${pageContext.request.contextPath}/exitServlet" class="btn btn-default">退出</a>
                </div>
            </div>
        </div>

        <!--控制面板-->
        <div class="panel panel-default">
            <!--面板头部-->
            <div class="panel-heading">
                <h3 class="panel-title">用户信息</h3>
            </div>

            <!--面板内容-->
            <div class="panel-body">
                <form action="${pageContext.request.contextPath}/updateUserServlet" method="post">
                    <input type="text" name="username" value="${user.username}" style="display: none">
                    <div class="left left-group tab">
                        <div class="input-group">
                            <span class="input-group-addon">用户名</span>
                            <div class="form-control">${user.username}</div>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">姓名</span>
                            <input type="text" name="name" value="${user.name}" class="form-control" placeholder="${user.name}" aria-describedby="basic-addon1">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">密码</span>
                            <input type="text" name="password" value="${user.password}" class="form-control" placeholder="${user.password}" aria-describedby="basic-addon1">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">邮箱</span>
                            <input type="text" name="email" value="${user.email}" class="form-control" placeholder="${user.email}" aria-describedby="basic-addon1">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">手机号</span>
                            <input type="text" name="phone" value="${user.phone}" class="form-control" placeholder="${user.phone}" aria-describedby="basic-addon1">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">性别</span>
                            <c:if test="${user.gender=='男'}">
                                <div class="form-control not-border">
                                    <input type="radio"  name="gender" value="男" checked/>男
                                    <input type="radio" name="gender" value="女"/>女
                                </div>
                            </c:if>
                            <c:if test="${user.gender=='女'}">
                                <div class="form-control not-border">
                                    <input type="radio"  name="gender" value="男"/>男
                                    <input type="radio" name="gender" value="女" checked/>女
                                </div>
                            </c:if>
                        </div>
                    </div>

                    <div style="clear: both"></div>
                    <div class="btn-group tab" role="group">
                        <button type="submit" class="btn btn-default">保存</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
