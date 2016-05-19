<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/inc.jsp" %>
<html>
<head>
    <title>学生注册 - 在线考试</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${ctx}/static/bootstrap/css/bootstrap.min.css">
    <script src="${ctx}/static/js/jquery-1.12.3.min.js"></script>
    <script src="${ctx}/static/bootstrap/js/bootstrap.min.js"></script>
    <script src="${ctx}/static/bootstrap/js/bootstrap.file-input.js"></script>
    <script>
        $(function () {
            $('input[type=file]').bootstrapFileInput();
        });
    </script>
</head>
<body>
<div class="container">
    <div class="jumbotron">
        <h1 class="text-center">学生注册</h1>
    </div>
    <form class="well form-horizontal" action="${ctx}/student" method="post">
        <input type="hidden" name="action" value="create">
        <div class="form-group">

            <label class="control-label col-sm-2" for="classId">班级</label>
            <div class="col-sm-4">
                <select class="form-control" id="classId" name="classId">
                    <c:forEach var="aClass" items="${sessionScope.classes}">
                        <option value="${aClass.id}">${aClass.name}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="email">邮箱</label>
            <div class="col-sm-4">
                <input class="form-control" id="email" type="text" name="email">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="password">密码</label>
            <div class="col-sm-4">
                <input class="form-control" id="password" type="password" name="password">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="username">姓名</label>
            <div class="col-sm-4">
                <input class="form-control" id="username" type="text" name="username">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2">性别</label>
            <div class="col-sm-4">
                <label class="radio-inline"><input type="radio" name="gender" value="男" checked="checked">男</label>
                <label class="radio-inline"><input type="radio" name="gender" value="女">女</label>
            </div>
        </div>
        <div class="form-group">

            <label class="control-label col-sm-2" for="dob">出生日期</label>
            <div class="col-sm-4">
                <input class="form-control" id="dob" type="date" name="dob">
            </div>
        </div>
        <div class="form-group">

            <label class="control-label col-sm-2" for="tel">电话</label>
            <div class="col-sm-4">
                <input class="form-control" id="tel" type="text" name="tel">
            </div>
        </div>
        <div class="form-group">

            <label class="control-label col-sm-2" for="education">学历</label>
            <div class="col-sm-4">
                <input class="form-control" id="education" type="text" name="education">
            </div>
        </div>
        <div class="form-group">

            <label class="control-label col-sm-2" for="major">专业</label>
            <div class="col-sm-4">
                <input class="form-control" id="major" type="text" name="major">
            </div>
        </div>
        <div class="form-group">

            <label class="control-label col-sm-2" for="academy">毕业院校</label>
            <div class="col-sm-4">
                <input class="form-control" id="academy" type="text" name="academy">
            </div>
        </div>
        <div class="form-group">

            <label class="control-label col-sm-2" for="graduation">毕业日期</label>
            <div class="col-sm-4">
                <input class="form-control" id="graduation" type="date" name="graduation">
            </div>
        </div>
        <div class="form-group">

            <label class="control-label col-sm-2" for="training">培训经历</label>
            <div class="col-sm-4">
                <textarea class="form-control" id="training" name="training"></textarea>
            </div>
        </div>
        <div class="form-group">

            <label class="control-label col-sm-2" for="experience">工作经验</label>
            <div class="col-sm-4">
                <textarea class="form-control" id="experience" name="experience"></textarea>
            </div>
        </div>
        <div class="form-group">

            <label class="control-label col-sm-2" for="remark">备注</label>
            <div class="col-sm-4">
                <textarea class="form-control" id="remark" name="remark"></textarea>
            </div>
        </div>
        <div class="form-group">

            <label class="control-label col-sm-2" for="photo">照片</label>
            <div class="col-sm-4">
                <input class="form-control btn-primary" id="photo" type="file" name="photo" title="选择一张照片">
            </div>
        </div>
        <div class="form-group">

            <div class="col-sm-offset-2 col-sm-4">
                <button type="submit" class="btn btn-group-lg btn-success">注册</button>
            </div>
        </div>
    </form>
</div>
</body>
</html>
