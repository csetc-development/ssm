//(分页部分可能代码有问题，之后新加的JS一律放到分页前面)
$(document).ready(function () {
	//权限选择后，将权限放入input中
    $("input[name^='perms']").change(function () {  
    	var checkboxs = $("input[name^='perms']:checkbox:checked");
    	var pidlist=new Array();
    	//将复选框所有选中的值放入array里
		for(i in checkboxs){
	        if(checkboxs[i].checked)
	        	pidlist.push(checkboxs[i].value);
	    }
		//把ridlist放入input中，提交到后台
		document.getElementById("pidlist").value=pidlist.toString();
    });  

	//角色的全选、全不选操作
	$("#role_selectall").click(function () {
	    if ($("#role_selectall").is(":checked")) { // 全选 
	        $("input[name='role_checkbox']").each(function () {
	        	$(this).prop("checked", true);
	        });
	    }else { // 取消全选 
	        $("input[name='role_checkbox']").each(function () {
	            $(this).prop("checked", false);
	        });
	    }
	});
	

	//按下权限管理按钮的动作
	 $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) { 
		 switch($(e.target).text()){
		 	case "权限管理":
		 		perminfo(1);
		 		//修改搜索类型的input中value的值
		 		document.getElementById('searchetype').value = "0";
		 	break;
		 	case "角色管理":
		 		//修改搜索类型的input中value的值
		 		document.getElementById('searchetype').value = "1";
		 	break;
		 }
	 });
	
	 function perminfo(p){
		 $.ajax({
				type : 'POST',
				url : 'roleperm/perminfopage.do',
				dataType :'json',
				data : { "pagenum" : p },
				success : function(data) {
					/*alert("bootstrap："+data.length);*/
					if(data.length>0){
	 					var htmlContent = "<thead><tr><th>&nbsp;</th><th colspan='5' align='center' >权限信息</th></tr><tr><th><input type='checkbox' id='perm_selectall' name='perm_selectall' onclick='permcheckbox()'></th><th>id</th><th>字段</th><th>描述</th></tr></thead><tbody>";
		 				for(var tmp in data){
							pages = data[tmp].pages;
							var list = data[tmp].list;
							if(list.length>0){
								for(var obj in list){
				 					htmlContent += "<tr><td><input type='checkbox' name='perm_checkbox'  value="+list[obj].pid+"></td>";
				 					htmlContent += "<td>"+list[obj].pid+"</td>";
				 					htmlContent += "<td>"+list[obj].name+"</td>";
									htmlContent += "<td>"+list[obj].description+"</td>";
			 					}
							}else{
								var htmlContent = "<tr><td>没有相关数据</td></tr>";
							}
							
		 				}	
						htmlContent += "</tr></tbody>"
						$("#permtable").html(htmlContent);
					}
				}
		 });
	}
	 
 
	 // 权限角色分页的JS处理
	 $(".tcdPageCode:eq(1)").createPage({
		    pageCount:$("#permpagecount").val(),
		    current:1,
		    backFn:function(p){    	
				 $.ajax({
						type : 'POST',
						url : 'roleperm/perminfopage.do',
						dataType :'json',
						data : { "pagenum" : p },
						success : function(data) {
							/*alert("分页数："+data.length);*/
							if(data.length>0){
			 					var htmlContent = "<thead><tr><th>&nbsp;</th><th colspan='5' align='center' >权限信息</th></tr><tr><th><input type='checkbox' id='perm_selectall' name='perm_selectall' onclick='permcheckbox()'></th><th>id</th><th>字段</th><th>描述</th></tr></thead><tbody>";
				 				for(var tmp in data){
									pages = data[tmp].pages;
									var list = data[tmp].list;
									if(list.length>0){
										for(var obj in list){
					 						/*alert("分页数："+list[obj].esex);*/
						 					htmlContent += "<tr><td><input type='checkbox' name='perm_checkbox'  value="+list[obj].pid+"></td>";
						 					htmlContent += "<td>"+list[obj].pid+"</td>";
						 					htmlContent += "<td>"+list[obj].name+"</td>";
											htmlContent += "<td>"+list[obj].description+"</td>";
					 					}
									}else{
										var htmlContent = "<tr><td>没有相关数据</td></tr>";
									}
				 				}	
								htmlContent += "</tr></tbody>"
								$("#permtable").html(htmlContent);
							
							}
						}
						
				 });
		    }	
		})
	 
	
		
		
	//角色分页的JS处理
	$(".tcdPageCode:eq(0)").createPage({
	    pageCount:$("#rolepagecount").val(),
	    current:1,
	    backFn:function(p){
	    	$.ajax({
	 			type : 'POST',
	 			url : 'roleperm/roleinfopage.do',
	 			dataType :'json',
	 			data : { "pagenum" : p },
	 			success : function(data) {
					 if(data.length>0){
	 					var htmlContent = "<thead><tr><th>&nbsp;</th><th colspan='5' align='center' >角色信息</th></tr><tr><th><input type='checkbox' id='role_selectall'></th><th>id</th><th>字段</th><th>描述</th><th>对应权限</th></tr></thead><tbody>";
		 				for(var obj in data){
		 					htmlContent += "<tr><td><input type='checkbox' name='role_checkbox'  value="+data[obj].rid+"></td>";
		 					htmlContent += "<td>"+data[obj].rid+"</td>";
							htmlContent += "<td>"+data[obj].name+"</td>";
							htmlContent += "<td>"+data[obj].description+"</td>";
							htmlContent += "<td>"+data[obj].permlist+"</td>";
		 				}	
						htmlContent += "</tr></tbody>"
						$("#roletable").html(htmlContent);
	 				}
 				}
 			})
	    }
	});
	

	 $('.datetimepicker').datetimepicker({  
	        format: 'YYYY-MM-DD',  
	        locale: moment.locale('zh-cn')  
	    });
	 
	$('.nav-pills a:first').tab('show');
	
});
 
//没有用户的员工全选 
function permcheckbox(){
	if ($("input[name='perm_selectall']").is(":checked")) { // 全选 
        $("input[name='perm_checkbox']").each(function () {
        	$(this).prop("checked", true);
        });
    }else{ // 取消全选 
        $("input[name='perm_checkbox']").each(function () {
            $(this).prop("checked", false);
        });
    }
}



//按名字查找角色、权限
function searcheByName(){
	var serchName = $("#serchName").val();
	var searchetype=$("#searchetype").val();
	if(document.getElementById('searchetype').value==0){//权限查询
		if(serchName!=""){
			$.ajax({
				type : 'POST',
				url : 'roleperm/getByname.do',
				dataType :'json',
				async:false,
				data : { "serchName" : serchName , "searchetype" : searchetype},
				success : function(data) {
					/*alert("分页数："+data.length);*/
					if(data.length>0){
	 					var htmlContent = "<thead><tr><th>&nbsp;</th><th colspan='5' align='center' >权限信息</th></tr><tr><th><input type='checkbox' id='perm_selectall' name='perm_selectall' onclick='permcheckbox()'></th><th>id</th><th>字段</th><th>描述</th></tr></thead><tbody>";
		 				for(var tmp in data){
							pages = data[tmp].pages;
							var list = data[tmp].list;
							if(list.length>0){
								for(var obj in list){
			 						/*alert("分页数："+list[obj].esex);*/
				 					htmlContent += "<tr><td><input type='checkbox' name='perm_checkbox'  value="+list[obj].pid+"></td>";
				 					htmlContent += "<td>"+list[obj].pid+"</td>";
				 					htmlContent += "<td>"+list[obj].name+"</td>";
									htmlContent += "<td>"+list[obj].description+"</td>";
			 					}
							}else{
								var htmlContent = "<tr><td>没有相关数据</td></tr>";
							}
		 					
		 				}	
						htmlContent += "</tr></tbody>"
						$("#permtable").html(htmlContent);
	 				}
				}
			});
		}
	}else if(document.getElementById('searchetype').value==1){//角色查询
		if(serchName!=""){
			$.ajax({
				type : 'POST',
				url : 'roleperm/getByname.do',
				dataType :'json',
				data : { "serchName" : serchName , "searchetype" : searchetype  },
				success : function(data) {
	 				if(data.length>0){
	 					var htmlContent = "<thead><tr><th>&nbsp;</th><th colspan='5' align='center' >角色信息</th></tr><tr><th><input type='checkbox' id='role_selectall'></th><th>id</th><th>字段</th><th>描述</th><th>对应权限</th></tr></thead><tbody>";
		 				for(var tmp in data){
							pages = data[tmp].pages;
							var list = data[tmp].list;
							if(list.length>0){
			 					for(var obj in list){
			 						/*alert("分页数："+list[obj].esex);*/
				 					htmlContent += "<tr><td><input type='checkbox' name='role_checkbox'  value="+list[obj].rid+"></td>";
				 					htmlContent += "<td>"+list[obj].rid+"</td>";
									htmlContent += "<td>"+list[obj].name+"</td>";
									htmlContent += "<td>"+list[obj].description+"</td>";
									htmlContent += "<td>"+list[obj].permlist+"</td>";	
			 					}
							}else{
								var htmlContent = "<tr><td>没有相关数据</td></tr>";
							}
		 				}	
						htmlContent += "</tr></tbody>"
						$("#roletable").html(htmlContent);
	 				}
				}
			});
		}
	}
}


//修改角色信息
function updateroleinfo(){
	var cuscheckbox = $("input[name^='role']:checkbox:checked");
	if(cuscheckbox.length>1){
		alert("只能修改一个客户信息，请修改选中信息！")
	}else{
		cuscheckbox.each(function(){ //由于复选框一般选中的是多个,所以可以循环输出 
			var rid = $(this).val();
			window.location.href="roleperm/editrole_info.do?rid="+rid;
		}); 
	}
}

//修改权限信息
function updateperminfo(){
	var cuscheckbox = $("input[name^='perm']:checkbox:checked");
	if(cuscheckbox.length>1){
		alert("只能修改一个客户信息，请修改选中信息！")
	}else{
		cuscheckbox.each(function(){ //由于复选框一般选中的是多个,所以可以循环输出 
			var pid = $(this).val();
			window.location.href="roleperm/editperm_info.do?pid="+pid;
		}); 
	}
}


//添加用户信息
function addinfo(){
	var cuscheckbox = $("input[name^='nulluseremp_checkbox']:checkbox:checked");
	var eidlist=new Array();
	//如果复选框超过1个
    if(cuscheckbox.length>1){
    	//将复选框所有选中的值放入array里
		for(i in cuscheckbox){
	        if(cuscheckbox[i].checked)
	        	eidlist.push(cuscheckbox[i].value);
	    }
		var addone = false;//增加一个用户的参数为假
		window.location.href="user/add_info.do?eidlist="+eidlist.toString()+"&addone="+addone;
    }else if(cuscheckbox.length=1){
    	cuscheckbox.each(function(){ //由于复选框一般选中的是多个,所以可以循环输出 
    		var eid = $(this).val();
    		var addone = true;//增加一个用户的参数为真
    		window.location.href="user/add_info.do?eid="+eid+"&addone="+addone;
    	}); 
    }
}


//删除用户信息
function delectroleinfo(){
	var cuscheckbox = $("input[name='role_checkbox']:checkbox:checked");
	if(cuscheckbox.length>0){
		if (!confirm("确定要删除这"+cuscheckbox.length+"条角色的权限吗")) {
			return false;
		}
		var checkboxarray ="";
		cuscheckbox.each(function(){
			checkboxarray += $(this).val()+",";
		});
		window.location.href="user/deleteUser.do?ridstring="+checkboxarray;
	}
}



	 
