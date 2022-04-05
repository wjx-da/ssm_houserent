<%@ page import="com.chengxusheji.po.WantHourseInfo" %>
<%@ page import="com.chengxusheji.po.Hourse" %>
<%@ page import="com.chengxusheji.po.UserInfo" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    WantHourseInfo wantHourseInfo = (WantHourseInfo) request.getAttribute("wantHourseInfo");
    UserInfo userInfo = (UserInfo) request.getAttribute("user_rent");
%>
<html>
<head>
    <title>添加合同信息：</title>
    <link rel="stylesheet" type="text/css" href="house/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="house/css/main.css"/>
    <script type="text/javascript" src="house/js/libs/modernizr.min.js"></script>
    <script type="text/javascript" src="house/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="house/js/jquery-ui-datepicker.js"></script>
    <script type="text/javascript" src="house/js/jquery.validate.min.js"></script>
    <link rel="stylesheet" type="text/css" href="house/css/jquery-ui.css"/>
</head>
<body>
<script language="javascript" type="text/javascript" src="${pageContext.request.contextPath}/user/My97DatePicker/WdatePicker.js"></script>
<form action="/Rent/addRent" method="post" >
<input type="text" id="wantHourseInfo" name="wantHourseInfoId" class="form-control" value="<%=wantHourseInfo.getWantHourseId()%>" readonly></br>
<input type="text" id="hourse" name="hourseId" class="form-control"value="<%=wantHourseInfo.getHourseId()%>" readonly></br>
<input type="text" id="userInfo" name="userName" class="form-control" value="<%=userInfo.getUser_name()%>" readonly></br>
<input type="text" id="starttime" name="starttime" class="form-control" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" placeholder="请输入用户名"></br>

<input type="text" id="endtime" name="endtime" class="form-control"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" placeholder="请输入用户名"></br>
<input type="text" id="rentprice" name="rentprice" class="form-control" placeholder="请输入租价"></br>
    <button type="submit"  value="提交合同信息"> 提交合同信息</button>
</form>
<input class="btn btn6" onclick="history.go(-1)" value="返回" type="button">
</body>
</html>
