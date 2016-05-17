<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 16-5-12
  Time: 下午2:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/inc.jsp"%>
<html>
<head>
    <title>system page</title>
</head>
<body>
<c:if test="${sessionScope.admin eq null}">
    <c:redirect url="/index.jsp"/>
</c:if>
<h1>system</h1>
${sessionScope.admin.username}
<hr>
<form action="/admin" method="post">
    <input type="hidden" name="action" value="create">
    <input type="text" name="email" placeholder="EMAIL"><br>
    <input type="text" name="username" placeholder="USERNAME"><br>
    <input type="password" name="password" placeholder="PASSWORD"><br>
    <input type="radio" name="role" value="t">教师
    <input type="radio" name="role" value="a">教务<br>
    <input type="submit" value="CREATE">
</form>
</body>
</html>
