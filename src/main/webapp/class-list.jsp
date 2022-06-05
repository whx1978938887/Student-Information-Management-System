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
            <a href="${pageContext.request.contextPath}/class-list.jsp" class="list-group-item active">班级信息管理</a>
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
                <h3 class="panel-title">查询班级</h3>
            </div>

            <!--面板内容-->
            <div class="panel-body">
                <form action="${pageContext.request.contextPath}/queryClassServlet" method="post">
                    <div class="left left-group tab">
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
                </form>
            </div>

            <!-- 表格 -->
            <table class="table">
                <tr>
                    <th>序号</th>
                    <th>所在学院</th>
                    <th>专业</th>
                    <th>年级</th>
                    <th>教师人数</th>
                    <th>学生人数</th>
                </tr>
                <c:forEach items="${cs}" var="cd" varStatus="cc">
                    <tr>
                        <td>${cc.count}</td>
                        <td>${cd.college}</td>
                        <td>${cd.specialty}</td>
                        <td>${cd.grade}</td>
                        <td>${cd.teacherNum}</td>
                        <td>${cd.studentNum}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</div>
<script type="text/javascript" src="js/main.js"></script>
</body>
</html>