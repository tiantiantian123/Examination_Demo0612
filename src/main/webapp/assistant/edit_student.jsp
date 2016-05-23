<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生管理 - 在线考试</title>
</head>
<body>
<c:if test="${sessionScope.assistant eq null}">
    <c:redirect url="/assistant/index.jsp"/>
</c:if>
<h1>学生管理</h1>
当前教务：${sessionScope.assistant.username}
${sessionScope.students}
</body>
</html>
