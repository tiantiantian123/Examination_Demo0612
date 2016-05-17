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
    <title>administration page</title>
</head>
<body>
<c:if test="${sessionScope.admin eq null}">
    <c:redirect url="/index.jsp"/>
</c:if>
<h1>administration</h1>
${sessionScope.admin.username}
<hr>
<form action="/class" method="post">
    <input type="hidden" name="action" value="create">
    <input type="text" name="name" placeholder="NAME"><br>
    <input type="text" name="schedule" placeholder="SCHEDULE"><br>
    <input type="date" name="startDate" placeholder="START DATE"><br>
    <input type="date" name="finishDate" placeholder="FINISH DATE"><br>
    <input type="submit" value="CREATE">
</form>
</body>
</html>
