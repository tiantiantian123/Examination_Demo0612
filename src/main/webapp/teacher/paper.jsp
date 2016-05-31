<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/inc.jsp" %>
<html>
<head>
    <title>试题管理 - 在线考试</title>
    <link rel="stylesheet" href="${ctx}/static/css/style.css">
</head>
<body>
<c:if test="${sessionScope.teacher eq null}">
    <c:redirect url="/teacher/index.jsp"/>
</c:if>
<h1>试题管理</h1>
当前教师：${sessionScope.teacher.username}
<p class="center">${sessionScope.paper.course.title}考试 试卷</p>
<p class="center">考试时间：${sessionScope.paper.time} 分钟</p>
<hr>
<table border="1">
    <tr>
        <th>序号</th>
        <th>题型</th>
        <th>题目</th>
        <th>选项A</th>
        <th>选项B</th>
        <th>选项C</th>
        <th>选项D</th>
        <th>答案</th>
        <th>分数</th>
        <th colspan="2">操作</th>
    </tr>
    <c:forEach var="test" items="${sessionScope.paper.tests}" varStatus="vs">
        <tr>
            <td>${vs.count}</td>
            <td>${test.type}</td>
            <td>${test.question}</td>
            <td>${test.optionA}</td>
            <td>${test.optionB}</td>
            <td>${test.optionC}</td>
            <td>${test.optionD}</td>
            <td>${test.answer}</td>
            <td>${test.score}</td>
            <td><a href="">编辑</a></td>
            <td><a href="">删除</a></td>
        </tr>
    </c:forEach>
</table>
<hr>
<form action="${ctx}/test/create" method="post">
    <label for="type">题型</label>
    <select id="type" name="type">
        <option value="x">选择题</option>
        <option value="t">填空题</option>
        <option value="j">简单题</option>
        <option value="b">编程题</option>
    </select><br>
    <label for="question">题目</label>
    <textarea id="question" name="question"></textarea><br>
    <label for="optionA">选项A</label>
    <input id="optionA" type="text" name="optionA"><br>
    <label for="optionB">选项B</label>
    <input id="optionB" type="text" name="optionB"><br>
    <label for="optionC">选项C</label>
    <input id="optionC" type="text" name="optionC"><br>
    <label for="optionD">选项D</label>
    <input id="optionD" type="text" name="optionD"><br>
    <label for="answer">答案</label>
    <textarea id="answer" name="answer"></textarea><br>
    <label for="score">分数</label>
    <input id="score" type="text" name="score"><br>
    <input type="submit" value="添加试题">
</form>
</body>
</html>
