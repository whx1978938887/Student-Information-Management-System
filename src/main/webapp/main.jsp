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

            </div>
        </div>
        <script src="js/menu.js"></script>
    </div>
</body>

</html>
