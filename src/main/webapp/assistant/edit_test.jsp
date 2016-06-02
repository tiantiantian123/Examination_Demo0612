<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../common/inc.jsp" %>
<html>
<head>
    <title>维护考试信息 - 在线考试</title>
</head>
<body>
<h1>维护考试信息</h1>
<form action="${ctx}/classpaper/create" method="post">
    <input type="hidden" name="classId" value="${sessionScope.classId}">
    <label for="paper_id">选择试卷</label>
    <select id="paper_id" name="paperId">
        <c:forEach var="paper" items="${sessionScope.papers}">
            <option value="${paper.id}">${paper.id}. ${paper.course.title}考试 试卷</option>
        </c:forEach>
    </select><br>
    <label for="time">考试时间</label>
    <input id="time" type="datetime-local" name="time"><br>
    <input type="submit" value="添加">
</form>
<hr>
<table border="1">
    <tr>
        <th>序号</th>
        <th>班级名称</th>
        <th>试卷名称</th>
        <th>考试时间</th>
        <th>当前状态</th>
        <th colspan="2">操作</th>
    </tr>
    <c:forEach var="classPaper" items="${sessionScope.classPapers}" varStatus="vs">
        <tr>
            <td>${vs.count}</td>
            <td>${classPaper.clazz.title}</td>
            <td>${classPaper.paper.course.title}考试 试卷</td>
            <td>${classPaper.time}</td>
            <c:if test="${classPaper.status eq 0}"><td>未考试</td></c:if>
            <c:if test="${classPaper.status eq 1}"><td>考试中</td></c:if>
            <c:if test="${classPaper.status eq 2}"><td>考试完成</td></c:if>
            <c:if test="${classPaper.status eq 3}"><td>判分完成</td></c:if>
            <td><a href="${ctx}/classpaper/search/${classPaper.id}">编辑</a></td>
            <td><a href="">删除</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
