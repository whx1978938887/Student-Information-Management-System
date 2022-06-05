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
            <a href="${pageContext.request.contextPath}/teacher-list.jsp" class="list-group-item active">教师信息管理</a>
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
                <h3 class="panel-title">更新教师</h3>
            </div>

            <!--面板内容-->
            <div class="panel-body">
                <form action="${pageContext.request.contextPath}/updateTeacherServlet" method="post">
                    <input type="text" name="tid" value="${teacher.tid}" style="display: none">
                    <div class="left left-group tab">
                        <div class="input-group">
                            <span class="input-group-addon">编号</span>
                            <div class="form-control">${teacher.tid}</div>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">姓名</span>
                            <input type="text" name="name" value="${teacher.name}" class="form-control" placeholder="${teacher.name}" aria-describedby="basic-addon1">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">年龄</span>
                            <input type="text" name="age" value="${teacher.age}" class="form-control" placeholder="${teacher.age}" aria-describedby="basic-addon1">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">住址</span>
                            <input type="text" name="address" value="${teacher.address}" class="form-control" placeholder="${teacher.address}" aria-describedby="basic-addon1">
                        </div>
                    </div>
                    <div class="left left-group tab">
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

                        <div class="input-group">
                            <span class="input-group-addon">年级</span>
                            <div class="form-control not-border">
                                <select id="grade" name="grade">
                                    <option value="">----请选择----</option>
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
                                    <option value="">----请选择----</option>
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
                                    <option value="">----请选择----</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div style="clear: both"></div>
                    <div class="btn-group tab" role="group">
                        <button type="submit" class="btn btn-default">保存</button>
                    </div>
                    <div class="btn-group">
                        <a href="${pageContext.request.contextPath}/teacher-list.jsp" class="btn btn-default">返回</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="js/main.js"></script>
</body>
</html>
