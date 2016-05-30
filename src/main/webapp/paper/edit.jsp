<!DOCTYPE html><%@ page pageEncoding="UTF-8"%><%@ include file="/common/inc.jsp"%>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>paper edit page</title>
    </head>
    <body>
        <h1>Paper Edit</h1>
        <form action="${ctx}/paper/modify" method="post">
            <input type="hidden" name="id" value="${sessionScope.paper.id}">
            TITLE: <input name="title" value="${sessionScope.paper.title}"><br>
            TIME: <input name="time" value="${sessionScope.paper.time}"><br>
            COURSEID: <input name="courseId" value="${sessionScope.paper.courseId}"><br>
            TEACHERID: <input name="teacherId" value="${sessionScope.paper.teacherId}"><br>
            <input type="submit" value="MODIFY">
        </form>
    </body>
</html>