<!DOCTYPE html><%@ page pageEncoding="UTF-8"%><%@ include file="/common/inc.jsp"%>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>studentCourse edit page</title>
    </head>
    <body>
        <h1>StudentCourse Edit</h1>
        <form action="${ctx}/studentcourse/modify" method="post">
            <input type="hidden" name="id" value="${sessionScope.studentcourse.id}">
            STUDENTID: <input name="studentId" value="${sessionScope.studentcourse.studentId}"><br>
            COURSEID: <input name="courseId" value="${sessionScope.studentcourse.courseId}"><br>
            GRADE: <input name="grade" value="${sessionScope.studentcourse.grade}"><br>
            <input type="submit" value="MODIFY">
        </form>
    </body>
</html>