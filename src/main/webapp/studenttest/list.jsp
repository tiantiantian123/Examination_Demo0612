<!DOCTYPE html><%@ page pageEncoding="UTF-8"%><%@ include file="/common/inc.jsp"%>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>studentTest list page</title>
        <script>
            function del() { return confirm('REMOVE?'); }
        </script>
    </head>
    <body>
        <h1>StudentTest List</h1>
        <hr/>
        <c:import url="create.jsp"/>
        <hr/>
        <table border="1">
            <tr>
                <th>INDEX</th>
                <th>ID</th>
                <th>STUDENTID</th>
                <th>TESTID</th>
                <th>ANSWER</th>
                <th colspan="2">OPERATION</th>
            </tr>
            <c:forEach var="studenttest" items="${sessionScope.list}" varStatus="vs">
            <tr>
                <td>${vs.count}</td>
                <td>${studenttest.id}</td>
                <td>${studenttest.studentId}</td>
                <td>${studenttest.testId}</td>
                <td>${studenttest.answer}</td>
                <td><a href="${ctx}/studenttest/search/${studenttest.id}">EDIT</a></td>
                <td><a class="delete" href="${ctx }/studenttest/remove/${studenttest.id}" onclick="return del()">REMOVE</a></td>
            </tr>
            </c:forEach>
        </table>
    </body>
</html>