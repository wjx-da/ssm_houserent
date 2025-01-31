<%@ page language="java"  contentType="text/html;charset=UTF-8"%>
<jsp:include page="../check_logstate.jsp"/> 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/userInfo.css" /> 

<div id="userInfo_manage"></div>
<div id="userInfo_manage_tool" style="padding:5px;">
	<div style="margin-bottom:5px;">
		<a href="#" class="easyui-linkbutton" iconCls="icon-edit-new" plain="true" onclick="userInfo_manage_tool.edit();">修改</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-delete-new" plain="true" onclick="userInfo_manage_tool.remove();">删除</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-reload" plain="true"  onclick="userInfo_manage_tool.reload();">刷新</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-redo" plain="true" onclick="userInfo_manage_tool.redo();">取消选择</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-export" plain="true" onclick="userInfo_manage_tool.exportExcel();">导出到excel</a>
	</div>
	<div style="padding:0 0 0 7px;color:#333;">
		<form id="userInfoQueryForm" method="post">
			用户名：<input type="text" class="textbox" id="user_name" name="user_name" style="width:110px" />
			姓名：<input type="text" class="textbox" id="realName" name="realName" style="width:110px" />
			出生日期：<input type="text" id="birthday" name="birthday" class="easyui-datebox" editable="false" style="width:100px">
			身份证：<input type="text" class="textbox" id="cardNumber" name="cardNumber" style="width:110px" />
			籍贯：<input type="text" class="textbox" id="city" name="city" style="width:110px" />
			<a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="userInfo_manage_tool.search();">查询</a>
		</form>	
	</div>
</div>

<div id="userInfoEditDiv">
	<form id="userInfoEditForm" enctype="multipart/form-data"  method="post">
		<div>
			<span class="label">用户名:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="userInfo_user_name_edit" name="userInfo.user_name" style="width:200px" />
			</span>
		</div>
		<div>
			<span class="label">密码:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="userInfo_password_edit" name="userInfo.password" style="width:200px" />
			</span>
		</div>
		<div>
			<span class="label">姓名:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="userInfo_realName_edit" name="userInfo.realName" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">性别:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="userInfo_sex_edit" name="userInfo.sex" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">出生日期:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="userInfo_birthday_edit" name="userInfo.birthday" />

			</span>

		</div>
		<div>
			<span class="label">身份证:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="userInfo_cardNumber_edit" name="userInfo.cardNumber" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">籍贯:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="userInfo_city_edit" name="userInfo.city" style="width:200px" />

			</span>
		</div>
		<div>
			<span class="label">照片:</span>
			<span class="inputControl">
				<img id="userInfo_photoImg" width="200px" border="0px"/><br/>
    			<input type="hidden" id="userInfo_photo" name="userInfo.photo"/>
				<input id="photoFile" name="photoFile" type="file" size="50" />
			</span>
		</div>
		<div>
			<span class="label">家庭地址:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="userInfo_address_edit" name="userInfo.address" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">电子邮件:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="userInfo_email_edit" name="userInfo.email" style="width:200px" />
			</span>
		</div>
		<div>
			<span class="label">手机号:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="userInfo_telephone_edit" name="userInfo.telephone" style="width:200px" />
			</span>
		</div>
		<div>
			<span class="label">预期租金:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="userInfo_price_edit" name="userInfo.price" style="width:200px" />
			</span>
		</div>
	</form>
</div>
<script type="text/javascript" src="UserInfo/js/userInfo_manage.js"></script> 
