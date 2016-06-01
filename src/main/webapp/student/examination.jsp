<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/inc.jsp" %>
<html>
<head>
    <title>学生考试 - 在线考试</title>
    <link rel="stylesheet" href="${ctx}/static/css/style.css">
    <script src="${ctx}/static/js/jquery-1.12.3.min.js"></script>
    <script>
        $(function () {
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
<c:if test="${sessionScope.student eq null}">
    <c:redirect url="/index.jsp"/>
</c:if>
<h1>学生考试</h1>
当前学生：${sessionScope.student.username}
<p class="title">${sessionScope.paper.course.title}考试 试卷</p>
<p class="time">考试时间：<span class="red">${sessionScope.paper.time}</span> 分钟</p>
<div class="paper">
    <c:forEach var="test" items="${sessionScope.paper.tests}">
        <c:if test="${test.type eq 'x'}">
            <p class="x">${test.question} (${test.score}分)</p>
            <p class="option"><input type="radio" name="${test.id}"> A. ${test.optionA}</p>
            <p class="option"><input type="radio" name="${test.id}"> B. ${test.optionB}</p>
            <p class="option"><input type="radio" name="${test.id}"> C. ${test.optionC}</p>
            <p class="option"><input type="radio" name="${test.id}"> D. ${test.optionD}</p>
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
</body>
</html>
