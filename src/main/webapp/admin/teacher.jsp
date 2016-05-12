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
    <title>teacher page</title>
</head>
<body>
<c:if test="${sessionScope.admin eq null}">
    <c:redirect url="/index.jsp"/>
</c:if>
<h1>teacher</h1>
</body>
</html>
