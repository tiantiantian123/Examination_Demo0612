<!DOCTYPE html><%@ page pageEncoding="UTF-8"%><%@ include file="/common/inc.jsp"%>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>studentCourse list page</title>
        <script>
            function del() { return confirm('REMOVE?'); }
        </script>
    </head>
    <body>
        <h1>StudentCourse List</h1>
        <hr/>
        <c:import url="create.jsp"/>
        <hr/>
        <table border="1">
            <tr>
                <th>INDEX</th>
                <th>ID</th>
                <th>STUDENTID</th>
                <th>COURSEID</th>
                <th>GRADE</th>
                <th colspan="2">OPERATION</th>
            </tr>
            <c:forEach var="studentcourse" items="${sessionScope.list}" varStatus="vs">
            <tr>
                <td>${vs.count}</td>
                <td>${studentcourse.id}</td>
                <td>${studentcourse.studentId}</td>
                <td>${studentcourse.courseId}</td>
                <td>${studentcourse.grade}</td>
                <td><a href="${ctx}/studentcourse/search/${studentcourse.id}">EDIT</a></td>
                <td><a class="delete" href="${ctx }/studentcourse/remove/${studentcourse.id}" onclick="return del()">REMOVE</a></td>
            </tr>
            </c:forEach>
        </table>
    </body>
</html>