<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/inc.jsp"%>
<html>
<head>
    <title>assistant page</title>
    <script src="/static/js/jquery-1.12.3.min.js"></script>
    <script>
        $(function () {
            $('.remove').click(function () {
                return confirm("DEL?");
            });
        });
    </script>
</head>
<body>
<c:if test="${sessionScope.assistant eq null}">
    <c:redirect url="/assistant/index.jsp"/>
</c:if>
<h1>assistant</h1>
${sessionScope.assistant.username}
<hr>
<form action="/class" method="post">
    <input type="hidden" name="action" value="create">
    <input type="text" name="name" placeholder="NAME"><br>
    <input type="date" name="startDate" placeholder="START DATE"><br>
    <input type="date" name="finishDate" placeholder="FINISH DATE"><br>
    <input type="submit" value="CREATE">
</form>
<hr>
<table border="1">
    <tr>
        <th>ID</th>
        <th>NAME</th>
        <th>START DATE</th>
        <th>FINISH DATE</th>
        <th colspan="2">OPERATION</th>
    </tr>
    <c:forEach var="aClass" items="${sessionScope.classes}" varStatus="vs">
        <tr>
            <td>${vs.count}</td>
            <td><a href="/student?action=queryStudentsByClassId&id=${aClass.id}">${aClass.name}</a></td>
            <td>${aClass.startDate}</td>
            <td>${aClass.finishDate}</td>
            <td><a href="/class?action=search&id=${aClass.id}">EDIT</a></td>
            <td><a class="remove" href="${ctx}/classController/remove/${aClass.id}">REMOVE</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
