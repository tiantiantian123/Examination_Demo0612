<!DOCTYPE html><%@ page pageEncoding="UTF-8"%><%@ include file="/common/inc.jsp"%>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>studentTest edit page</title>
    </head>
    <body>
        <h1>StudentTest Edit</h1>
        <form action="${ctx}/studenttest/modify" method="post">
            <input type="hidden" name="id" value="${sessionScope.studenttest.id}">
            STUDENTID: <input name="studentId" value="${sessionScope.studenttest.studentId}"><br>
            TESTID: <input name="testId" value="${sessionScope.studenttest.testId}"><br>
            ANSWER: <input name="answer" value="${sessionScope.studenttest.answer}"><br>
            <input type="submit" value="MODIFY">
        </form>
    </body>
</html>