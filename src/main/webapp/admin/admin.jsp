<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/inc.jsp"%>
<html>
<head>
    <title>管理员首页 - 在线考试</title>
</head>
<body>
<c:if test="${sessionScope.admin eq null}">
    <c:redirect url="/admin/index.jsp"/>
</c:if>
<h1>管理员首页</h1>
当前管理员：${sessionScope.admin.username}
<hr>
<a href="${ctx}/admin/create_teacher.jsp">添加教师</a><br>
<a href="${ctx}/admin/create_assistant.jsp">添加教务</a>
</body>
</html>
