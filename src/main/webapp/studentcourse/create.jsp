<!DOCTYPE html><%@ page pageEncoding="UTF-8"%><%@ include file="/common/inc.jsp"%>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>studentCourse add page</title>
    </head>
    <body>
        <h1>StudentCourse Create</h1>
        <form action="${ctx}/studentcourse/create" method="post">
            STUDENTID: <input name="studentId"><br>
            COURSEID: <input name="courseId"><br>
            GRADE: <input name="grade"><br>
            <input type="submit" value="CREATE">
        </form>
    </body>
</html>