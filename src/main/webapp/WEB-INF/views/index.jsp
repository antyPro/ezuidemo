<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	request.setAttribute("basePath", request.getContextPath());
    
	if(request.getServerPort() == 80){
		String basePath = request.getScheme()+"://"+request.getServerName()+request.getContextPath();
		request.setAttribute("fullPath", basePath);
	} else {
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
		request.setAttribute("fullPath", basePath);
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript" src="${basePath}/resources/js/jquery.min.js"></script>
   <script type="text/javascript" src="${basePath}/resources/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${basePath}/resources/js/easyui-lang-zh_CN.js"></script>
    <link rel="stylesheet" href="${basePath}/resources/css/easyui.css" type="text/css"/>
   <link rel="stylesheet" href="${basePath}/resources/css/icon.css" type="text/css"/>

<title>Insert title here</title>
</head>
<script type="text/javascript">

function addPlayer(){

	$('#dlg').dialog('open').dialog('setTitle','New Player');
	$('#fm').form('clear');
	 url = "add.do"; 
	
}

function editPlayer(){
	var row = $('#dg').datagrid('getSelected');
	if(row){
			
		$('#dlg').dialog('open').dialog('setTitle','New Player');
		$('#fm').form('load',row);
		url = "edit.do?id1="+row.id;
		

		}
	
}

function delPlayer(){
	var row = $('#dg').datagrid('getSelected');
	if(row){
		
		$.messager.confirm('Confirm','Are you sure you want to destroy this user?',function(r){
			if (r){
				$.post('delete.do',{id:row.id},function(result){
					if (result.success){
						$('#dg').datagrid('reload');	// reload the user data
					} else {
						$.messager.show({	// show error message
							title: 'Error',
							msg: result.errorMsg
						});
					}
				},'json');
			}
		});
		}
}

function saveUser(){
	$('#fm').form('submit',{
		url: url,
		onSubmit: function(){
			return $(this).form('validate');
		},
		success: function(result){
			var result = eval('('+result+')');
			if (result.errorMsg){
				$.messager.show({
					title: 'Error',
					msg: result.errorMsg
				});
			} else {
				$('#dlg').dialog('close');		// close the dialog
				$('#dg').datagrid('reload');	// reload the user data
			}
		}
	});
}


</script>
<body>



<div>
<table id="dg" title="My Users" class="easyui-datagrid" style="width:550px;height:250px"
		url="get.do"
		toolbar="#toolbar"
		rownumbers="true" fitColumns="true" singleSelect="true">
	<thead>
		<tr>
			<th field="id" width="50">First Name</th>
			<th field="name" width="50">Last Name</th>
			<th field="height" width="50">Phone</th>
			<th field="team" width="50">Email</th>
		</tr>
	</thead>
</table>
<div id="toolbar">
	<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addPlayer()">New User</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editPlayer()">Edit User</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="delPlayer()">Remove User</a>
</div>


<div id="dlg" class="easyui-dialog" style="width:400px;height:280px;padding:10px 20px"
		closed="true" buttons="#dlg-buttons">
	<div class="ftitle">User Information</div>
	<form id="fm" method="post">
		<div class="fitem">
			<label>First id:</label>
			<input name="id" class="easyui-validatebox" required="true">
		</div>
		<div class="fitem">
			<label>name:</label>
			<input name="name" class="easyui-validatebox" required="true">
		</div>
		<div class="fitem">
			<label>height:</label>
			<input name="height">
		</div>
		<div class="fitem">
			<label>team:</label>
			<input name="team" class="easyui-validatebox" >
		</div>
	</form>
</div>
<div id="dlg-buttons">
	<a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveUser()">Save</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">Cancel</a>
</div>




</div>
</body>
</html>