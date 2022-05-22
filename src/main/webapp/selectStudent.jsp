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
        //设置下拉菜单
        function selectCollege(){
            let collegeId;
            let collegeName=document.getElementById('college');
            let specialtyName = document.getElementById('specialty');
            let collegeData=[
                {
                    "collegeId": 1,
                    "collegeName": "工商学院"
                },
                {
                    "collegeId": 2,
                    "collegeName": "法学院"
                },
                {
                    "collegeId": 3,
                    "collegeName": "会计学院"
                },
                {
                    "collegeId": 4,
                    "collegeName": "经济学院"
                },
                {
                    "collegeId": 5,
                    "collegeName": "信息学院"
                },
                {
                    "collegeId": 6,
                    "collegeName": "金融学院"
                },
                {
                    "collegeId": 7,
                    "collegeName": "外国语学院"
                }
            ];
            let specialtyData=[
                {
                    "collegeId":1,
                    "specialtyName": "物流管理"
                },
                {
                    "collegeId":1,
                    "specialtyName": "工商管理"
                },
                {
                    "collegeId":1,
                    "specialtyName": "市场营销"
                },
                {
                    "collegeId":2,
                    "specialtyName": "法学"
                },
                {
                    "collegeId":2,
                    "specialtyName": "法学（中外联合培养项目班）"
                },
                {
                    "collegeId":3,
                    "specialtyName": "会计学"
                },
                {
                    "collegeId":3,
                    "specialtyName": "财务管理"
                },
                {
                    "collegeId":3,
                    "specialtyName": "审计学"
                },
                {
                    "collegeId":4,
                    "specialtyName": "经济统计学"
                },
                {
                    "collegeId":4,
                    "specialtyName": "国际商务"
                },
                {
                    "collegeId":4,
                    "specialtyName": "经济学"
                },
                {
                    "collegeId":4,
                    "specialtyName": "数字经济"
                },
                {
                    "collegeId":5,
                    "specialtyName": "计算机科学与技术"
                },
                {
                    "collegeId":5,
                    "specialtyName": "软件工程"
                },
                {
                    "collegeId":5,
                    "specialtyName": "人工智能"
                },
                {
                    "collegeId":5,
                    "specialtyName": "电子商务"
                },
                {
                    "collegeId":6,
                    "specialtyName": "金融学"
                },
                {
                    "collegeId":6,
                    "specialtyName": "保险学"
                },
                {
                    "collegeId":6,
                    "specialtyName": "投资学"
                },
                {
                    "collegeId":7,
                    "specialtyName": "日语"
                },
                {
                    "collegeId":7,
                    "specialtyName": "英语"
                },
                {
                    "collegeId":7,
                    "specialtyName": "翻译"
                },
                {
                    "collegeId":7,
                    "specialtyName": "葡萄牙语"
                }
            ];
            let options = specialtyName.querySelectorAll('option');
            for (let x of options) {
                if (x.value!==''){
                    x.remove();
                }else{
                    x.selected=true;
                }
            }
            for (let i of collegeData) {
                if (i.collegeName===collegeName.value){
                    collegeId=i.collegeId;
                }
            }
            for (let i of specialtyData) {
                if (i.collegeId===collegeId){
                    let optionElement = document.createElement('option');
                    optionElement.value=i.specialtyName+'';
                    optionElement.innerHTML=i.specialtyName+'';
                    specialtyName.appendChild(optionElement);
                }
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
                        <a href="${pageContext.request.contextPath}/user.jsp" class="left_a">个人中心</a>
                    </li>
                </ul>
            </ul>
        </div>
        <div class="right">
            <div class="title">
                用户名：${user.username}&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/exitServlet">退出</a>
            </div>
            <div class="content">
                <h3>查询学生信息</h3>
                <form action="${pageContext.request.contextPath}/queryStudentServlet" method="post">
                    <table>
                        <tr class="name1">
                            <td><label for="name" class="l">姓名</label></td>
                            <td>
                                <input name="name" id="name" class="username1" placeholder="请输入姓名">
                            </td>
                        </tr>
                        <tr class="id1">
                            <td><label for="sid" class="l">学号</label></td>
                            <td><input name="sid" id="sid" class="student_id1" placeholder="请输入学号">
                            </td>
                        </tr>
                        <tr class="age1">
                            <td><label for="age" class="l">年龄</label></td>
                            <td><input name="age" id="age" class="ag1" placeholder="请输入年龄"></td>
                        </tr>
                        <tr></tr>
                        <tr class="sex1">
                            <td><label class="l">性别</label></td>
                            <td>
                                <input type="radio" name="gender" value="男" checked="checked"> 男
                                <input type="radio" name="gender" value="女"> 女
                            </td>
                        </tr>
                        <tr></tr>
                        <tr class="class1">
                            <td><label for="grade">年级</label></td>
                            <td>
                                <select id="grade" name="grade" class="grade">
                                    <option value="">---------------请选择---------------</option>
                                    <option value="大一">大一</option>
                                    <option value="大二">大二</option>
                                    <option value="大三">大三</option>
                                    <option value="大四">大四</option>
                                </select>
                            </td>
                        </tr>
                        <tr class="college1">
                            <td><label for="college" class="college">学院</label></td>
                            <td>
                                <select id="college" name="college" class="college" onchange="selectCollege()">
                                    <option value="">---------------请选择---------------</option>
                                    <option value="工商管理学院">工商管理学院</option>
                                    <option value="法学院">法学院</option>
                                    <option value="会计学院">会计学院</option>
                                    <option value="经济学院">经济学院</option>
                                    <option value="信息学院">信息学院</option>
                                    <option value="金融学院">金融学院</option>
                                    <option value="外国语学院">外国语学院</option>
                                </select>
                            </td>
                        </tr>
                        <tr class="subject1">
                            <td><label for="specialty" class="l">专业</label></td>
                            <td>
                                <select id="specialty" name="specialty" class="sub0">
                                    <option value="">---------------请选择---------------</option>
                                </select>
                            </td>
                        </tr>
                        <tr></tr>
                        <tr class="address1">
                            <td><label for="address">家庭住址</label></td>
                            <td><input name="address" id="address" class="address1" placeholder="请输入家庭住址"></td>
                        </tr>
                        <tr class="submit1">
                            <td>
                                <input type="submit" id="btn1" class="btn_search" value="确定">
                            </td>
                        </tr>
                    </table>
                </form>
                <h3>查询结果</h3>
                <form action="#" method="post">
                    <table width="100%" hight="100%" cellpadding="0" cellspacing="0">
                        <thead>
                        <tr>
                            <th class="menu_th">序号</th>
                            <th class="menu_th">学号</th>
                            <th class="menu_th">姓名</th>
                            <th class="menu_th">年龄</th>
                            <th class="menu_th">性别</th>
                            <th class="menu_th">年级</th>
                            <th class="menu_th">学院</th>
                            <th class="menu_th">专业</th>
                            <th class="menu_th">家庭住址</th>
                            <th class="menu_th">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${students}" var="student" varStatus="s">
                                <tr>
                                    <td class="menu_td">${s.count}</td>
                                    <td class="menu_td">${student.sid}</td>
                                    <td class="menu_td">${student.name}</td>
                                    <td class="menu_td">${student.age}</td>
                                    <td class="menu_td">${student.gender}</td>
                                    <td class="menu_td">${student.grade}</td>
                                    <td class="menu_td">${student.college}</td>
                                    <td class="menu_td">${student.specialty}</td>
                                    <td class="menu_td">${student.address}</td>
                                    <td class="menu_td">
                                        <a href="${pageContext.request.contextPath}/findStudentServlet?sid=${student.sid}" class="button1">编辑</a>
                                        <a href="${pageContext.request.contextPath}/delStudentServlet?sid=${student.sid}" class="button2">删除</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
        <script src="js/menu.js"></script>
    </div>
</body>

</html>
