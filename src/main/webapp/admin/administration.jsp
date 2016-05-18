<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 16-5-12
  Time: 下午2:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/inc.jsp"%>
<html>
<head>
    <title>administration page</title>
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
<c:if test="${sessionScope.admin eq null}">
    <c:redirect url="/index.jsp"/>
</c:if>
<h1>administration</h1>
${sessionScope.admin.username}
<hr>
<form action="/class" method="post">
    <input type="hidden" name="action" value="create">
    <input type="text" name="name" placeholder="NAME"><br>
    <input type="text" name="schedule" placeholder="SCHEDULE"><br>
    <input type="date" name="startDate" placeholder="START DATE"><br>
    <input type="date" name="finishDate" placeholder="FINISH DATE"><br>
    <input type="submit" value="CREATE">
</form>
<hr>
<table border="1">
    <tr>
        <th>ID</th>
        <th>NAME</th>
        <th>SCHEDULE</th>
        <th>START DATE</th>
        <th>FINISH DATE</th>
        <th colspan="2">OPERATION</th>
    </tr>
    <c:forEach var="aClass" items="${sessionScope.classes}" varStatus="vs">
        <tr>
            <td>${vs.count}</td>
            <td><a href="/student?action=queryStudentsByClassId&id=${aClass.id}">${aClass.name}</a></td>
            <td>${aClass.schedule}</td>
            <td>${aClass.startDate}</td>
            <td>${aClass.finishDate}</td>
            <td><a href="/class?action=search&id=${aClass.id}">EDIT</a></td>
            <td><a class="remove" href="/class?action=remove&id=${aClass.id}">REMOVE</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
