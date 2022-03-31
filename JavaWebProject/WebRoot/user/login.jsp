<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>房屋租赁系统</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
<form action="login.do" method="post" onsubmit="return checkCode()">
    <h1>登录页面</h1>
    用户名：<input type="text" name="username">
    </br></br>

    密码：<input type="password" name="password">
    </br></br>

    验证码：<input type="text" id="txt_code" name="code" size="5">
    <img alt="验证码" id="code" src="/getcode">
    <a href="javascript:flushInamge();">看不清？</a>
    <span id="s_code"></span>
    </br></br>

    <input type="submit" value="登录">
    <a href="register.jsp"><input type="button" value="注册"></a>
</form>

<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.min.js"></script>
<script type="text/javascript" src="js/messages_zh.js"></script>
<script type="text/javascript" src="js/md5.js"></script>
<script type="text/javascript">
    function flushInamge(){
        $("#code").attr("src","/getcode?r"+Math.random());//实现局部刷新

    }

    function checkCode(){
        var check = true;
        //获取用户输入的验证码信息
        var code = $("#txt_code").val().trim();
        if(code == ''){
            $("#s_code").html("验证码不能为空");
            return false;
        }

        //验证码不为空就进行校验
        $.ajax({
            url:"checked.do",
            type:"post",
            async:false,
            data:{"code":code},
            dataType:"text",
            success:function(data){//data是服务器返回的消息
                $("#s_code").html(data);
                if(data == '验证码错误'){check = false;}
            }
        })
        return check;
    }

</script>
</body>
</html>