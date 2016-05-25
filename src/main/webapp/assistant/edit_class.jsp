<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../common/inc.jsp"%>
<html>
<head>
    <title>edit class page</title>
</head>
<body>
<h1>edit class</h1>
<form action="${ctx}/class/modify" method="post">
    <input type="hidden" name="id" value="${sessionScope.aClass.id}">
    <input type="text" name="name" placeholder="NAME" value="${sessionScope.aClass.name}"><br>
    <input type="date" name="startDate" placeholder="START DATE" value="${sessionScope.aClass.startDate}"><br>
    <input type="date" name="finishDate" placeholder="FINISH DATE" value="${sessionScope.aClass.finishDate}"><br>
    <input type="submit" value="MODIFY">
</form>
</body>
</html>
