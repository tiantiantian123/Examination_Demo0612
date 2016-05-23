<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加教务 - 在线考试</title>
</head>
<body>
<h1>添加教务</h1>
${sessionScope.admin.username}
<hr>
<form action="${ctx}/admin/createAssistant" method="post">
    <input type="text" name="email" placeholder="EMAIL" value="assistant@qq.com"><br>
    <input type="text" name="username" placeholder="USERNAME" value="assistant"><br>
    <input type="password" name="password" placeholder="PASSWORD" value="123"><br>
    <input type="submit" value="添加教务">
</form>
</body>
</html>
