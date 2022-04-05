<%@ page language="java" import="java.util.*"  contentType="text/html;charset=UTF-8"%>
<%@ page import="com.chengxusheji.po.*" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    //获取所有的buildingObj信息
    List<BuildingInfo> buildingInfoList = (List<BuildingInfo>)request.getAttribute("buildingInfoList");
    //获取所有的hourseTypeObj信息
    List<HourseType> hourseTypeList = (List<HourseType>)request.getAttribute("hourseTypeList");
    //获取所有的priceRangeObj信息
    List<PriceRange> priceRangeList = (List<PriceRange>)request.getAttribute("priceRangeList");
    Hourse hourse = (Hourse)request.getAttribute("hourse");
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
  <TITLE>查看房屋信息详情</TITLE>
  <link href="<%=basePath %>plugins/bootstrap.css" rel="stylesheet">
  <link href="<%=basePath %>plugins/bootstrap-dashen.css" rel="stylesheet">
  <link href="<%=basePath %>plugins/font-awesome.css" rel="stylesheet">
  <link href="<%=basePath %>plugins/animate.css" rel="stylesheet"> 
</head>
<body style="margin-top:70px;"> 
<jsp:include page="../header.jsp"></jsp:include>
<div class="container">
	<ul class="breadcrumb">
  		<li><a href="<%=basePath %>index.jsp">首页</a></li>
  		<li><a href="<%=basePath %>Hourse/frontlist">房屋信息信息</a></li>
  		<li class="active">详情查看</li>
	</ul>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">房屋编号:</div>
		<div class="col-md-10 col-xs-6"><%=hourse.getHourseId()%></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">房屋名称:</div>
		<div class="col-md-10 col-xs-6"><%=hourse.getHourseName()%></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">所在楼盘:</div>
		<div class="col-md-10 col-xs-6"><%=hourse.getBuildingObj().getBuildingName() %></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">房屋图片:</div>
		<div class="col-md-10 col-xs-6"><img class="img-responsive" src="<%=basePath %><%=hourse.getHousePhoto() %>"  border="0px"/></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">房屋类型:</div>
		<div class="col-md-10 col-xs-6"><%=hourse.getHourseTypeObj().getTypeName() %></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">价格范围:</div>
		<div class="col-md-10 col-xs-6"><%=hourse.getPriceRangeObj().getPriceName() %></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">面积:</div>
		<div class="col-md-10 col-xs-6"><%=hourse.getArea()%></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">租金(元/月):</div>
		<div class="col-md-10 col-xs-6"><%=hourse.getPrice()%></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">楼层/总楼层:</div>
		<div class="col-md-10 col-xs-6"><%=hourse.getLouceng()%></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">装修:</div>
		<div class="col-md-10 col-xs-6"><%=hourse.getZhuangxiu()%></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">朝向:</div>
		<div class="col-md-10 col-xs-6"><%=hourse.getCaoxiang()%></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">建筑年代:</div>
		<div class="col-md-10 col-xs-6"><%=hourse.getMadeYear()%></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">联系人:</div>
		<div class="col-md-10 col-xs-6"><%=hourse.getConnectPerson()%></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">联系电话:</div>
		<div class="col-md-10 col-xs-6"><%=hourse.getConnectPhone()%></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">详细信息:</div>
		<div class="col-md-10 col-xs-6"><%=hourse.getDetail()%></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">地址:</div>
		<div class="col-md-10 col-xs-6"><%=hourse.getAddress()%></div>
	</div>
	<div class="row bottom15">
		<div class="col-md-2 col-xs-4"></div>
		<div class="col-md-6 col-xs-6">
			<button onclick="history.back();" class="btn btn-primary">返回</button>
		</div>
	</div>
	<div class="row bottom15">
		<div class="col-md-2 col-xs-4"></div>
		<div class="col-md-6 col-xs-6" id="test">

		</div>
	</div>
</div> 
<jsp:include page="../footer.jsp"></jsp:include>
<script src="<%=basePath %>plugins/jquery.min.js"></script>
<script src="<%=basePath %>plugins/bootstrap.js"></script>
<script src="<%=basePath %>plugins/wow.min.js"></script>
<script>
	var msg = "<%=request.getAttribute("msg")%>";
	if(msg !== 'null'){
		document.getElementById("test").innerHTML = msg;
	}
	var userInfo = "<%=hourse.getUserInfo()%>";
	var user = "<%=session.getAttribute("user")%>";
	if((userInfo === 'null'||userInfo ==='' )&& user !=='null' && msg ==='null'){
		document.getElementById("test").innerHTML="<button onclick=\"location.href='<%=basePath %>Hourse/<%=hourse.getHourseId() %>/change'\" class=\"btn btn-primary\">申请租房</button>";
	}
var basePath = "<%=basePath%>";
$(function(){
        /*小屏幕导航点击关闭菜单*/
        $('.navbar-collapse a').click(function(){
            $('.navbar-collapse').collapse('hide');
        });
        new WOW().init();
 })
 </script> 
</body>
</html>

