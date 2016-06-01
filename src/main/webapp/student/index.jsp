<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/inc.jsp" %>
<html>
<head>
    <title>学生首页 - 在线考试</title>
</head>
<body>
<c:if test="${sessionScope.student eq null}">
    <c:redirect url="/index.jsp"/>
</c:if>
<h1>学生首页</h1>
当前学生：${sessionScope.student.username}
<a href="${ctx}/system/logout">注销</a>
<hr>
<a href="${ctx}/student/edit_profile.jsp">编辑个人信息</a>
<hr>
<dl>
    <c:forEach var="classPaper" items="${sessionScope.classPapers}">
        <dt><a href="${ctx}/paper/studentQuery/${classPaper.paper.id}">${classPaper.paper.course.title}考试</a></dt>
        <dd>时间：${classPaper.time}</dd>
    </c:forEach>
</dl>
</body>
</html>
