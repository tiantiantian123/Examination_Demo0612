<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/inc.jsp"%>
<html>
<head>
    <title>管理员首页 - 在线考试</title>
</head>
<body>
<h1>管理员首页</h1>
<form action="${ctx}/admin/login" method="post">
    <input type="text" name="email" placeholder="EMAIL" value="admin@qq.com"><br>
    <input type="password" name="password" placeholder="PASSWORD" value="123"><br>
    <input type="submit" value="管理员登录">
</form>
${requestScope.message}
</body>
</html>
