<!DOCTYPE html><%@ page pageEncoding="UTF-8"%><%@ include file="/common/inc.jsp"%>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>classPaper list page</title>
        <script>
            function del() { return confirm('REMOVE?'); }
        </script>
    </head>
    <body>
        <h1>ClassPaper List</h1>
        <hr/>
        <c:import url="create.jsp"/>
        <hr/>
        <table border="1">
            <tr>
                <th>INDEX</th>
                <th>ID</th>
                <th>CLASSID</th>
                <th>PAPERID</th>
                <th>TIME</th>
                <th>ASSISTANTID</th>
                <th colspan="2">OPERATION</th>
            </tr>
            <c:forEach var="classpaper" items="${sessionScope.list}" varStatus="vs">
            <tr>
                <td>${vs.count}</td>
                <td>${classpaper.id}</td>
                <td>${classpaper.classId}</td>
                <td>${classpaper.paperId}</td>
                <td>${classpaper.time}</td>
                <td>${classpaper.assistantId}</td>
                <td><a href="${ctx}/classpaper/search/${classpaper.id}">EDIT</a></td>
                <td><a class="delete" href="${ctx }/classpaper/remove/${classpaper.id}" onclick="return del()">REMOVE</a></td>
            </tr>
            </c:forEach>
        </table>
    </body>
</html>