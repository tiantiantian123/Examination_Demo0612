<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/inc.jsp" %>
<html>
<head>
    <title>试题管理 - 在线考试</title>
    <link rel="stylesheet" href="${ctx}/static/css/style.css">
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
            var table = $('table');
            $('#show').click(function () {
                table.toggleClass('fix');
                $(this).text(table.css('table-layout') == 'fixed' ? '表格展开' : '表格收起');
            });
            $('button.preview').click(function () {
                table.toggle();
                $('div.preview').toggle();
                $(this).text(table.css('display') == 'none' ? '隐藏预览' : '显示预览');
            });

            $("<p>选择题</p>").addClass('type').insertBefore($('.x:first'));
            $("<p>填空题</p>").addClass('type').insertBefore($('.t:first'));
            $("<p>简答题</p>").addClass('type').insertBefore($('.j:first'));
            $("<p>编程题</p>").addClass('type').insertBefore($('.b:first'));

            $('.t').html($('.t').text().replace('###', '<input>'));

            $.each($('.x'), function (index) {
                $(this).prepend(index + 1 + '.');
            })
            $.each($('.t'), function (index) {
                $(this).prepend(index + 1 + '.');
            })
            $.each($('.j'), function (index) {
                $(this).prepend(index + 1 + '.');
            })
            $.each($('.b'), function (index) {
                $(this).prepend(index + 1 + '.');
            })

        });
    </script>
</head>
<body>
<c:if test="${sessionScope.teacher eq null}">
    <c:redirect url="/teacher/index.jsp"/>
</c:if>
<h1>试题管理</h1>
当前教师：${sessionScope.teacher.username}
<p class="title">${sessionScope.paper.course.title}考试 试卷</p>
<p class="time">考试时间：<span class="red">${sessionScope.paper.time}</span> 分钟</p>
<hr>
<table class="fix" border="1">
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
    <c:set var="x" value="0"/><c:set var="t" value="0"/><c:set var="j" value="0"/><c:set var="b" value="0"/><c:set
        var="score" value="0"/>
    <c:forEach var="test" items="${sessionScope.paper.tests}" varStatus="vs">
        <c:if test="${test.type eq 'x'}"><c:set var="x" value="${x + 1}"/></c:if>
        <c:if test="${test.type eq 't'}"><c:set var="t" value="${t + 1}"/></c:if>
        <c:if test="${test.type eq 'j'}"><c:set var="j" value="${j + 1}"/></c:if>
        <c:if test="${test.type eq 'b'}"><c:set var="b" value="${b + 1}"/></c:if>
        <c:set var="score" value="${score + test.score}"/>
        <tr>
            <td>${vs.count}</td>
            <td>${test.type}</td>
            <td title="${test.question}">${test.question}</td>
            <td>${test.optionA}</td>
            <td>${test.optionB}</td>
            <td>${test.optionC}</td>
            <td>${test.optionD}</td>
            <td>${test.answer}</td>
            <td>${test.score}</td>
            <td><a href="${ctx}/test/search/${test.id}">编辑</a></td>
            <td><a href="">删除</a></td>
        </tr>
    </c:forEach>
    <tr>
        <th>题型统计</th>
        <th colspan="2">
            选择题<span class="red">${x}</span>
            填空题<span class="red">${t}</span>
            简答题<span class="red">${j}</span>
            编程题<span class="red">${b}</span>
        </th>
        <th colspan="4"></th>
        <th>总分</th>
        <th><span class="red">${score}</span></th>
        <th colspan="2"></th>
    </tr>
</table>
<div class="preview">
    <c:forEach var="test" items="${sessionScope.paper.tests}">
        <c:if test="${test.type eq 'x'}">
            <p class="x">${test.question} (${test.score}分)</p>
            <p class="option">A. ${test.optionA} <input type="radio" name=""></p>
            <p class="option">B. ${test.optionB} <input type="radio" name=""></p>
            <p class="option">C. ${test.optionC} <input type="radio" name=""></p>
            <p class="option">D. ${test.optionD} <input type="radio" name=""></p>
        </c:if>
        <c:if test="${test.type eq 't'}">
            <p class="t">${test.question} (${test.score}分)</p>
        </c:if>
        <c:if test="${test.type eq 'j'}">
            <p class="j">${test.question} (${test.score}分)</p>
            <textarea name=""></textarea>
        </c:if>
        <c:if test="${test.type eq 'b'}">
            <p class="b">${test.question} (${test.score}分)</p>
            <label for="" class="red">上传程序文件</label>
            <input type="file" name="" id="">
        </c:if>
    </c:forEach>
</div>
<button id="show">表格展开</button>
<button class="preview">显示预览</button>
<hr>
<form action="${ctx}/test/create" method="post">
    <label for="type">题型</label>
    <select id="type" name="type">
        <option value="x">选择题</option>
        <option value="t">填空题</option>
        <option value="j">简答题</option>
        <option value="b">编程题</option>
    </select>
    <label for="score">分数</label>
    <input id="score" type="text" name="score"><br>
    <label for="question">题目</label>
    <span id="question_hint">使用 ### 来表示填空位</span>
    <textarea id="question" name="question"></textarea><br>
    <div id="options">
        <label for="optionA">选项A</label>
        <input id="optionA" type="text" name="optionA"><br>
        <label for="optionB">选项B</label>
        <input id="optionB" type="text" name="optionB"><br>
        <label for="optionC">选项C</label>
        <input id="optionC" type="text" name="optionC"><br>
        <label for="optionD">选项D</label>
        <input id="optionD" type="text" name="optionD"><br>
    </div>
    <div id="answers">
        <label for="answer">答案</label>
        <textarea id="answer" name="answer"></textarea><br>
    </div>
    <input type="submit" value="添加试题">
</form>
</body>
</html>
