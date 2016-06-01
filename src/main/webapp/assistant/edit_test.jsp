<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../common/inc.jsp" %>
<html>
<head>
    <title>编辑考试信息 - 在线考试</title>
</head>
<body>
<h1>编辑考试信息</h1>
<form action="${ctx}/classpaper/create" method="post">
    <input type="hidden" name="classId" value="${sessionScope.classId}">
    <label for="paper_id">选择试卷</label>
    <select id="paper_id" name="paperId">
    <c:forEach var="paper" items="${sessionScope.papers}">
        <option value="${paper.id}">${paper.id}</option>
    </c:forEach>
    </select><br>
    <label for="time">考试时间</label>
    <input id="time"  type="datetime-local" name="time"><br>
    <input type="submit" value="添加">
</form>
</body>
</html>
