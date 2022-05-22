<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>编辑学生信息</title>
    <link rel="stylesheet" href="./css/edit_stu&tea.css">
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
<body class="edit_bgc">
    <div class="big">
        <form action="${pageContext.request.contextPath}/updateStudentServlet" method="post">
            <!--隐藏域 提交id-->
            <input type="hidden" name="id" value="${student.sid}">
            <table>
                <caption>编辑学生信息</caption>
                <tr>
                    <td class="left"><label for="name">姓名</label></td>
                    <td class="right"><input name="name" id="name" placeholder="请输入姓名"></td>
                </tr>
                <tr>
                    <td class="left">学号</td>
                    <td class="right">${student.sid}</td>
                </tr>
                <tr>
                    <td class="left"><label for="age">年龄</label></td>
                    <td class="right"><input name="age" id="age" placeholder="请输入年龄"></td>
                </tr>
                <tr>
                    <td class="left"><label>性别</label></td>
                    <td class="right">
                        <input type="radio" name="sex" value="男" checked="checked"> 男
                        <input type="radio" name="sex" value="女"> 女
                    </td>
                </tr>
                <tr>
                    <td class="left"><label for="grade">年级</label></td>
                    <td class="right">
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
                    <td class="left"><label for="college">学院</label></td>
                    <td class="right">
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
                    <td class="left"><label for="specialty">专业</label></td>
                    <td class="right">
                        <select id="specialty" name="specialty" class="sub0">
                            <option value="">---------------请选择---------------</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="left"><label for="address">家庭住址</label></td>
                    <td class="right"><input name="address" id="address" class="address"
                                                  placeholder="请输入家庭住址"></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" id="sub" value="确定"></td>
                    <td id="esc"><a id="esc_a" href="${pageContext.request.contextPath}/findListStudent">返回</a></td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
