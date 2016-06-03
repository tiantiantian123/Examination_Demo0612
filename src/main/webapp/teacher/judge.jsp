<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/inc.jsp" %>
<html>
<head>
    <title>判卷 - 在线考试</title>
    <link rel="stylesheet" href="${ctx}/static/css/style.css"/>
</head>
<body>
<c:if test="${sessionScope.teacher eq null}">
    <c:redirect url="/teacher/index.jsp"/>
</c:if>
<h1>判卷</h1>
当前教师：${sessionScope.teacher.username}
<hr>
${sessionScope.tests}
<hr>
${sessionScope.studentTests}
<hr>
<table class="fix" border="1" style="width: 80%; display: inline-block;">
    <tr>
        <th>题目</th>
        <th>参考答案</th>
    </tr>
    <c:forEach var="test" items="${sessionScope.tests}">
    <tr>
        <td>${test.question}</td>
        <td>${test.answer}</td>
    </tr>
    </c:forEach>
</table>
<table class="fix" border="1" style="width: 15%; display: inline-block;">
    <tr>
        <th>学生答案</th>
        <th>分数</th>
    </tr>
    <c:forEach var="studentTest" items="${sessionScope.studentTests}">
        <tr>
            <td>${studentTest.answer}</td>
            <td><input type="text" name=""></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
