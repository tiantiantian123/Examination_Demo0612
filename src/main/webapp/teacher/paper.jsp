<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/inc.jsp" %>
<html>
<head>
    <title>试题管理 - 在线考试</title>
    <link href="${ctx}/static/css/style.css">
</head>
<body>
<c:if test="${sessionScope.teacher eq null}">
    <c:redirect url="/teacher/index.jsp"/>
</c:if>
<h1>试题管理</h1>
当前教师：${sessionScope.teacher.username}
<p class="center">${sessionScope.paper.course.title}考试 试卷</p>
<p class="center">考试时间：${sessionScope.paper.time}分钟</p>
<hr>
</body>
</html>
