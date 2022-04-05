<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>用户注册</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/user/css/register.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/user/css/userInfo.css" />
    <style>
        .lrcon .lrbox {
            background: url("${pageContext.request.contextPath}/user/images/jkf_imgs/loginbeijing.png");
        }
        .lrcon {
            background: url("${pageContext.request.contextPath}/user/images/jkf_imgs/qianchengwuyou.png") no-repeat;
        }
    </style>
</head>
<body>
<jsp:include page="navigate.jsp"></jsp:include>
<script language="javascript" type="text/javascript" src="${pageContext.request.contextPath}/user/My97DatePicker/WdatePicker.js"></script>
<div class="lrcon">
    <div class="lrbox">
        <!--左边栏-->
        <div class="describes">
            <div class="des-c" id="des-c-1">
                <img src="${pageContext.request.contextPath}/user/images/jkf_imgs/pen.svg" alt="">
                <div class="des-cn">
                    <p class="des-cn-p">装修豪华</p>
                    <div class="des-cn-div">家具家电一应俱全</div>
                </div>
            </div>
            <div class="des-c">
                <img src="${pageContext.request.contextPath}/user/images/jkf_imgs/search.svg" alt="">
                <div class="des-cn">
                    <p class="des-cn-p">高档的小区房</p>
                    <div class="des-cn-div">环境极好，生活配套设施齐全</div>
                </div>
            </div>
            <div class="des-c">
                <img src="${pageContext.request.contextPath}/user/images/jkf_imgs/lightning.svg" alt="">
                <div class="des-cn">
                    <p class="des-cn-p">多人合租</p>
                    <div class="des-cn-div">经济实惠</div>
                </div>
            </div>
            <div class="des-c">
                <img src="${pageContext.request.contextPath}/user/images/jkf_imgs/letter.svg" alt="">
                <div class="des-cn">
                    <p class="des-cn-p">多种类型</p>
                    <div class="des-cn-div">任你挑选</div>
                </div>
            </div>
        </div>
        <!--右边栏-->
        <div class="listInfo">
            <div class="lr-h">
                <a href="" class="choose">手机注册</a>
                <a href="login.jsp">前往登录</a>
            </div>
            <form id="signup" method="post" action="/UserInfo/addUser" enctype="multipart/form-data">
                <div>
                    <label for="username">用户名</label>
                    <span id="sp1"></span>
                </div>
                <div>
                    <input type="text" maxlength="19" class="ipt1" id="username" name="user_name"
                           placeholder="请输入用户名">
                </div>
                <div>
                    <label for="realName">用户名</label>
                    <span id="sp11"></span>
                </div>
                <div>
                    <input type="text" maxlength="19" class="ipt1" id="realName" name="realName"
                           placeholder="请输入用户名">
                </div>
                <div>
                    <label for="phoneIpt">邮箱</label>
                    <span id="sp2"></span>
                </div>
                <div>
                    <input type="text" maxlength="19" class="ipt1" id="phoneIpt" name="email"
                           placeholder="请输入邮箱">
                </div>
                <div>
                    <label for="passwordIpt">密码</label>
                    <span id="sp3"></span>
                </div>
                <div>
                    <input type="password" class="ipt1" maxlength="16" id="passwordIpt" name="password"
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
                    <div>
                        <label for="userInfo_birthday">请选择出生日期</label>
                        <span id="sp5"></span>
                    </div>
                    ：<input type="text" id="userInfo_birthday" name="birthday" id="qwe" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})"/></br>

                </div>
                <div>
                    <label for="userInfo_cardNumber">身份证:</label>
                    <span id="sp6" class="label"></span>
                </div>
                <div>
                    <input type="text" class="ipt1" id="userInfo_cardNumber" name="cardNumber"
                           placeholder="请输入身份证">
                </div>
                <div>
                    <label for="userInfo_city">籍贯:</label>
                    <span id="sp7" class="label"></span>
                </div>
                <div>
                    <input type="text" class="ipt1" id="userInfo_city" name="city"
                           placeholder="请输入籍贯">
                </div>
                <div>
                    <label for="photoFile">照片:</label>
                    <span id="sp8" class="label"></span>
                </div>
                <div>
                    <input id="photoFile" name="photoFile" type="file" size="50" />
                </div>
                <div>
                    <label for="userInfo_telephone">联系电话:</label>
                    <span id="sp9" class="label"></span>
                </div>
                <div>
                    <input class="ipt1" type="text" id="userInfo_telephone" name="telephone" placeholder="请输入联系电话"/>
                </div>
                <div>
                    <label for="userInfo_price">期望租金:</label>
                    <span id="sp19" class="label"></span>
                </div>
                <div>
                    <input class="ipt1" type="text" id="userInfo_price" name="price" placeholder="请输入期望租金"/>
                </div>
                <div>
                    <label for="userInfo_address">家庭地址:</label>
                    <span id="sp29" class="label"></span>
                </div>
                <div>
                    <input class="ipt1" type="text" id="userInfo_address" name="address" placeholder="请输入家庭地址"/>
                </div>
                <div>
                    性别<input type="radio" name="sex" value="男" checked="checked">男
                     <input type="radio" name="sex" value="女">女<br>
                     <!--value是action传递走的值，下同 -->
                </div>
                <div>
                    <label for="codeIpt">短信验证码</label>
                    <span id="sp10"></span>
                </div>
                <div>
                    <input type="text" class="ipt2" maxlength="6" id="codeIpt" name="code"
                           placeholder="请输入验证码">
                    <button type="button" class="btn" id="sendCodeBtn">发送验证码</button>
                </div>
                <div>
                    <span id="registerMsg"></span>
                    <button type="submit" class="btn" id="registerBtn" disabled>注册</button>
                </div>
            </form>
        </div>
    </div>
    <img class="lr-bm" src="${pageContext.request.contextPath}/user/images/jkf_imgs/bm.png" alt="">
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/user/js/javaScript.form.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/user/js/register.js"></script>
<script type="text/javascript">
    let registerMsg = document.querySelector("#registerMsg");// 注册失败消息提示框
    var msg = '<%=request.getAttribute("msg")%>';
    if(msg !=='null'){
        registerMsg.innerHTML =msg;
    }
</script>
</body>
</html>