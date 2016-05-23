<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加教师 - 在线考试</title>
</head>
<body>
<h1>添加教师</h1>
当前管理员：${sessionScope.admin.username}
<hr>
<form action="${ctx}/admin/createTeacher" method="post">
    <input type="text" name="email" placeholder="EMAIL" value="teacher@qq.com"><br>
    <input type="text" name="username" placeholder="USERNAME" value="teacher"><br>
    <input type="password" name="password" placeholder="PASSWORD" value="123"><br>
    <input type="submit" value="添加教师">
</form>
</body>
</html>
