<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 16-5-12
  Time: 下午1:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>index page</title>
</head>
<body>
<h1>index</h1>
<form action="/student" method="post">
    <input type="hidden" name="action" value="login">
    <input type="text" name="email" placeholder="EMAIL" value="s1@qq.com"><br>
    <input type="password" name="password" placeholder="PASSWORD" value="123"><br>
    <input type="submit" value="STUDENT LOGIN">
</form>
${requestScope.message}
<hr>
<a href="/class?action=queryAll">SIGN UP</a>
</body>
</html>
