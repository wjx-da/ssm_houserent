<%@ page language="java" import="java.util.*"  contentType="text/html;charset=UTF-8"%> 
<%@ page import="com.chengxusheji.po.UserInfo" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    UserInfo userInfo = (UserInfo)request.getAttribute("userInfo");

%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
  <TITLE>修改用户信息信息</TITLE>
  <link href="<%=basePath %>plugins/bootstrap.css" rel="stylesheet">
  <link href="<%=basePath %>plugins/bootstrap-dashen.css" rel="stylesheet">
  <link href="<%=basePath %>plugins/font-awesome.css" rel="stylesheet">
  <link href="<%=basePath %>plugins/animate.css" rel="stylesheet"> 
</head>
<body style="margin-top:70px;"> 
<div class="container">
<jsp:include page="../header.jsp"></jsp:include>
	<div class="col-md-9 wow fadeInLeft">
	<ul class="breadcrumb">
  		<li><a href="<%=basePath %>index.jsp">首页</a></li>
  		<li class="active">用户信息信息修改</li>
	</ul>
		<div class="row"> 
      	<form class="form-horizontal" name="userInfoEditForm" id="userInfoEditForm" enctype="multipart/form-data" method="post"  class="mar_t15">
		  <div class="form-group">
			 <label for="userInfo_user_name_edit" class="col-md-3 text-right">用户名:</label>
			 <div class="col-md-9">
			 	<input type="text" id="userInfo_user_name_edit" name="userInfo.user_name" class="form-control" placeholder="请输入用户名" readOnly>
			 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="userInfo_password_edit" class="col-md-3 text-right">密码:</label>
		  	 <div class="col-md-9">
			    <input type="text" id="userInfo_password_edit" name="userInfo.password" class="form-control" placeholder="请输入密码">
			 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="userInfo_realName_edit" class="col-md-3 text-right">姓名:</label>
		  	 <div class="col-md-9">
			    <input type="text" id="userInfo_realName_edit" name="userInfo.realName" class="form-control" placeholder="请输入姓名">
			 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="userInfo_sex_edit" class="col-md-3 text-right">性别:</label>
		  	 <div class="col-md-9">
			    <input type="text" id="userInfo_sex_edit" name="userInfo.sex" class="form-control" placeholder="请输入性别">
			 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="userInfo_birthday_edit" class="col-md-3 text-right">出生日期:</label>
		  	 <div class="col-md-9">
                <div class="input-group date userInfo_birthday_edit col-md-12" data-link-field="userInfo_birthday_edit" data-link-format="yyyy-mm-dd">
                    <input class="form-control" id="userInfo_birthday_edit" name="userInfo.birthday" size="16" type="text" value="" placeholder="请选择出生日期" readonly>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
		  	 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="userInfo_cardNumber_edit" class="col-md-3 text-right">身份证:</label>
		  	 <div class="col-md-9">
			    <input type="text" id="userInfo_cardNumber_edit" name="userInfo.cardNumber" class="form-control" placeholder="请输入身份证">
			 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="userInfo_city_edit" class="col-md-3 text-right">籍贯:</label>
		  	 <div class="col-md-9">
			    <input type="text" id="userInfo_city_edit" name="userInfo.city" class="form-control" placeholder="请输入籍贯">
			 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="userInfo_photo_edit" class="col-md-3 text-right">照片:</label>
		  	 <div class="col-md-9">
			    <img  class="img-responsive" id="userInfo_photoImg" border="0px"/><br/>
			    <input type="hidden" id="userInfo_photo" name="userInfo.photo"/>
			    <input id="photoFile" name="photoFile" type="file" size="50" />
		  	 </div>
		  </div>
		  <div class="form-group">
		  	 <label for="userInfo_address_edit" class="col-md-3 text-right">家庭地址:</label>
		  	 <div class="col-md-9">
			    <input type="text" id="userInfo_address_edit" name="userInfo.address" class="form-control" placeholder="请输入家庭地址">
			 </div>
		  </div>
			<div class="form-group">
				<label for="userInfo_email_edit" class="col-md-3 text-right">电子邮件:</label>
				<div class="col-md-9">
					<input type="text" id="userInfo_email_edit" name="userInfo.email" class="form-control" placeholder="请输入电子邮件">
				</div>
			</div>
			<div class="form-group">
				<label for="userInfo_telephone_edit" class="col-md-3 text-right">手机号:</label>
				<div class="col-md-9">
					<input type="text" id="userInfo_telephone_edit" name="userInfo.telephone" class="form-control" placeholder="请输入手机号">
				</div>
			</div>
			<div class="form-group">
				<label for="userInfo_price_edit" class="col-md-3 text-right">预期租金:</label>
				<div class="col-md-9">
					<input type="text" id="userInfo_price_edit" name="userInfo.price" class="form-control" placeholder="请输入预期租金件">
				</div>
			</div>
			  <div class="form-group">
			  	<span class="col-md-3"></span>
			  	<span onclick="ajaxUserInfoModify();" class="btn btn-primary bottom5 top5">修改</span>
			  </div>
		</form> 
	    <style>#userInfoEditForm .form-group {margin-bottom:5px;}  </style>
      </div>
   </div>
</div>


<jsp:include page="../footer.jsp"></jsp:include>
<script src="<%=basePath %>plugins/jquery.min.js"></script>
<script src="<%=basePath %>plugins/bootstrap.js"></script>
<script src="<%=basePath %>plugins/wow.min.js"></script>
<script src="<%=basePath %>plugins/bootstrap-datetimepicker.min.js"></script>
<script src="<%=basePath %>plugins/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript" src="<%=basePath %>js/jsdate.js"></script>
<script>
var basePath = "<%=basePath%>";
/*弹出修改用户信息界面并初始化数据*/
function userInfoEdit(user_name) {
	$.ajax({
		url :  basePath + "UserInfo/" + user_name + "/update",
		type : "get",
		dataType: "json",
		success : function (userInfo, response, status) {
			if (userInfo) {
				$("#userInfo_user_name_edit").val(userInfo.user_name);
				$("#userInfo_password_edit").val(userInfo.password);
				$("#userInfo_realName_edit").val(userInfo.realName);
				$("#userInfo_sex_edit").val(userInfo.sex);
				$("#userInfo_birthday_edit").val(userInfo.birthday);
				$("#userInfo_cardNumber_edit").val(userInfo.cardNumber);
				$("#userInfo_city_edit").val(userInfo.city);
				$("#userInfo_photo").val(userInfo.photo);
				$("#userInfo_photoImg").attr("src", basePath +　userInfo.photo);
				$("#userInfo_address_edit").val(userInfo.address);
				$("#userInfo_email_edit").val(userInfo.email);
				$("#userInfo_telephone_edit").val(userInfo.telephone);
				$("#userInfo_price_edit").val(userInfo.price);
			} else {
				alert("获取信息失败！");
			}
		}
	});
}

/*ajax方式提交用户信息信息表单给服务器端修改*/
function ajaxUserInfoModify() {
	$.ajax({
		url :  basePath + "UserInfo/" + $("#userInfo_user_name_edit").val() + "/update",
		type : "post",
		dataType: "json",
		data: new FormData($("#userInfoEditForm")[0]),
		success : function (obj, response, status) {
            if(obj.success){
                alert("信息修改成功！");
                location.reload(true);
                $("#userInfoQueryForm").submit();
            }else{
                alert(obj.message);
            } 
		},
		processData: false,
		contentType: false,
	});
}

$(function(){
        /*小屏幕导航点击关闭菜单*/
        $('.navbar-collapse a').click(function(){
            $('.navbar-collapse').collapse('hide');
        });
        new WOW().init();
    /*出生日期组件*/
    $('.userInfo_birthday_edit').datetimepicker({
    	language:  'zh-CN',  //语言
    	format: 'yyyy-mm-dd',
    	minView: 2,
    	weekStart: 1,
    	todayBtn:  1,
    	autoclose: 1,
    	minuteStep: 1,
    	todayHighlight: 1,
    	startView: 2,
    	forceParse: 0
    });
    userInfoEdit("<%=session.getAttribute("user_name")%>");
 })
 </script> 
</body>
</html>

