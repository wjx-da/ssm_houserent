<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>房屋租赁系统</title>
</head>
<body>
<script type="text/javascript" src="${pageContext.request.contextPath}/user/js/background.js"></script>
<div align="center">
<form action="/frontLogin" method="post" onsubmit="return check_form(this)">
            <h1>登录页面</h1>
            用户名：<input type="text" id="username" name="username">
            <span id="s_username"></span>
            </br></br>
            密码：<input type="password" id="password" name="password">
            <span id="s_password"></span>
            </br></br>
            验证码：<input type="text" id="verification" name="verification" size="5">
            <img alt="验证码" id="code" src="/getcode">
            <span id="s_code"></span>
            </br></br>
            <input type="submit" value="登录">
            <a href="register.jsp"><input type="button" value="注册"></a>
</form>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/user/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/user/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/user/js/messages_zh.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/user/js/md5.js"></script>
<script type="text/javascript">
        document.getElementById("code").onclick = function() {
            document.getElementById("code").src = "/getcode?time=" + new Date().getTime();
        }
        function check_form(form) {
            if (form.username.value === "") {
                alert("用户名为空")
                form.username.focus();
                return false;
            }
            if (form.password.value === "") {
                alert("密码为空")
                form.password.focus();
                return false;
            }
            if (form.verification.value === "") {
                alert("验证码为空")
                form.verification.focus();
                return false;
            }
            return true;
        }

</script>
</body>
</html>