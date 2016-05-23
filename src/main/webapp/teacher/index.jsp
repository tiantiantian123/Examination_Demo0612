<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/inc.jsp"%>
<html>
<head>
    <title>teacher index page</title>
</head>
<body>
<h1>teacher index</h1>
<form action="${ctx}/teacher/login" method="post">
    <input type="text" name="email" placeholder="EMAIL" value="teacher@qq.com"><br>
    <input type="password" name="password" placeholder="PASSWORD" value="123"><br>
    <input type="submit" value="TEACHER LOGIN">
</form>
${requestScope.message}
</body>
</html>
