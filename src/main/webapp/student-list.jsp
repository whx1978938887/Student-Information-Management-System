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
            <a href="${pageContext.request.contextPath}/student-list.jsp" class="list-group-item active">学生信息管理</a>
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

        <!--控制面板-->
        <div class="panel panel-default">
            <!--面板头部-->
            <div class="panel-heading">
                <h3 class="panel-title">查询学生</h3>
            </div>

            <!--面板内容-->
            <div class="panel-body">
                <form action="${pageContext.request.contextPath}/queryStudentServlet" method="post">
                    <div class="left left-group tab">
                        <div class="input-group">
                            <span class="input-group-addon">学号</span>
                            <input type="text" name="sid" class="form-control" placeholder="不限" aria-describedby="basic-addon1">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">姓名</span>
                            <input type="text" name="name" class="form-control" placeholder="不限" aria-describedby="basic-addon1">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">年龄</span>
                            <input type="text" name="age" class="form-control" placeholder="不限" aria-describedby="basic-addon1">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">住址</span>
                            <input type="text" name="address" class="form-control" placeholder="不限" aria-describedby="basic-addon1">
                        </div>
                    </div>
                    <div class="left left-group tab">
                        <div class="input-group">
                            <span class="input-group-addon">性别</span>
                            <div class="form-control not-border">
                                <input type="radio"  name="gender" value="男"/>男
                                <input type="radio" name="gender" value="女"/>女
                                <input type="radio" name="gender" value="" checked/>不限
                            </div>
                        </div>

                        <div class="input-group">
                            <span class="input-group-addon">年级</span>
                            <div class="form-control not-border">
                                <select id="grade" name="grade">
                                    <option value="">----不限----</option>
                                    <option value="大一">大一</option>
                                    <option value="大二">大二</option>
                                    <option value="大三">大三</option>
                                    <option value="大四">大四</option>
                                </select>
                            </div>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">学院</span>
                            <div class="form-control not-border">
                                <select id="college" name="college">
                                    <option value="">----不限----</option>
                                    <option value="工商管理学院">工商管理学院</option>
                                    <option value="法学院">法学院</option>
                                    <option value="会计学院">会计学院</option>
                                    <option value="经济学院">经济学院</option>
                                    <option value="信息学院">信息学院</option>
                                    <option value="金融学院">金融学院</option>
                                    <option value="外国语学院">外国语学院</option>
                                </select>
                            </div>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">专业</span>
                            <div class="form-control not-border">
                                <select id="specialty" name="specialty">
                                    <option value="">----不限----</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div style="clear: both"></div>
                    <div class="btn-group tab" role="group">
                        <button type="submit" class="btn btn-default">查询</button>
                    </div>
                    <div class="btn-group">
                        <a href="${pageContext.request.contextPath}/student-add.jsp" class="btn btn-default">添加学生</a>
                    </div>
                </form>
            </div>

            <!-- 表格 -->
            <table class="table">
                <tr>
                    <th>序号</th>
                    <th>学号</th>
                    <th>姓名</th>
                    <th>年龄</th>
                    <th>性别</th>
                    <th>年级</th>
                    <th>学院</th>
                    <th>专业</th>
                    <th>住址</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${students}" var="student" varStatus="s">
                    <tr>
                        <td>${s.count}</td>
                        <td>${student.sid}</td>
                        <td>${student.name}</td>
                        <td>${student.age}</td>
                        <td>${student.gender}</td>
                        <td>${student.grade}</td>
                        <td>${student.college}</td>
                        <td>${student.specialty}</td>
                        <td>${student.address}</td>
                        <td>
                            <div class="btn-group">
                                <a href="${pageContext.request.contextPath}/findStudentServlet?sid=${student.sid}" class="btn btn-default">修改</a>
                            </div>
                            <div class="btn-group">
                                <a href="${pageContext.request.contextPath}/delStudentServlet?sid=${student.sid}" class="btn btn-default">删除</a>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</div>
<script type="text/javascript" src="js/main.js"></script>
</body>
</html>
