<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common/inc.jsp"%>
<html>
<head>
    <title>首页 - 在线考试</title>
</head>
<body>
<h1>首页</h1>
<form action="${ctx}/studentController/login" method="post">
    <input type="text" name="email" placeholder="EMAIL" value="student@qq.com"><br>
    <input type="password" name="password" placeholder="PASSWORD" value="123"><br>
    <input type="submit" value="学生登录">
</form>
${requestScope.message}
<hr>${ctx}
<a href="${ctx}/class/queryAllClasses">学生注册</a>
<hr>
<a href="${ctx}/admin/index.jsp">管理员登录</a><br>
<a href="${ctx}/teacher/index.jsp">教师登录</a><br>
<a href="${ctx}/assistant/index.jsp">教务登录</a><br>
</body>
</html>
