<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../common/inc.jsp"%>
<html>
<head>
    <title>编辑班级 - 在线考试</title>
</head>
<body>
<h1>编辑班级</h1>
<form action="${ctx}/class/modify" method="post">
    <input type="hidden" name="id" value="${sessionScope.aClass.id}">
    <input type="text" name="title" placeholder="TITLE" value="${sessionScope.aClass.title}"><br>
    <input type="date" name="startDate" placeholder="START DATE" value="${sessionScope.aClass.startDate}"><br>
    <input type="date" name="finishDate" placeholder="FINISH DATE" value="${sessionScope.aClass.finishDate}"><br>
    <input type="submit" value="保存">
</form>
</body>
</html>
