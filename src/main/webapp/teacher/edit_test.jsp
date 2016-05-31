<!DOCTYPE html>
<%@ page pageEncoding="UTF-8" %>
<%@ include file="/common/inc.jsp" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>编辑试题 - 在线考试</title>
    <link rel="stylesheet" href="${ctx}/static/css/style.css"/>
    <script src="${ctx}/static/js/jquery-1.12.3.min.js"></script>
    <script>
        $(function () {
            $('#type').change(function () {
                if ($(this).val() == 'x') {
                    $('#options').show();
                } else {
                    $('#options').hide();
                }
                if ($(this).val() == 't') {
                    $('#question_hint').show();
                } else {
                    $('#question_hint').hide();
                }
                if ($(this).val() == 'b') {
                    $('#answers').hide();
                } else {
                    $('#answers').show();
                }
            });

            $.each($('option'), function () {
                if ($(this).attr('value') == $('#type').attr('title')) {
                    $(this).attr('selected', 'selected');
                    $('#type').trigger('change');
                }
            });
        });
    </script>
</head>
<body>
<h1>编辑试题</h1>
<c:if test="${sessionScope.teacher eq null}">
    <c:redirect url="/teacher/index.jsp"/>
</c:if>
当前教师：${sessionScope.teacher.username}
<hr>
<form action="${ctx}/test/modify" method="post">
    <input type="hidden" name="id" value="${sessionScope.test.id}">
    <label for="type">题型</label>
    <select id="type" name="type" title="${sessionScope.test.type}">
        <option value="x">选择题</option>
        <option value="t">填空题</option>
        <option value="j">简答题</option>
        <option value="b">编程题</option>
    </select>
    <label for="score">分数</label>
    <input id="score" type="text" name="score" value="${sessionScope.test.score}"><br>
    <label for="question">题目</label>
    <span id="question_hint">使用 ### 来表示填空位</span>
    <textarea id="question" name="question">${sessionScope.test.question}</textarea><br>
    <div id="options">
        <label for="optionA">选项A</label>
        <input id="optionA" type="text" name="optionA" value="${sessionScope.test.optionA}"><br>
        <label for="optionB">选项B</label>
        <input id="optionB" type="text" name="optionB" value="${sessionScope.test.optionB}"><br>
        <label for="optionC">选项C</label>
        <input id="optionC" type="text" name="optionC" value="${sessionScope.test.optionC}"><br>
        <label for="optionD">选项D</label>
        <input id="optionD" type="text" name="optionD" value="${sessionScope.test.optionD}"><br>
    </div>
    <div id="answers">
        <label for="answer">答案</label>
        <textarea id="answer" name="answer">${sessionScope.test.answer}</textarea><br>
    </div>
    <input type="submit" value="保存">
</form>
</form>
</body>
</html>