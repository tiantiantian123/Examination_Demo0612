<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/inc.jsp"%>
<html>
<head>
    <title>学生首页 - 在线考试</title>
</head>
<body>
<c:if test="${sessionScope.student eq null}">
    <c:redirect url="/index.jsp"/>
</c:if>
<h1>学生首页</h1>
当前学生：${sessionScope.student.username}
<hr>
<a href="/student/edit_profile.jsp">编辑个人信息</a>
</body>
</html>
