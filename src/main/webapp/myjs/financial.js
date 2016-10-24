/**
 * @date 2016/10/18
 * @author 李敏
 * 财务操作的内容
 */


$(document).ready(function(){
	
	//生成分页按钮，并且能够查看分页后信息
	$(".tcdPageCode:eq(0)").createPage({
	    pageCount:$("#pagecount").val(),
	    current:1,
	    backFn:function(p){
	    	$.ajax({
	    		type : 'POST',
	    		url : 'signed/signstatus.do',
	    		dataType :'json',
	    		async:false, //这是重要的一步，防止重复提交的
	    		data : { "pagenum" : p ,"status" : $("select").val()},
	    		success : function(data) {
	    			if(data!=null || data.length>0){
	    				var htmlcontext = "";
	    				var pages;
						for(var tmp in data){
							pages = data[tmp].pages;
							var list = data[tmp].list;
		    				for(var obj in list){
		    					var count = list[obj].studyfee+list[obj].spacefee;
		    					var condition=0;
		    					if (list[obj].condition!=""){
		    						condition = list[obj].condition;
		    					}
		    					htmlcontext +="<tr><td>&nbsp;&nbsp;<input type='checkbox' value='"+list[obj].sid+"' name='sign_checkbox'></td>";
		    					htmlcontext +="<td>"+list[obj].sid+"</td>";
		    					htmlcontext +="<td>"+list[obj].stime+"</td>";
		    					htmlcontext +="<td>"+list[obj].sbusinesstype+"</td>";
		    					htmlcontext +="<td>"+list[obj].sale+"</td>";
		    					htmlcontext +="<td>"+list[obj].dept+"</td>";
		    					htmlcontext +="<td>"+list[obj].scustomername+"</td>";
		    					htmlcontext +="<td>"+list[obj].studyfee+"</td>";
		    					htmlcontext +="<td>"+list[obj].spacefee+"</td>";
		    					htmlcontext +="<td>"+list[obj].backfee+"</td>";
		    					htmlcontext +="<td>"+list[obj].depositfee+"</td>";
		    					htmlcontext +="<td>"+count+"</td>";
		    					htmlcontext +="<td>"+list[obj].sarea+"</td>";
		    					htmlcontext +="<td>"+condition+"</td></tr>";
		    				}
						}
	    			}
	    			$("#signstautusinfotable").find("tbody").html(htmlcontext);
	    		}
	    	});
	    }
	});
	
})

function showModel(){
	var signcheckbox = $("input[name^='sign']:checkbox:checked");
	if(signcheckbox.length!=1){
		alert("请选择单条数据操作！")
	}else{
		var d = new Date();
		var str = d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate();
		var handler =$.trim($(".navbar li:eq(0) a").text());
		handler = handler.substr(handler.indexOf('['),handler.length);
		$("input[name='time']").val(str);
		$("input[name='handler']").text(handler);
		$.ajax({
			type : 'POST',
    		url : 'signed/onesign.do',
    		dataType :'json',
    		async:false, //这是重要的一步，防止重复提交的
    		data : { "sid" : signcheckbox.val()},
    		success : function(data){
    			$("#incomeinfo span:eq(2)").text(signcheckbox.val());
    			$("input[name='sid']").val(signcheckbox.val());
    			for(var obj in data){
    				$("#incomeinfo span:eq(3)").text(data[obj].scustomername);
    				$("#incomeinfo span:eq(4)").text(data[obj].sale);
    				var str = data[obj].studyfee+data[obj].spacefee+data[obj].backfee;
    				var s= " = "+data[obj].studyfee+"+"+data[obj].spacefee+"+"+data[obj].backfee;
    				$("#incomeinfo span:eq(5)").text(s);
    				$("#incomeinfo label:eq(0)").text(str);
    				$("#incomeinfo span:eq(6)").text(data[obj].condition);
    				$("#incomeinfo span:eq(7)").text(data[obj].backfee);
    			}
    		}
		})
		$("#incomeinfo").show();
		
	}
};



//加入记录时验证
function checkdata(){
	if(!confirm("确定收到这一款项吗")){
		return false;
	}else{
		var amount = parseInt($("input[name='amount']").val());
		var paid = parseInt($("#incomeinfo span:eq(6)").text());
		var shouldpay = parseInt($("#incomeinfo label:eq(0)").text());
		if(amount+paid>shouldpay){
			alert("收多款项,请返回重填");
			return false;
		}else if(amount+paid==shouldpay){
			alert("收款成功");
			$("input[name='stateid']").val(2);
		}else{
			if(!confirm("没有收到完整款项，确定吗？")){
				return false;
			}else{
				
			}
		}
	}
}

/**
 * @date 2016/10/24
 * @author 陈
 * 财务操作的内容
 */
function OwnModel(){
	var signcheckbox = $("input[name^='sign']:checkbox:checked");
	if(signcheckbox.length!=1){
		alert("请选择单条数据操作！")
	}else{
		var d = new Date();
		var str = d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate();
		var handler =$.trim($(".navbar li:eq(0) a").text());
		handler = handler.substr(handler.indexOf('['),handler.length);
		$("input[name='time']").val(str);
		$("input[name='handler']").text(handler);
		$.ajax({
			type : 'POST',
    		url : 'signed/BackFreeId.do',
    		dataType :'json',
    		async:false, //这是重要的一步，防止重复提交的
    		data : { "sid" : signcheckbox.val()},
    		success : function(data){
    			for(var obj in data){
    				$("input[name='scustomername']").val(data[obj].scustomername);
    				$("input[name='sid']").text(data[obj].sid);
    				$("input[name='scustomercardid']").text(data[obj].scustomercardid);
    				$("input[name='scustomerbankcardid']").text(data[obj].scustomerbankcardid);
    				$("input[name='backfee']").text(data[obj].backfee);
    				$("input[name='backfee']").text(data[obj].backfee);
    				$("input[name='backfee']").text(data[obj].backfee);
    			}
    		}
		})
		$("#incomeinfo").show();
		
	}
};

  