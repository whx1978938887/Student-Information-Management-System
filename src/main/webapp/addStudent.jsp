<%@ page contentType="text/html;charset=UTF-8"%>
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
                <h3>添加学生信息</h3>
                <form action="${pageContext.request.contextPath}/addStudentServlet" method="post">
                    <table class="edit_table">
                        <tr>
                            <td class="edit_left"><label for="name">姓名</label></td>
                            <td class="edit_right">
                                <input name="name" id="name" class="username" placeholder="请输入姓名">
                                <div class="username_warn">请输入8个以内中文字符!</div>
                            </td>

                        </tr>
                        <tr>
                            <td class="edit_left"><label for="sid">学号</label></td>
                            <td class="edit_right">
                                <input name="sid" id="sid" class="student_id" placeholder="请输入学号">
                                <div class="student_id_warn">请输入9位正整数!</div>
                            </td>
                        </tr>
                        <tr>
                            <td class="edit_left"><label for="age">年龄</label></td>
                            <td class="edit_right">
                                <input name="age" id="age" class="age" placeholder="请输入年龄">
                                <div class="age_warn">请输入小于3位的正整数!</div>
                            </td>
                        </tr>

                        <tr>
                            <td class="edit_left"><label>性别</label></td>
                            <td class="edit_right">
                                <input type="radio" name="gender" value="男" checked="checked"> 男
                                <input type="radio" name="gender" value="女"> 女
                            </td>
                        </tr>
                        <tr>
                            <td class="edit_left"><label for="grade">年级</label></td>
                            <td class="edit_right">
                                <select id="grade" name="grade">
                                    <option value="">---------------请选择---------------</option>
                                    <option value="大一">大一</option>
                                    <option value="大二">大二</option>
                                    <option value="大三">大三</option>
                                    <option value="大四">大四</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="edit_left"><label for="college">学院</label></td>
                            <td class="edit_right">
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
                        <tr>
                            <td class="edit_left"><label for="specialty">专业</label></td>
                            <td class="edit_right">
                                <select id="specialty" name="specialty" class="sub0">
                                    <option value="">---------------请选择---------------</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="edit_left"><label for="address">家庭住址</label></td>
                            <td class="edit_right"><input name="address" id="address" class="address"
                                                          placeholder="请输入家庭住址"></td>
                        </tr>
                        <tr>
                            <td colspan="2"><input type="submit" id="btn0" class="btn_add" value="确定"></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
        <script src="js/menu.js"></script>
    </div>
</body>

</html>
