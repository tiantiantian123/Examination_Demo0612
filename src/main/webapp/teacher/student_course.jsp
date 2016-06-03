<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/inc.jsp" %>
<html>
<head>
    <title>学生成绩 - 在线考试</title>
</head>
<body>
<c:if test="${sessionScope.teacher eq null}">
    <c:redirect url="/teacher/index.jsp"/>
</c:if>
<h1>学生成绩</h1>
当前教师：${sessionScope.teacher.username}
<hr>

<c:if test="${sessionScope.studentCourses ne null}">
    <h2>${sessionScope.studentCourses[0].clazz.title}</h2>
    <h2>${sessionScope.studentCourses[0].studentCourses[0].course.title} 考试</h2>
    <h2>成绩表</h2>
</c:if>
<hr>
<table border="1">
    <tr>
        <th>序号</th>
        <th>姓名</th>
        <th>成绩</th>
    </tr>
    <c:forEach var="studentCourse" items="${sessionScope.studentCourses}" varStatus="vs">
        <tr>
            <td>${vs.count}</td>
            <td>${studentCourse.username}</td>
            <td>
                <c:if test="${studentCourse.studentCourses[0].grade eq null}">
                    <a href="${ctx}/teacher/studentTest/${sessionScope.paperId}/${studentCourse.id}">判卷</a>
                </c:if>
                <c:if test="${studentCourse.studentCourses[0].grade ne null}">
                    ${studentCourse.studentCourses[0].grade}
                </c:if>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
