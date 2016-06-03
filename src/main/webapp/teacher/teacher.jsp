<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/inc.jsp" %>
<html>
<head>
    <title>教师管理 - 在线考试</title>
</head>
<body>
<c:if test="${sessionScope.teacher eq null}">
    <c:redirect url="/teacher/index.jsp"/>
</c:if>
<h1>教师管理</h1>
当前教师：${sessionScope.teacher.username}
<hr>
<dl>
    <c:forEach var="course" items="${sessionScope.courses}" varStatus="vs_c">
        <dt>${vs_c.count}. ${course.title}</dt>
        <c:forEach var="paper" items="${course.papers}" varStatus="vs_p">
            <dd>${vs_p.count}. <a href="${ctx}/paper/query/${paper.id}">${course.title}考试 试卷</a></dd>
        </c:forEach>
    </c:forEach>
</dl>
<hr>
<form action="${ctx}/paper/create" method="post">
    <select name="courseId">
        <c:forEach var="course" items="${sessionScope.courses}">
            <option value="${course.id}">${course.title}</option>
        </c:forEach>
    </select>
    <br>
    <label for="time">考试时间</label>
    <input id="time" type="text" name="time" placeholder="分钟"><br>
    <input type="submit" value="添加试卷">
</form>
<hr>
<ul>
    <c:forEach var="classPaper" items="${sessionScope.classPapers}">
        <li>${classPaper.clazz.title} ${classPaper.paper.course.title} 考试完成 <a href="${ctx}/teacher/studentCourse">前往判分</a></li>
    </c:forEach>
</ul>
</body>
</html>
