<%@ page language="java" import="java.util.*"  contentType="text/html;charset=UTF-8"%>
<jsp:include page="../check_logstate.jsp"/>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/userInfo.css" />
<div id="userInfoAddDiv">
	<form id="userInfoAddForm" enctype="multipart/form-data"  method="post">
		<div>
			<span class="label">用户名:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="userInfo_user_name" name="userInfo.user_name" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">密码:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="userInfo_password" name="userInfo.password" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">姓名:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="userInfo_realName" name="userInfo.realName" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">性别:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="userInfo_sex" name="userInfo.sex" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">出生日期:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="userInfo_birthday" name="userInfo.birthday" />

			</span>

		</div>
		<div>
			<span class="label">身份证:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="userInfo_cardNumber" name="userInfo.cardNumber" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">籍贯:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="userInfo_city" name="userInfo.city" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">照片:</span>
			<span class="inputControl">
				<input id="photoFile" name="photoFile" type="file" size="50" />
			</span>
		</div>
		<div>
			<span class="label">家庭地址:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="userInfo_address" name="userInfo.address" style="width:200px" />

			</span>
		</div>
		<div>
			<span class="label">邮箱:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="userInfo_email" name="userInfo.email" style="width:200px" />
			</span>
		</div>
		<div>
			<span class="label">联系电话:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="userInfo_telephone" name="userInfo.telephone" style="width:200px" />
			</span>
		</div>
		<div>
			<span class="label">期望租金:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="userInfo_price" name="userInfo.price" style="width:200px" />
			</span>
		</div>
		<div class="operation">
			<a id="userInfoAddButton" class="easyui-linkbutton">添加</a>
			<a id="userInfoClearButton" class="easyui-linkbutton">重填</a>
		</div>
	</form>
</div>
<script src="${pageContext.request.contextPath}/UserInfo/js/userInfo_add.js"></script>
