<%@ page language="java" import="java.util.*"  contentType="text/html;charset=UTF-8"%>
<%@ page import="com.chengxusheji.po.Hourse" %>
<%@ page import="com.chengxusheji.po.BuildingInfo" %>
<%@ page import="com.chengxusheji.po.HourseType" %>
<%@ page import="com.chengxusheji.po.PriceRange" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	List<Hourse> hourseList = (List<Hourse>)request.getAttribute("hourseList");
	int currentPage =  (Integer)request.getAttribute("currentPage"); //当前页
	int totalPage =   (Integer)request.getAttribute("totalPage");  //一共多少页
	int recordNumber =   (Integer)request.getAttribute("recordNumber");  //一共多少记录
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
	<title>房屋信息查询</title>
	<link href="<%=basePath %>plugins/bootstrap.css" rel="stylesheet">
	<link href="<%=basePath %>plugins/bootstrap-dashen.css" rel="stylesheet">
	<link href="<%=basePath %>plugins/font-awesome.css" rel="stylesheet">
	<link href="<%=basePath %>plugins/animate.css" rel="stylesheet">
	<link href="<%=basePath %>plugins/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
</head>
<body style="margin-top:70px;">
<div class="container">
	<jsp:include page="../header.jsp"></jsp:include>
	<div class="col-md-9 wow fadeInLeft">
		<ul class="breadcrumb">
			<li><a href="<%=basePath %>index.jsp">首页</a></li>
			<li><a href="<%=basePath %>Hourse/frontlist">房屋信息信息列表</a></li>
			<li class="active">查询结果显示</li>
		</ul>
		<div class="row">
			<%
				/*计算起始序号*/
				int startIndex = (currentPage -1) * 5;
				/*遍历记录*/
				for(int i=0;i<hourseList.size();i++) {
					int currentIndex = startIndex + i + 1; //当前记录的序号
					Hourse hourse = hourseList.get(i); //获取到房屋信息对象
					String clearLeft = "";
					if(i%4 == 0) clearLeft = "style=\"clear:left;\"";
			%>
			<div class="col-md-3 bottom15" <%=clearLeft %>>
				<a  href="<%=basePath  %>Hourse/<%=hourse.getHourseId() %>/frontshow"><img class="img-responsive" src="<%=basePath%><%=hourse.getHousePhoto()%>" /></a>
				<div class="showFields">
					<div class="field">
						房屋名称:<%=hourse.getHourseName() %>
					</div>
					<div class="field">
						所在楼盘:<%=hourse.getBuildingObj().getBuildingName() %>
					</div>
					<div class="field">
						房屋类型:<%=hourse.getHourseTypeObj().getTypeName() %>
					</div>
					<div class="field">
						价格范围:<%=hourse.getPriceRangeObj().getPriceName() %>
					</div>
					<div class="field">
						面积:<%=hourse.getArea() %>
					</div>
					<div class="field">
						租金(元/月):<%=hourse.getPrice() %>
					</div>
					<div class="field">
						楼层/总楼层:<%=hourse.getLouceng() %>
					</div>
					<div class="field">
						装修:<%=hourse.getZhuangxiu() %>
					</div>
					<div class="field">
						朝向:<%=hourse.getCaoxiang() %>
					</div>
					<div class="field">
						建筑年代:<%=hourse.getMadeYear() %>
					</div>
					<div class="field">
						联系人:<%=hourse.getConnectPerson() %>
					</div>
					<div class="field">
						联系电话:<%=hourse.getConnectPhone() %>
					</div>
					<div class="field">
						出租信息:<%=hourse.getUserInfo() %>
					</div>
					<a class="btn btn-primary top5" href="<%=basePath %>Hourse/<%=hourse.getHourseId() %>/frontshow">详情</a>
					<a class="btn btn-primary top5" onclick="hourseEdit('<%=hourse.getHourseId() %>');" style="display:none;">修改</a>
					<a class="btn btn-primary top5" onclick="hourseDelete('<%=hourse.getHourseId() %>');" style="display:none;">删除</a>
				</div>
			</div>
			<%  } %>

			<div class="row">
				<div class="col-md-12">
					<nav class="pull-left">
						<ul class="pagination">
							<li><a href="#" onclick="GoToPage(<%=currentPage-1 %>,<%=totalPage %>);" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
							<%
								int startPage = currentPage - 5;
								int endPage = currentPage + 5;
								if(startPage < 1) startPage=1;
								if(endPage > totalPage) endPage = totalPage;
								for(int i=startPage;i<=endPage;i++) {
							%>
							<li class="<%= currentPage==i?"active":"" %>"><a href="#"  onclick="GoToPage(<%=i %>,<%=totalPage %>);"><%=i %></a></li>
							<%  } %>
							<li><a href="#" onclick="GoToPage(<%=currentPage+1 %>,<%=totalPage %>);"><span aria-hidden="true">&raquo;</span></a></li>
						</ul>
					</nav>
					<div class="pull-right" style="line-height:75px;" >共有<%=recordNumber %>条记录，当前第 <%=currentPage %>/<%=totalPage %> 页</div>
				</div>
			</div>
		</div>
	</div>

<div id="hourseEditDialog" class="modal fade" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title"><i class="fa fa-edit"></i>&nbsp;房屋信息信息编辑</h4>
			</div>
			<div class="modal-body" style="height:450px; overflow: scroll;">
				<form class="form-horizontal" name="hourseEditForm" id="hourseEditForm" enctype="multipart/form-data" method="post"  class="mar_t15">
					<div class="form-group">
						<label for="hourse_hourseId_edit" class="col-md-3 text-right">房屋编号:</label>
						<div class="col-md-9">
							<input type="text" id="hourse_hourseId_edit" name="hourse.hourseId" class="form-control" placeholder="请输入房屋编号" readOnly>
						</div>
					</div>
					<div class="form-group">
						<label for="hourse_hourseName_edit" class="col-md-3 text-right">房屋名称:</label>
						<div class="col-md-9">
							<input type="text" id="hourse_hourseName_edit" name="hourse.hourseName" class="form-control" placeholder="请输入房屋名称">
						</div>
					</div>
					<div class="form-group">
						<label for="hourse_buildingObj_buildingId_edit" class="col-md-3 text-right">所在楼盘:</label>
						<div class="col-md-9">
							<select id="hourse_buildingObj_buildingId_edit" name="hourse.buildingObj.buildingId" class="form-control">
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="hourse_housePhotoImg" class="col-md-3 text-right">房屋图片:</label>
						<div class="col-md-9">
							<img  class="img-responsive" id="hourse_housePhotoImg" border="0px"/><br/>
							<input type="hidden" id="hourse_housePhoto" name="hourse.housePhoto"/>
							<input id="housePhotoFile" name="housePhotoFile" type="file" size="50" />
						</div>
					</div>
					<div class="form-group">
						<label for="hourse_hourseTypeObj_typeId_edit" class="col-md-3 text-right">房屋类型:</label>
						<div class="col-md-9">
							<select id="hourse_hourseTypeObj_typeId_edit" name="hourse.hourseTypeObj.typeId" class="form-control">
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="hourse_priceRangeObj_rangeId_edit" class="col-md-3 text-right">价格范围:</label>
						<div class="col-md-9">
							<select id="hourse_priceRangeObj_rangeId_edit" name="hourse.priceRangeObj.rangeId" class="form-control">
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="hourse_area_edit" class="col-md-3 text-right">面积:</label>
						<div class="col-md-9">
							<input type="text" id="hourse_area_edit" name="hourse.area" class="form-control" placeholder="请输入面积">
						</div>
					</div>
					<div class="form-group">
						<label for="hourse_price_edit" class="col-md-3 text-right">租金(元/月):</label>
						<div class="col-md-9">
							<input type="text" id="hourse_price_edit" name="hourse.price" class="form-control" placeholder="请输入租金(元/月)">
						</div>
					</div>
					<div class="form-group">
						<label for="hourse_louceng_edit" class="col-md-3 text-right">楼层/总楼层:</label>
						<div class="col-md-9">
							<input type="text" id="hourse_louceng_edit" name="hourse.louceng" class="form-control" placeholder="请输入楼层/总楼层">
						</div>
					</div>
					<div class="form-group">
						<label for="hourse_zhuangxiu_edit" class="col-md-3 text-right">装修:</label>
						<div class="col-md-9">
							<input type="text" id="hourse_zhuangxiu_edit" name="hourse.zhuangxiu" class="form-control" placeholder="请输入装修">
						</div>
					</div>
					<div class="form-group">
						<label for="hourse_caoxiang_edit" class="col-md-3 text-right">朝向:</label>
						<div class="col-md-9">
							<input type="text" id="hourse_caoxiang_edit" name="hourse.caoxiang" class="form-control" placeholder="请输入朝向">
						</div>
					</div>
					<div class="form-group">
						<label for="hourse_madeYear_edit" class="col-md-3 text-right">建筑年代:</label>
						<div class="col-md-9">
							<input type="text" id="hourse_madeYear_edit" name="hourse.madeYear" class="form-control" placeholder="请输入建筑年代">
						</div>
					</div>
					<div class="form-group">
						<label for="hourse_connectPerson_edit" class="col-md-3 text-right">联系人:</label>
						<div class="col-md-9">
							<input type="text" id="hourse_connectPerson_edit" name="hourse.connectPerson" class="form-control" placeholder="请输入联系人">
						</div>
					</div>
					<div class="form-group">
						<label for="hourse_connectPhone_edit" class="col-md-3 text-right">联系电话:</label>
						<div class="col-md-9">
							<input type="text" id="hourse_connectPhone_edit" name="hourse.connectPhone" class="form-control" placeholder="请输入联系电话">
						</div>
					</div>
					<div class="form-group">
						<label for="hourse_detail_edit" class="col-md-3 text-right">详细信息:</label>
						<div class="col-md-9">
							<textarea id="hourse_detail_edit" name="hourse.detail" rows="8" class="form-control" placeholder="请输入详细信息"></textarea>
						</div>
					</div>
					<div class="form-group">
						<label for="hourse_address_edit" class="col-md-3 text-right">地址:</label>
						<div class="col-md-9">
							<input type="text" id="hourse_address_edit" name="hourse.address" class="form-control" placeholder="请输入地址">
						</div>
					</div>
				</form>
				<style>#hourseEditForm .form-group {margin-bottom:5px;}  </style>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="ajaxHourseModify();">提交</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<jsp:include page="../footer.jsp"></jsp:include>
<script src="<%=basePath %>plugins/jquery.min.js"></script>
<script src="<%=basePath %>plugins/bootstrap.js"></script>
<script src="<%=basePath %>plugins/wow.min.js"></script>
<script src="<%=basePath %>plugins/bootstrap-datetimepicker.min.js"></script>
<script src="<%=basePath %>plugins/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript" src="<%=basePath %>js/jsdate.js"></script>
<script>
	var basePath = "<%=basePath%>";
	/*跳转到查询结果的某页*/
	function GoToPage(currentPage,totalPage) {
		if(currentPage==0) return;
		if(currentPage>totalPage) return;
		document.hourseQueryForm.currentPage.value = currentPage;
		document.hourseQueryForm.submit();
	}

	/*可以直接跳转到某页*/
	function changepage(totalPage)
	{
		var pageValue=document.hourseQueryForm.pageValue.value;
		if(pageValue>totalPage) {
			alert('你输入的页码超出了总页数!');
			return ;
		}
		document.hourseQueryForm.currentPage.value = pageValue;
		documenthourseQueryForm.submit();
	}

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

