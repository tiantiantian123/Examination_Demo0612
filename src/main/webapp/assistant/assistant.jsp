<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/inc.jsp"%>
<html>
<head>
    <title>教务管理 - 在线考试</title>
    <script src="${ctx}/static/js/jquery-1.12.3.min.js"></script>
    <script>
        $(function () {
            $('.remove').click(function () {
                return confirm("DEL?");
            });
        });
    </script>
</head>
<body>
<c:if test="${sessionScope.assistant eq null}">
    <c:redirect url="/assistant/index.jsp"/>
</c:if>
<h1>教务管理</h1>
当前教务：${sessionScope.assistant.username}
<hr>
<form action="${ctx}/student/search" method="post">
    <input type="text" name="key">
    <input type="submit" value="搜索学生">
</form>
<hr>
<form action="${ctx}/class/create" method="post">
    <label for="title">班级名称</label>
    <input id="title" type="text" name="title"><br>
    <label for="startDate">开班日期</label>
    <input id="startDate" type="date" name="startDate"><br>
    <label for="finishDate">结业日期</label>
    <input id="finishDate" type="date" name="finishDate"><br>
    <input type="submit" value="添加班级">
</form>
<hr>
<table border="1">
    <tr>
        <th>序号</th>
        <th>班级名称</th>
        <th>开班日期</th>
        <th>结业日期</th>
        <th colspan="3">操作</th>
    </tr>
    <c:forEach var="aClass" items="${sessionScope.classes}" varStatus="vs">
        <tr>
            <td>${vs.count}</td>
            <td><a href="${ctx}/class/students/${aClass.id}">${aClass.title}</a></td>
            <td>${aClass.startDate}</td>
            <td>${aClass.finishDate}</td>
            <td><a href="${ctx}/class/search/${aClass.id}">编辑</a></td>
            <td><a class="remove" href="${ctx}/class/remove/${aClass.id}">删除</a></td>
            <td><a href="${ctx}/paper/list/${aClass.id}">维护考试信息</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
