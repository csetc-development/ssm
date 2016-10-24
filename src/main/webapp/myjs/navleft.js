//(分页部分可能代码有问题，之后新加的JS一律放到分页前面)
$(document).ready(function(){
	alert("dasdas");
	alert(nav);
});
//首页
function emp(){
	document.getElementById("emp").setAttribute("class","active");
	document.getElementById("signed1").setAttribute("class","");
	document.getElementById("signed2").setAttribute("class","");
	document.getElementById("user").setAttribute("class","");
}
//签单客户
function signed1(){
	document.getElementById("emp").setAttribute("class","active");
	document.getElementById("signed1").setAttribute("class","");
	document.getElementById("signed2").setAttribute("class","");
	document.getElementById("user").setAttribute("class","");
}
//收入支出
function signed2(){
	document.getElementById("emp").setAttribute("class","active");
	document.getElementById("signed1").setAttribute("class","");
	document.getElementById("signed2").setAttribute("class","");
	document.getElementById("user").setAttribute("class","");
}
//用户管理
function user(){
	window.nav = "user";
	alert("111");
	
}