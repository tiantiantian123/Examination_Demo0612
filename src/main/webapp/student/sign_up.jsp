<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 16-5-12
  Time: 下午2:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/inc.jsp"%>
<html>
<head>
    <title>student sign up page</title>
</head>
<body>
<h1>student sign up</h1>
<form action="/student" method="post">
    <input type="hidden" name="action" value="signUp">
    <input type="text" name="email" placeholder="EMAIL"><br>
    <input type="text" name="username" placeholder="USERNAME"><br>
    <input type="password" name="password" placeholder="PASSWORD"><br>
    <input type="submit" value="STUDENT SIGN UP">
</form>
<hr>
</body>
</html>
