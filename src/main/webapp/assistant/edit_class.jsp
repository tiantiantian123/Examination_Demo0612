<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 16-5-18
  Time: 下午3:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>edit class page</title>
</head>
<body>
<h1>edit class</h1>
<form action="/class" method="post">
    <input type="hidden" name="action" value="update">
    <input type="hidden" name="id" value="${sessionScope.aClass.id}">
    <input type="text" name="name" placeholder="NAME" value="${sessionScope.aClass.name}"><br>
    <input type="date" name="startDate" placeholder="START DATE" value="${sessionScope.aClass.startDate}"><br>
    <input type="date" name="finishDate" placeholder="FINISH DATE" value="${sessionScope.aClass.finishDate}"><br>
    <input type="submit" value="UPDATE">
</form>
</body>
</html>
