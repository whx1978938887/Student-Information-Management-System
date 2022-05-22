<%--
  Created by IntelliJ IDEA.
  User: A
  Date: 2022/5/7
  Time: 16:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        response.sendRedirect(request.getContextPath()+"/login.jsp");
    %>
</body>
</html>
