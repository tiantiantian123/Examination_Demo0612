<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 16-5-12
  Time: 下午2:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/inc.jsp"%>
<html>
<head>
    <title>admin page</title>
</head>
<body>
<c:if test="${sessionScope.admin eq null}">
    <c:redirect url="/admin/index.jsp"/>
</c:if>
<h1>admin</h1>
${sessionScope.admin.username}
<hr>
<a href="/admin/create_teacher.jsp">CREATE TEACHER</a><br>
<a href="/admin/create_assistant.jsp">CREATE ASSISTANT</a>
</body>
</html>
