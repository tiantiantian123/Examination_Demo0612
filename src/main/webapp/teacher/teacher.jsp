<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/inc.jsp" %>
<html>
<head>
    <title>教师管理 - 在线考试</title>
</head>
<body>
<c:if test="${sessionScope.teacher eq null}">
    <c:redirect url="/teacher/index.jsp"/>
</c:if>
<h1>教师管理</h1>
当前教师：${sessionScope.teacher.username}
</body>
</html>
