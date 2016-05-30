<!DOCTYPE html><%@ page pageEncoding="UTF-8"%><%@ include file="/common/inc.jsp"%>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>course add page</title>
    </head>
    <body>
        <h1>Course Create</h1>
        <form action="${ctx}/course/create" method="post">
            TITLE: <input name="title"><br>
            <input type="submit" value="CREATE">
        </form>
    </body>
</html>