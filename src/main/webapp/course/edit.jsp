<!DOCTYPE html><%@ page pageEncoding="UTF-8"%><%@ include file="/common/inc.jsp"%>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>course edit page</title>
    </head>
    <body>
        <h1>Course Edit</h1>
        <form action="${ctx}/course/modify" method="post">
            <input type="hidden" name="id" value="${sessionScope.course.id}">
            TITLE: <input name="title" value="${sessionScope.course.title}"><br>
            <input type="submit" value="MODIFY">
        </form>
    </body>
</html>