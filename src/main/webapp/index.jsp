<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>首页 - 在线考试</title>
</head>
<body>
<h1>首页</h1>
<form action="/student" method="post">
    <input type="hidden" name="action" value="login">
    <input type="text" name="email" placeholder="EMAIL" value="student@qq.com"><br>
    <input type="password" name="password" placeholder="PASSWORD" value="123"><br>
    <input type="submit" value="学生登录">
</form>
${requestScope.message}
<hr>
<a href="/class?action=queryAllClasses">学生注册</a>
<hr>
<a href="/admin/index.jsp">管理员登录</a><br>
<a href="/teacher/index.jsp">教师登录</a><br>
<a href="/assistant/index.jsp">教务登录</a><br>
</body>
</html>
