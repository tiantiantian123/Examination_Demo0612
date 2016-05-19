<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/inc.jsp"%>
<html>
<head>
    <title>admin index page</title>
</head>
<body>
<h1>admin index</h1>
<form action="/admin" method="post">
    <input type="hidden" name="action" value="login">
    <input type="text" name="email" placeholder="EMAIL" value="admin@qq.com"><br>
    <input type="password" name="password" placeholder="PASSWORD" value="123"><br>
    <input type="submit" value="ADMIN LOGIN">
</form>
${requestScope.message}
</body>
</html>
