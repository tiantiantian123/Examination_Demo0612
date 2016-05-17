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
    <title>student edit profile page</title>
</head>
<body>
<c:if test="${sessionScope.student eq null}">
    <c:redirect url="/index.jsp"/>
</c:if>
<h1>student edit profile</h1>
${sessionScope.student.username}
<hr>
<form action="/student?action=update" method="post" enctype="multipart/form-data">
    <input type="text" name="email" value="${sessionScope.student.email}"><br>
    <input type="text" name="username" value="${sessionScope.student.username}"><br>
    <input type="password" name="password" placeholder="PASSWORD"><br>
    <input type="password" name="rePassword" placeholder="REPEAT PASSWORD"><br>
    <input type="file" name="photo"><br>
    <input type="submit" value="UPDATE">
</form>
</body>
</html>
