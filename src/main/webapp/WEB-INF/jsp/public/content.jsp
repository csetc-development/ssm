<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<style>  
 html, body{height: 100%}
</style>
<!-- 引入 ECharts 文件 -->
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li class="active"><a href="<%=basePath %>emp/adminindex.do">首页<span class="sr-only">(current)</span></a></li>
					<li><a href="<%=basePath %>signed/signedinfo.do">签单客户</a></li>
					<li><a href="<%=basePath %>signed/firstincomepay.do">收入与支出</a></li>
<!-- 					<li><a href="<%=basePath %>customer/manager.do">客户管理</a></li> -->
<!-- 					<li><a href="<%=basePath %>etcclass/management.do">班级管理</a></li> -->
<!-- 					<li><a href="<%=basePath %>student/management.do">学员管理</a></li> -->
<!-- 					<li><a href="<%=basePath %>student/stayinfo.do">宿舍管理</a></li> -->
				</ul>
				<ul class="nav nav-sidebar">
<!-- 					<li><a href="<%=basePath %>paycode/reports.do">数据统计</a></li> -->
<!-- 					<li><a href="<%=basePath %>empinfo/showMe.do"><i class="manager"></i>个人中心</a></li> -->
<!-- 					<li><a href="<%=basePath %>admin/manager.do"><i class="manager"></i>管理员</a></li> -->
<!-- 					<li><a href="">中文</a></li> -->
				</ul>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<div class="container" style="height:20px;"></div>
				<div class="container" id="echartsmain" style="width: 75%;height:80%;"></div>
			</div>
		</div>
	</div>


	<!-- <script type="text/javascript">
		$(document).ready(function() {
			getData();
		})

		function getData(date) {
			var salename = [];
			var salemoney = [];
			$.ajax({
				type : 'POST',
				url : '../paycode/ranking.do',
				dataType : 'json',
				data : {
					"date" : date
				},
				success : function(data) {
					if (data) {
						$.each(data, function(i, p) {
							salename[i] = p['ename'];
							salemoney[i] = p['money'];
						});
					}
					setOption(salename, salemoney);
				}
			});
		}

		function setOption(salename, salemoney) {
			// 基于准备好的dom，初始化echarts实例
			var myChart = echarts.init(document.getElementById('echartsmain'));
			// 指定图表的配置项和数据
			var option = {
				title : {
					text : '班级就业排名'
				},
				tooltip : {
					trigger : 'axis'
				},
				legend : {
					data : [ '人数' ]
				},
				toolbox : {
					show : true,
					feature : {
						mark : {
							show : true
						},//标记
						dataView : {
							show : true,
							readOnly : false
						},//数据视图
						magicType : {
							show : true,
							type : [ 'line', 'bar' ]
						},//魔法型线条
						restore : {
							show : true
						},//还原
						saveAsImage : {
							show : true
						}
					//保存为图像
					}
				},
				calculable : true,//能预算的
				xAxis : {
					type : 'category',//连续型
					//             	boundaryGap:false,//间隙
					data : salename
				},
				yAxis : [ {
					type : 'value',
					axisLabel : {
						formatter : '{value}人'
					}
				} ],
				series : [ {
					name : '人数',
					type : 'bar',
					data : salemoney
				} ]
			};
			// 使用刚指定的配置项和数据显示图表。
			myChart.setOption(option);
		}
	</script> -->
<script type="text/javascript">
	 $(document).ready(function() {
// 			getData();
			setOption();
		})
/*
		function getData(date) {
			var salename = [];
			var salemoney = [];
			$.ajax({
				type : 'POST',
				url : '../paycode/ranking.do',
				dataType : 'json',
				data : {
					"date" : date
				},
				success : function(data) {
					if (data) {
						$.each(data, function(i, p) {
							salename[i] = p['ename'];
							salemoney[i] = p['money'];
						});
					}
					setOption(salename, salemoney);
				}
			});
		} */

		function setOption() {
			// 基于准备好的dom，初始化echarts实例
			var myChart = echarts.init(document.getElementById('echartsmain'));
			// 指定图表的配置项和数据
			var option = {
				title : {
					text : '班级就业排名'
				},
				tooltip : {
					trigger : 'axis'
				},
				legend : {
					data : [ '人数' ]
				},
				toolbox : {
					show : true,
					feature : {
						mark : {
							show : true
						},//标记
						dataView : {
							show : true,
							readOnly : false
						},//数据视图
						magicType : {
							show : true,
							type : [ 'line', 'bar' ]
						},//魔法型线条
						restore : {
							show : true
						},//还原
						saveAsImage : {
							show : true
						}
					//保存为图像
					}
				},
				calculable : true,//能预算的
				xAxis : {
					type : 'category',//连续型
					//             	boundaryGap:false,//间隙
					data : ['java-20160301-jy','java-20160423-jy','java-20160612-jy','java-20160728-jy','java-20160930-jy']
				},
				yAxis : [ {
					type : 'value',
					axisLabel : {
						formatter : '{value}人'
					}
				} ],
				series : [ {
					name : '人数',
					type : 'bar',
					data : [32,30,25,27,5]
				} ]
			};
			// 使用刚指定的配置项和数据显示图表。
			myChart.setOption(option);
		}
	</script>
	<!-- Bootstrap core JavaScript  ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	
	<script src="<%=basePath %>js/bootstrap.js"></script>
	<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
	<!-- <script src="Dashboard_files/holder.htm"></script> -->
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="<%=basePath %>js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>