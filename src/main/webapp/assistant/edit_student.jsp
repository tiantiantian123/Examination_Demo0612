<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/inc.jsp" %>
<html>
<head>
    <title>学生管理 - 在线考试</title>
    <link rel="stylesheet" href="${ctx}/static/css/style.css">
</head>
<body>
<c:if test="${sessionScope.assistant eq null}">
    <c:redirect url="/assistant/index.jsp"/>
</c:if>
<h1>学生管理</h1>
当前教务：${sessionScope.assistant.username}
<hr>
<div style="text-align: center">
    <p>${sessionScope.aClass.name}</p>
    <p>${sessionScope.aClass.startDate} - ${sessionScope.aClass.finishDate}</p>
</div>
<table border="1">
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
    </tr>
    <c:forEach var="student" items="${sessionScope.aClass.students}" varStatus="vs">
        <tr>
            <td>${vs.count}</td>
            <td>${student.username}</td>
            <td>${student.gender}</td>
            <td>${student.email}</td>
            <td>${student.dob}</td>
            <td>${student.tel}</td>
            <td>${student.education}</td>
            <td>${student.major}</td>
            <td>${student.academy}</td>
            <td>${student.graduation}</td>
            <td>${student.training}</td>
            <td>${student.experience}</td>
            <td>${student.photo}</td>
            <td>${student.remark}</td>
            <td>${student.lastIp} - ${student.ip.address}</td>
            <td><fmt:formatDate value="${student.lastLogin}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
