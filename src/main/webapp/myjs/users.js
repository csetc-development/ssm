//(分页部分可能代码有问题，之后新加的JS一律放到分页前面)
$(document).ready(function () {
	
	//角色选择后，显示该角色的权限
    $("input[name^='roles']").change(function () {  
    	var checkboxs = $("input[name^='roles']:checkbox:checked");
    	var ridlist=new Array();
    	//将复选框所有选中的值放入array里
		for(i in checkboxs){
	        if(checkboxs[i].checked)
	        	ridlist.push(checkboxs[i].value);
	    }
		//把ridlist放入input中，提交到后台
		document.getElementById("ridlist").value=ridlist.toString();
		/*
		 * 测试复选框是否成功放入list中
		 * */
		/*for(j in ridlist){
			alert("list:"+ridlist[j]);
    	}*/
		//如果勾选了角色
        if(ridlist.length>0){
			$.ajax({     
	        	type : 'POST',
	        	url: 'user/getallPermsByrid.do',
	        	dataType: 'json',
	        	data : { "ridlist" : ridlist.toString() },
				success : function(data) {
					var htmlContent_des = "";
					//如果该角色有权限则
	                if(data.length>0){
	                	var i = 0;
	                	for(var tmp in data){
	                		if(i==0){
	                			htmlContent_des += data[tmp].description;	
	                    		i++;
	                		}else{
	                			htmlContent_des += ",";	
	                			htmlContent_des += data[tmp].description;
	                		}
	                		$("#permissions_des").html(htmlContent_des);
	                	}
	                //如果该角色没有权限则
	                }else{
	                	htmlContent_des = "没有相关权限";
	                	$("#permissions_des").html(htmlContent_des);
	                }
	            }
	        });
		//如果没有勾选角色则
        }else{
        	htmlContent_des = "没有相关权限";
        	$("#permissions_des").html(htmlContent_des);
        }
    });  

	//有用户的全选、全不选操作
	$("#alluseremp").click(function () {
	    if ($("#alluseremp").is(":checked")) { // 全选 
	        $("input[name='alluseremp_checkbox']").each(function () {
	        	$(this).prop("checked", true);
	        });
	    }else { // 取消全选 
	        $("input[name='alluseremp_checkbox']").each(function () {
	            $(this).prop("checked", false);
	        });
	    }
	});
	

	//按下没有用户的员工按钮是动作
	 $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) { 
		 switch($(e.target).text()){
		 	case "没有用户的员工":
		 		nulluserinfo(1);
		 		//修改搜索类型的input中value的值
		 		document.getElementById('searchetype').value = "0";
		 	break;
		 	case "已有用户的员工":
		 		//修改搜索类型的input中value的值
		 		document.getElementById('searchetype').value = "1";
		 	break;
		 }
	 });
	
	 function nulluserinfo(p){
		 $.ajax({
				type : 'POST',
				url : 'user/nulluserinfopage.do',
				dataType :'json',
				data : { "pagenum" : p },
				success : function(data) {
					/*alert("bootstrap："+data.length);*/
					if(data.length>0){
	 					var htmlContent = "<thead><tr><th>&nbsp;</th><th colspan='5' align='center' >员工信息</th></tr><tr><th><input type='checkbox' id='nulluseremp' name='nulluseremp' onclick='nullcheckbox()'></th><th>姓名</th><th>性别</th><th>出生年月</th><th>部门</th> <th>职务</th></tr></thead><tbody>";
		 				for(var tmp in data){
							pages = data[tmp].pages;
							/*alert("bootstrap："+pages);*/
							var list = data[tmp].list;
		 					for(var obj in list){
			 					htmlContent += "<tr><td><input type='checkbox' name='nulluseremp_checkbox' value="+list[obj].eid+"></td>";
			 					htmlContent += "<td>"+list[obj].ename+"</td>";
								htmlContent += "<td>"+list[obj].esex+"</td>";
								htmlContent += "<td>"+list[obj].ebrithday+"</td>";
								htmlContent += "<td>"+list[obj].dName+"</td>";
								htmlContent += "<td>"+list[obj].ejob+"</td>";
		 					}
		 				}	
						htmlContent += "</tr></tbody>"
						$("#nullusertable").html(htmlContent);
						
					}
				}
				
		 });
	}
	 
 
/*	 没有用户的员工信息 	 */
	 $(".tcdPageCode:eq(1)").createPage({
		    pageCount:$("#nullpagecount").val(),
		    current:1,
		    backFn:function(p){    	
				 $.ajax({
						type : 'POST',
						url : 'user/nulluserinfopage.do',
						dataType :'json',
						data : { "pagenum" : p },
						success : function(data) {
							/*alert("分页数："+data.length);*/
							if(data.length>0){
			 					var htmlContent = "<thead><tr><th>&nbsp;</th><th colspan='5' align='center' >员工信息</th></tr><tr><th><input type='checkbox' id='nulluseremp' name='nulluseremp'></th><th>姓名</th><th>性别</th><th>出生年月</th><th>部门</th> <th>职务</th></tr></thead><tbody>";
				 				for(var tmp in data){
									pages = data[tmp].pages;
									var list = data[tmp].list;
				 					for(var obj in list){
				 						/*alert("分页数："+list[obj].esex);*/
					 					htmlContent += "<tr><td><input type='checkbox' name='nulluseremp_checkbox' value="+list[obj].eid+"></td>";
					 					htmlContent += "<td>"+list[obj].ename+"</td>";
										htmlContent += "<td>"+list[obj].esex+"</td>";
										htmlContent += "<td>"+list[obj].ebrithday+"</td>";
										htmlContent += "<td>"+list[obj].dName+"</td>";
										htmlContent += "<td>"+list[obj].ejob+"</td>";
				 					}
				 				}	
								htmlContent += "</tr></tbody>"
								$("#nullusertable").html(htmlContent);
							
							}
						}
						
				 });
		    }	
		})
	 
	
		
		
	//有用户的员工分页的JS处理
	$(".tcdPageCode:eq(0)").createPage({
	    pageCount:$("#pagecount").val(),
	    current:1,
	    backFn:function(p){
	    	$.ajax({
	 			type : 'POST',
	 			url : 'user/haveuserinfopage.do',
	 			dataType :'json',
	 			data : { "pagenum" : p },
	 			success : function(data) {
	 				if(data.length>0){
	 					var htmlContent = "<thead><tr><th>&nbsp;</th><th colspan='5' align='center' >员工信息</th><th colspan='3' align='center'>用户信息</th></tr><tr><th><input type='checkbox' id='alluseremp' name='alluseremp'></th><th>姓名</th><th>性别</th><th>出生年月</th><th>部门</th> <th>职务</th><th>用户名</th><th>角色</th> <th>权限</th></tr></thead><tbody>";
		 				for(var obj in data){
		 					htmlContent += "<tr><td><input type='checkbox' name='alluseremp_checkbox' value="+data[obj].eid+"></td>";
		 					htmlContent += "<td>"+data[obj].ename+"</td>";
							htmlContent += "<td>"+data[obj].esex+"</td>";
							htmlContent += "<td>"+data[obj].ebrithday+"</td>";
							htmlContent += "<td>"+data[obj].dName+"</td>";
							htmlContent += "<td>"+data[obj].ejob+"</td>";
							htmlContent += "<td>"+data[obj].username+"</td>";
							htmlContent += "<td>"+data[obj].rdescription+"</td>";
							htmlContent += "<td>"+data[obj].pdescription+"</td>";	
		 				}	
						htmlContent += "</tr></tbody>"
						$("#haveusertable").html(htmlContent);
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
function nullcheckbox(){
	if ($("input[name='nulluseremp']").is(":checked")) { // 全选 
        $("input[name='nulluseremp_checkbox']").each(function () {
        	$(this).prop("checked", true);
        });
    }else{ // 取消全选 
        $("input[name='nulluseremp_checkbox']").each(function () {
            $(this).prop("checked", false);
        });
    }
}



//按名字查找客户
function searcheByName(){
	var serchName = $("#serchName").val();
	var searchetype=$("#searchetype").val();
	if(document.getElementById('searchetype').value==0){
		if(serchName!=""){
			$.ajax({
				type : 'POST',
				url : 'user/getByname.do',
				dataType :'json',
				async:false,
				data : { "serchName" : serchName , "searchetype" : searchetype},
				success : function(data) {
					/*alert("分页数："+data.length);*/
					if(data.length>0){
	 					var htmlContent = "<thead><tr><th>&nbsp;</th><th colspan='5' align='center' >员工信息</th></tr><tr><th><input type='checkbox' id='nulluseremp' name='nulluseremp'></th><th>姓名</th><th>性别</th><th>出生年月</th><th>部门</th> <th>职务</th></tr></thead><tbody>";
		 				for(var tmp in data){
							pages = data[tmp].pages;
							var list = data[tmp].list;
							if(list.length>0){
								for(var obj in list){
			 						/*alert("分页数："+list[obj].esex);*/
				 					htmlContent += "<tr><td><input type='checkbox' name='nulluseremp_checkbox' value="+list[obj].eid+"></td>";
				 					htmlContent += "<td>"+list[obj].ename+"</td>";
									htmlContent += "<td>"+list[obj].esex+"</td>";
									htmlContent += "<td>"+list[obj].ebrithday+"</td>";
									htmlContent += "<td>"+list[obj].dName+"</td>";
									htmlContent += "<td>"+list[obj].ejob+"</td>";
			 					}
							}else{
								var htmlContent = "<tr><td>没有相关数据</td></tr>";
							}
		 					
		 				}	
						htmlContent += "</tr></tbody>"
						$("#nullusertable").html(htmlContent);
	 				}
				}
			});
		}
	}else if(document.getElementById('searchetype').value==1){
		if(serchName!=""){
			$.ajax({
				type : 'POST',
				url : 'user/getByname.do',
				dataType :'json',
				data : { "serchName" : serchName , "searchetype" : searchetype  },
				success : function(data) {
					if(data.length>0){
	 					var htmlContent = "<thead><tr><th>&nbsp;</th><th colspan='5' align='center' >员工信息</th><th colspan='3' align='center'>用户信息</th></tr><tr><th><input type='checkbox' id='alluseremp' name='alluseremp'></th><th>姓名</th><th>性别</th><th>出生年月</th><th>部门</th> <th>职务</th><th>用户名</th><th>角色</th> <th>权限</th></tr></thead><tbody>";
		 				for(var tmp in data){
							pages = data[tmp].pages;
							var list = data[tmp].list;
							if(list.length>0){
			 					for(var obj in list){
			 						/*alert("分页数："+list[obj].esex);*/
			 						htmlContent += "<tr><td><input type='checkbox' name='alluseremp_checkbox' value="+list[obj].eid+"></td>";
				 					htmlContent += "<td>"+list[obj].ename+"</td>";
									htmlContent += "<td>"+list[obj].esex+"</td>";
									htmlContent += "<td>"+list[obj].ebrithday+"</td>";
									htmlContent += "<td>"+list[obj].dName+"</td>";
									htmlContent += "<td>"+list[obj].ejob+"</td>";
									htmlContent += "<td>"+list[obj].username+"</td>";
									htmlContent += "<td>"+list[obj].rdescription+"</td>";
									htmlContent += "<td>"+list[obj].pdescription+"</td>";
			 					}
							}else{
								var htmlContent = "<tr><td>没有相关数据</td></tr>";
							}
		 				}	
						htmlContent += "</tr></tbody>"
						$("#haveusertable").html(htmlContent);
	 				}
				}
			});
		}
	}
}


//修改客户信息
function updateuserinfo(){
	var cuscheckbox = $("input[name^='alluseremp']:checkbox:checked");
	if(cuscheckbox.length>1){
		alert("只能修改一个客户信息，请修改选中信息！")
	}else{
		cuscheckbox.each(function(){ //由于复选框一般选中的是多个,所以可以循环输出 
			var eid = $(this).val();
			window.location.href="user/edit_info.do?eid="+eid;
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
function delectuserinfo(){
	var cuscheckbox = $("input[name='alluseremp_checkbox']:checkbox:checked");
	if(cuscheckbox.length>0){
		if (!confirm("确定要删除这"+cuscheckbox.length+"条客户信息吗")) {
			return false;
		}
		var checkboxarray ="";
		cuscheckbox.each(function(){
			checkboxarray += $(this).val()+",";
		});
		window.location.href="user/deleteUser.do?eidstring="+checkboxarray;
	}
}



	 
