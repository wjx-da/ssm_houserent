<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>用户注册</title>
    <link rel="stylesheet" href="css/register.css">
    <style>
        .lrcon .lrbox {
            background: url("images/jkf_imgs/loginbeijing.png");
        }
        .lrcon {
            background: url("images/jkf_imgs/qianchengwuyou.png") no-repeat;
        }
    </style>
</head>
<body>
<jsp:include page="../navigate.jsp"/>

<div class="lrcon">
    <div class="lrbox">
        <!--左边栏-->
        <div class="describes">
            <div class="des-c" id="des-c-1">
                <img src="images/jkf_imgs/pen.svg" alt="">
                <div class="des-cn">
                    <p class="des-cn-p">便捷的简历填写</p>
                    <div class="des-cn-div">一份简历开启未来</div>
                </div>
            </div>
            <div class="des-c">
                <img src="images/jkf_imgs/search.svg" alt="">
                <div class="des-cn">
                    <p class="des-cn-p">海量的职位优选</p>
                    <div class="des-cn-div">360行任你挑选</div>
                </div>
            </div>
            <div class="des-c">
                <img src="images/jkf_imgs/lightning.svg" alt="">
                <div class="des-cn">
                    <p class="des-cn-p">快速的只为投递</p>
                    <div class="des-cn-div">分秒必争直达HR</div>
                </div>
            </div>
            <div class="des-c">
                <img src="images/jkf_imgs/letter.svg" alt="">
                <div class="des-cn">
                    <p class="des-cn-p">高效的投递反馈</p>
                    <div class="des-cn-div">谁看我的简历早知道</div>
                </div>
            </div>
        </div>
        <!--右边栏-->
        <div class="listInfo">
            <div class="lr-h">
                <a href="" class="choose">手机注册</a>
                <a href="login.jsp">前往登录</a>
            </div>
            <form id="signup">
                <div>
                    <label for="username">用户名</label>
                    <span id="sp7"></span>
                </div>
                <div>
                    <input type="text" maxlength="19" class="ipt1" id="username" name="custName"
                           placeholder="请输入用户名">
                </div>
                <div>
                    <label for="phoneIpt">手机号码</label>
                    <span id="sp1"></span>
                </div>
                <div>
                    <input type="text" maxlength="19" class="ipt1" id="phoneIpt" name="custTelno"
                           placeholder="请输入手机号">
                </div>
                <div>
                    <label for="passwordIpt">密码</label>
                    <span id="sp3"></span>
                </div>
                <div>
                    <input type="password" class="ipt1" maxlength="16" id="passwordIpt" name="custPassword"
                           placeholder="可以包含数字、字母以及下划线，6-16位">
                </div>
                <div>
                    <label for="rePwdIpt">确认密码</label>
                    <span id="sp4"></span>
                </div>
                <div>
                    <input type="password" class="ipt1" maxlength="16" id="rePwdIpt"
                           placeholder="请确认密码">
                </div>
                <div>
                    <label for="codeIpt">短信验证码</label>
                    <span id="sp2"></span>
                </div>
                <div>
                    <input type="text" class="ipt2" maxlength="6" id="codeIpt"
                           placeholder="请输入验证码">
                    <button type="button" class="btn" id="sendCodeBtn">发送验证码</button>
                </div>
                <div>
                    <span id="registerMsg"></span>
                    <button type="button" class="btn" id="registerBtn" disabled>注册</button>
                </div>
                <div>
                    <span id="registerMsg1"></span>
                    <button type="button" class="btn" id="registerBtn1" disabled>hr注册</button>
                </div>
            </form>
        </div>
    </div>
    <img class="lr-bm" src="images/jkf_imgs/bm.png" alt="">
</div>


<script src="js1/javaScript.form.js"></script>
<script src="js1/register.js"></script>
</body>
