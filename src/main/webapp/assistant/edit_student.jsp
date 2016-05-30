<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/inc.jsp" %>
<html>
<head>
    <title>学生管理 - 在线考试</title>
    <link rel="stylesheet" href="${ctx}/static/css/style.css">
    <script src="${ctx}/static/js/jquery-1.12.3.min.js"></script>
    <script>
        $(function () {
            var table = $('table');
            $('#show').click(function () {
                table.toggleClass('fix');
                $(this).text(table.css('table-layout')=='fixed'?'表格展开':'表格收起');
            });
        });
    </script>
</head>
<body>
<c:if test="${sessionScope.assistant eq null}">
    <c:redirect url="/assistant/index.jsp"/>
</c:if>
<h1>学生管理</h1>
当前教务：${sessionScope.assistant.username}
<hr>
<div style="text-align: center">
    <p>${sessionScope.aClass.title}</p>
    <p>${sessionScope.aClass.startDate} - ${sessionScope.aClass.finishDate}</p>
</div>
<table class="fix" border="1">
    <tr>
        <th>序号</th>
        <th>姓名</th>
        <th>性别</th>
        <th>邮箱</th>
        <th>出生日期</th>
        <th>手机</th>
        <th>学历</th>
        <th>专业</th>
        <th>毕业院校</th>
        <th>毕业日期</th>
        <th>培训经历</th>
        <th>工作经验</th>
        <th>照片</th>
        <th>备注</th>
        <th>最后登录地点</th>
        <th>最后登录时间</th>
        <th colspan="2">操作</th>
    </tr>
    <c:forEach var="student" items="${sessionScope.aClass.students}" varStatus="vs">
        <tr>
            <td title="${vs.count}">${vs.count}</td>
            <td title="${student.username}">${student.username}</td>
            <td title="${student.gender}">${student.gender}</td>
            <td title="${student.email}"><a href="mailto:${student.email}">${student.email}</a></td>
            <td title="${student.dob}">${student.dob}</td>
            <td title="${student.tel}">${student.tel}</td>
            <td title="${student.education}">${student.education}</td>
            <td title="${student.major}">${student.major}</td>
            <td title="${student.academy}">${student.academy}</td>
            <td title="${student.graduation}">${student.graduation}</td>
            <td title="${student.training}">${student.training}</td>
            <td title="${student.experience}">${student.experience}</td>
            <td title="${student.photo}">${student.photo}</td>
            <td title="${student.remark}">${student.remark}</td>
            <td title="${student.ip.address}">${student.ip.address}</td>
            <td title="<fmt:formatDate value="${student.lastLogin}" pattern="yyyy-MM-dd HH:mm:ss"/>"><fmt:formatDate
                    value="${student.lastLogin}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <td><a href="">编辑</a></td>
            <td><a href="">删除</a></td>
        </tr>
    </c:forEach>
</table>
<button id="show">表格展开</button>
</body>
</html>
