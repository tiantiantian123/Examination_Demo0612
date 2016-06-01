<!DOCTYPE html><%@ page pageEncoding="UTF-8"%><%@ include file="/common/inc.jsp"%>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>classPaper add page</title>
    </head>
    <body>
        <h1>ClassPaper Create</h1>
        <form action="${ctx}/classpaper/create" method="post">
            CLASSID: <input name="classId"><br>
            PAPERID: <input name="paperId"><br>
            TIME: <input name="time"><br>
            ASSISTANTID: <input name="assistantId"><br>
            <input type="submit" value="CREATE">
        </form>
    </body>
</html>