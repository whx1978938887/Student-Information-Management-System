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
            <a href="${pageContext.request.contextPath}/main.jsp" class="list-group-item active">首页</a>
            <a href="${pageContext.request.contextPath}/student-list.jsp" class="list-group-item">学生信息管理</a>
            <a href="${pageContext.request.contextPath}/teacher-list.jsp" class="list-group-item">教师信息管理</a>
            <a href="${pageContext.request.contextPath}/class-list.jsp" class="list-group-item">班级信息管理</a>
            <a href="${pageContext.request.contextPath}/findUserServlet" class="list-group-item">用户</a>
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
    </div>
</div>
</body>
</html>
