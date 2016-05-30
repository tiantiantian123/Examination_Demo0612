<!DOCTYPE html><%@ page pageEncoding="UTF-8"%><%@ include file="/common/inc.jsp"%>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>test add page</title>
    </head>
    <body>
        <h1>Test Create</h1>
        <form action="${ctx}/test/create" method="post">
            QUESTION: <input name="question"><br>
            OPTIONA: <input name="optionA"><br>
            OPTIONB: <input name="optionB"><br>
            OPTIONC: <input name="optionC"><br>
            OPTIOND: <input name="optionD"><br>
            ANSWER: <input name="answer"><br>
            SCORE: <input name="score"><br>
            TYPE: <input name="type"><br>
            PAPERID: <input name="paperId"><br>
            <input type="submit" value="CREATE">
        </form>
    </body>
</html>