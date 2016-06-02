<!DOCTYPE html>
<%@ page pageEncoding="UTF-8" %>
<%@ include file="/common/inc.jsp" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>编辑考试信息 - 在线考试</title>
    <script src="${ctx}/static/js/jquery-1.12.3.min.js"></script>
    <script>
        $(function () {
            $.each($('option'), function () {
                if ($(this).attr('value') == $('select').attr('title')) {
                    $(this).attr('selected', 'selected');
                }
            });
        });
    </script>
</head>
<body>
<h1>编辑考试信息</h1>
<form action="${ctx}/classpaper/modify" method="post">
    <input type="hidden" name="id" value="${sessionScope.classpaper.id}">
    <input type="hidden" name="classId" value="${sessionScope.classpaper.classId}">
    <input type="hidden" name="paperId" value="${sessionScope.classpaper.paperId}">
    <input type="hidden" name="assistantId" value="${sessionScope.classpaper.assistantId}">
    <label for="time">考试时间</label>
    <input id="time" name="time" value="${sessionScope.classpaper.time}"><br>
    <label for="status">考试状态</label>
    <select id="status" name="status" title="${sessionScope.classpaper.status}">
        <option value="0">未考试</option>
        <option value="1">考试中</option>
        <option value="2">考试完成</option>
        <option value="3">判分完成</option>
    </select>
    <br>
    <input type="submit" value="保存">
</form>
</body>
</html>