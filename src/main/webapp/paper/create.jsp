<!DOCTYPE html><%@ page pageEncoding="UTF-8"%><%@ include file="/common/inc.jsp"%>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>paper add page</title>
    </head>
    <body>
        <h1>Paper Create</h1>
        <form action="${ctx}/paper/create" method="post">
            TIME: <input name="time"><br>
            COURSEID: <input name="courseId"><br>
            TEACHERID: <input name="teacherId"><br>
            <input type="submit" value="CREATE">
        </form>
    </body>
</html>