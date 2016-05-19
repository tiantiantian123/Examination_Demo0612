<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>create teacher page</title>
</head>
<body>
<h1>create teacher</h1>
${sessionScope.admin.username}
<hr>
<form action="/admin" method="post">
    <input type="hidden" name="action" value="createTeacher">
    <input type="text" name="email" placeholder="EMAIL" value="teacher@qq.com"><br>
    <input type="text" name="username" placeholder="USERNAME" value="teacher"><br>
    <input type="password" name="password" placeholder="PASSWORD" value="123"><br>
    <input type="submit" value="CREATE TEACHER">
</form>
</body>
</html>
