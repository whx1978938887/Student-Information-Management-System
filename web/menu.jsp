<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>学生信息管理系统</title>
    <link rel="stylesheet" href="css/menu.css">
    <script>
        window.onload=function (){
            //设置下拉菜单
            let tab_lists=document.querySelectorAll('.tab_list');
            let tabs=document.querySelectorAll('.tab');
            for (let i=0;i<tab_lists.length;i++){
                tab_lists[i].setAttribute('index'+i.toString(),'false');
                tab_lists[i].onclick=function (){
                    if(tab_lists[i].getAttribute('index'+i.toString())==='false'){
                        tabs[i].style.display='none';
                        tab_lists[i].setAttribute('index'+i.toString(),'true');
                    }else{
                        tabs[i].style.display='block';
                        tab_lists[i].setAttribute('index'+i.toString(),'false');
                    }
                }
            }

            //设置内容变化
            //获取lis
            let lis=[];
            for(let i=0;i<tabs.length;i++){
                let list=tabs[i].querySelectorAll('li');
                for (let j=0;j<list.length;j++){
                    lis.push(list[j]);
                }
            }
            //获取item
            let items = document.querySelectorAll('.item');
            for (let i=0;i<items.length;i++){
                items[i].style.display='none';
            }
            items[0].style.display='block';
            //for循环为item添加事件
            for (let i=0;i<lis.length;i++){
                lis[i].setAttribute('index',i.toString())
                lis[i].onclick=function (){
                    let index=this.getAttribute('index');
                    for (let i=0;i<items.length;i++){
                        items[i].style.display='none';
                    }
                    items[index].style.display='block';
                }
            }
        }
    </script>
</head>
<body>
<div class="menu">
    <div class="left">
        <ul>
            <li>
                <a href="#">主页面</a>
            </li>
            <li>
                <a href="#" class="tab_list">学生信息管理</a>
                <ul class="tab">
                    <li><a href="#">查看学生信息</a></li>
                    <li><a href="#">添加学生信息</a></li>
                    <li><a href="#">查询学生信息</a></li>
                </ul>
            </li>
            <li>
                <a href="#" class="tab_list">教师信息管理</a>
                <ul class="tab">
                    <li><a href="#">查看教师信息</a></li>
                    <li><a href="#">添加教师信息</a></li>
                    <li><a href="#">查询教师信息</a></li>
                </ul>
            </li>
            <li>
                <a href="#" class="tab_list">班级信息管理</a>
                <ul class="tab">
                    <li><a href="#">查看班级信息</a></li>
                    <li><a href="#">添加班级信息</a></li>
                    <li><a href="#">查询班级信息</a></li>
                </ul>
            </li>
            <li>
                <a href="#" class="tab_list">个人中心</a>
                <ul class="tab">
                    <li><a href="#">个人中心</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <div class="right">
        <div class="title">title</div>
        <div class="content">
            <div class="item">
                <h3>查看学生信息</h3>
                <form action="#" method="post">
                    <table>
                        <tr>
                            <th>序号</th>
                            <th>学号</th>
                            <th>姓名</th>
                            <th>年龄</th>
                            <th>性别</th>
                            <th>年级</th>
                            <th>班级</th>
                            <th>家庭住址</th>
                            <th>操作</th>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>13515163321</td>
                            <td>张三</td>
                            <td>22</td>
                            <td>男</td>
                            <td>三年级</td>
                            <td>一班</td>
                            <td>广州</td>
                            <td><a href="#">编辑</a>&nbsp;<a href="#">删除</a></td>
                        </tr>
                    </table>
                </form>
            </div>
            <div class="item">
                <h3>添加学生信息</h3>
                <form action="#">
                    <label for="student_name">姓名</label>
                    <input type="text" name="name" id="student_name"><br>
                    <label for="sid">学号</label>
                    <input type="text" name="sid" id="sid"><br>
                    <label>
                        性别
                        <input type="radio" name="gender" value="male" checked="checked">男
                        <input type="radio" name="gender" value="female">女
                    </label><br>
                    <label for="student_grade">年级</label>
                    <select name="grade" id="student_grade">
                        <option value="">--请选择--</option>
                        <option value="一年级">一年级</option>
                        <option value="二年级">二年级</option>
                        <option value="三年级">三年级</option>
                        <option value="四年级">四年级</option>
                    </select><br>
                    <label for="student_class">班级</label>
                    <select name="classId" id="student_class">
                        <option value="">--请选择--</option>
                        <option value="人工智能一班">人工智能一班</option>
                        <option value="人工智能二班">人工智能二班</option>
                        <option value="人工智能三班">人工智能三班</option>
                    </select><br>
                    <label for="student_address">家庭住址</label>
                    <input type="text" name="address" id="student_address"><br>
                    <input type="submit" value="确定">
                </form>
            </div>
            <div class="item">
                <h3>查询学生信息</h3>
                <form action="#" method="post">
                    <label for="student_select">
                        <select name="select" id="student_select">
                            <option value="学号">学号</option>
                            <option value="姓名">学号</option>
                            <option value="年龄">年龄</option>
                            <option value="年级">年级</option>
                            <option value="专业">专业</option>
                        </select>
                    </label>
                    <label for="student_text">
                        <input type="text" name="text" id="student_text">
                    </label>
                    <label for="student_search">
                        <input type="submit" name="search" id="student_search" value="查询">
                    </label>
                </form>
                <form action="#" method="post">
                    <table>
                        <tr>
                            <th>序号</th>
                            <th>学号</th>
                            <th>姓名</th>
                            <th>年龄</th>
                            <th>性别</th>
                            <th>年级</th>
                            <th>班级</th>
                            <th>家庭住址</th>
                            <th>操作</th>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>13515163321</td>
                            <td>张三</td>
                            <td>22</td>
                            <td>男</td>
                            <td>三年级</td>
                            <td>一班</td>
                            <td>广州</td>
                            <td><a href="#">编辑</a>&nbsp;<a href="#">删除</a></td>
                        </tr>
                    </table>
                </form>
            </div>
            <div class="item">
                <h3>查看教师信息</h3>
                <form action="#" method="post">
                    <table>
                        <tr>
                            <th>序号</th>
                            <th>学号</th>
                            <th>姓名</th>
                            <th>年龄</th>
                            <th>性别</th>
                            <th>年级</th>
                            <th>班级</th>
                            <th>家庭住址</th>
                            <th>操作</th>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>13515163321</td>
                            <td>张三</td>
                            <td>22</td>
                            <td>男</td>
                            <td>三年级</td>
                            <td>一班</td>
                            <td>广州</td>
                            <td><a href="#">编辑</a>&nbsp;<a href="#">删除</a></td>
                        </tr>
                    </table>
                </form>
            </div>
            <div class="item">
                <h3>添加教师信息</h3>
                <form action="#">
                    <label for="teacher_name">姓名</label>
                    <input type="text" name="name" id="teacher_name"><br>
                    <label for="tid">教师编号</label>
                    <input type="text" name="tid" id="tid"><br>
                    <label>
                        性别
                        <input type="radio" name="gender" value="male" checked="checked">男
                        <input type="radio" name="gender" value="female">女
                    </label><br>
                    <label for="teacher_grade">年级</label>
                    <select name="grade" id="teacher_grade">
                        <option value="">--请选择--</option>
                        <option value="一年级">一年级</option>
                        <option value="二年级">二年级</option>
                        <option value="三年级">三年级</option>
                        <option value="四年级">四年级</option>
                    </select><br>
                    <label for="teacher_class">班级</label>
                    <select name="classId" id="teacher_class">
                        <option value="">--请选择--</option>
                        <option value="人工智能一班">人工智能一班</option>
                        <option value="人工智能二班">人工智能二班</option>
                        <option value="人工智能三班">人工智能三班</option>
                    </select><br>
                    <label for="teacher_address">家庭住址</label>
                    <input type="text" name="address" id="teacher_address"><br>
                    <input type="submit" value="确定">
                </form>
            </div>
            <div class="item">
                <h3>查询教师信息</h3>
                <form action="#" method="post">
                    <table>
                        <tr>
                            <th>序号</th>
                            <th>教师编号</th>
                            <th>姓名</th>
                            <th>年龄</th>
                            <th>性别</th>
                            <th>年级</th>
                            <th>班级</th>
                            <th>家庭住址</th>
                            <th>操作</th>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>13515163321</td>
                            <td>张三</td>
                            <td>22</td>
                            <td>男</td>
                            <td>三年级</td>
                            <td>一班</td>
                            <td>广州</td>
                            <td><a href="#">编辑</a>&nbsp;<a href="#">删除</a></td>
                        </tr>
                    </table>
                </form>
            </div>
            <div class="item">
                <h3>查看班级信息</h3>
                <form action="#" method="post">
                    <table>
                        <tr>
                            <th>序号</th>
                            <th>学号</th>
                            <th>姓名</th>
                            <th>年龄</th>
                            <th>性别</th>
                            <th>年级</th>
                            <th>班级</th>
                            <th>家庭住址</th>
                            <th>操作</th>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>13515163321</td>
                            <td>张三</td>
                            <td>22</td>
                            <td>男</td>
                            <td>三年级</td>
                            <td>一班</td>
                            <td>广州</td>
                            <td><a href="#">编辑</a>&nbsp;<a href="#">删除</a></td>
                        </tr>
                    </table>
                </form>
            </div>
            <div class="item">
                <h3>添加班级信息</h3>
                <form action="#">
                    <label for="class_name">姓名</label>
                    <input type="text" name="classId" id="class_name"><br>
                    <label for="year">入学年份</label>
                    <input type="text" name="year" id="year"><br>
                    <label for="specialty">所在专业</label>
                    <input type="text" name="specialty" id="specialty"><br>
                    <label for="college">所在学院</label>
                    <input type="text" name="college" id="college"><br>
                    <label for="number">人数</label>
                    <input type="text" name="number" id="number"><br>
                    <label for="proportion">男女比例</label>
                    <input type="text" name="proportion" id="proportion"><br>
                    <label for="headteacher">班主任</label>
                    <input type="text" name="headteacher" id="headteacher"><br>
                    <input type="submit" value="确定">
                </form>
            </div>
            <div class="item">
                <h3>查询班级信息</h3>
                <form action="#" method="post">
                    <table>
                        <tr>
                            <th>序号</th>
                            <th>班级</th>
                            <th>入学年份</th>
                            <th>所在专业</th>
                            <th>所在学院</th>
                            <th>人数</th>
                            <th>男女比例</th>
                            <th>班主任</th>
                            <th>操作</th>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>2</td>
                            <td>2019</td>
                            <td>人工智能</td>
                            <td>信息学院</td>
                            <td>人数</td>
                            <td>男女比例</td>
                            <td>班主任</td>
                            <td><a href="#">编辑</a>&nbsp;<a href="#">删除</a></td>
                        </tr>
                    </table>
                </form>
            </div>
            <div class="item">
                <div class="new">
                    <h2>个人中心</h2>
                    <ul>
                        <li><a href="#">用户名:</a></li>
                        <li><a href="#">密码:</a></li>
                        <li><a href="#">Email:</a></li>
                        <li><a href="#">姓名：</a></li>
                        <li><a href="#">手机号：</a></li>
                        <li><a href="#">性别：</a></li>
                    </ul>
                    <a href="#">编辑</a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
