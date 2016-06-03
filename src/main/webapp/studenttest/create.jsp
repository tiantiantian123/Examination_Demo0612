<!DOCTYPE html><%@ page pageEncoding="UTF-8"%><%@ include file="/common/inc.jsp"%>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>studentTest add page</title>
    </head>
    <body>
        <h1>StudentTest Create</h1>
        <form action="${ctx}/studenttest/create" method="post">
            STUDENTID: <input name="studentId"><br>
            TESTID: <input name="testId"><br>
            ANSWER: <input name="answer"><br>
            <input type="submit" value="CREATE">
        </form>
    </body>
</html>