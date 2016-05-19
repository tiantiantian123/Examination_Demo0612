<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 16-5-12
  Time: 下午2:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/inc.jsp"%>
<html>
<head>
    <title>assistant index page</title>
</head>
<body>
<h1>assistant index</h1>
<form action="/assistant" method="post">
    <input type="hidden" name="action" value="login">
    <input type="text" name="email" placeholder="EMAIL" value="assistant@qq.com"><br>
    <input type="password" name="password" placeholder="PASSWORD" value="123"><br>
    <input type="submit" value="ASSISTANT LOGIN">
</form>
${requestScope.message}
</body>
</html>
