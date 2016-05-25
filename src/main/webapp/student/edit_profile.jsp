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
<form action="${ctx}/student/modify" method="post" enctype="multipart/form-data">
    <input type="text" name="email" placeholder="EMAIL" value="${sessionScope.student.email}"><br>
    <input type="text" name="username" placeholder="USERNAME" value="${sessionScope.student.username}"><br>
    <input type="password" name="password" placeholder="PASSWORD"><br>
    <input type="password" name="rePassword" placeholder="REPEAT PASSWORD"><br>
    <input type="file" name="photo"><br>
    <input type="submit" value="MODIFY">
</form>
</body>
</html>
