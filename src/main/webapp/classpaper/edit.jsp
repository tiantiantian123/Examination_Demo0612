<!DOCTYPE html><%@ page pageEncoding="UTF-8"%><%@ include file="/common/inc.jsp"%>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>classPaper edit page</title>
    </head>
    <body>
        <h1>ClassPaper Edit</h1>
        <form action="${ctx}/classpaper/modify" method="post">
            <input type="hidden" name="id" value="${sessionScope.classpaper.id}">
            CLASSID: <input name="classId" value="${sessionScope.classpaper.classId}"><br>
            PAPERID: <input name="paperId" value="${sessionScope.classpaper.paperId}"><br>
            TIME: <input name="time" value="${sessionScope.classpaper.time}"><br>
            ASSISTANTID: <input name="assistantId" value="${sessionScope.classpaper.assistantId}"><br>
            <input type="submit" value="MODIFY">
        </form>
    </body>
</html>