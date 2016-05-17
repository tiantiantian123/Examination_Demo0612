<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 16-5-12
  Time: 下午2:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/inc.jsp"%>
<html>
<head>
    <title>student index page</title>
</head>
<body>
<c:if test="${sessionScope.student eq null}">
    <c:redirect url="/index.jsp"/>
</c:if>
<h1>student index</h1>
${sessionScope.student.username}
<hr>
<a href="/student/edit_profile.jsp">EDIT PROFILE</a>
</body>
</html>
