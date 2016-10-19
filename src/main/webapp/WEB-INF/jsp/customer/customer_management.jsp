<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>客户管理</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link href="<%=basePath%>css/datePicker.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>css/public.css" rel="stylesheet" type="text/css">
<link href=" <%=basePath%>css/add_stu.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/pageGroup.css"/>
<style type="text/css">
	.date_picker{width:226px;background: #fefefe;border: 1px solid #bbb;font-size:14px;color: #333;padding:7px;border-radius:3px;}
	/*---------------------------------------demo css--------------------------------------------*/
	.date_selector, .date_selector *{width: auto;height: auto;border: none;background: none;margin: 0;padding: 0;text-align: left;text-decoration: none;}
	.date_selector{background:#fbfbfb;border: 1px solid #ccc;padding: 10px;margin:0;margin-top:-1px;position: absolute;z-index:100000;display:none;border-radius: 3px;box-shadow: 0 0 5px #aaa;box-shadow:0 2px 2px #ccc; width:220px;}
	.date_selector_ieframe{position: absolute;z-index: 99999;display: none;}
	.date_selector .nav{width: 17.5em;}
	.date_selector .nav p{clear: none;}
	.date_selector .month_nav, .date_selector .year_nav{margin: 0 0 3px 0;padding: 0;display: block;position: relative;text-align: center;}
	.date_selector .month_nav{float: left;width: 42%;}
	.date_selector .year_nav{float: right;width: 43%;margin-right: 0px;}
	.date_selector .month_name, .date_selector .year_name{font-weight: bold;line-height: 20px; font-size: 12px; }
	.date_selector .button{display: block;position: absolute;top: 0;width:18px;height:18px;line-height:16px;font-weight:bold;color:#5985c7;text-align: center;font-size:12px;overflow:hidden;border: 1px solid #ccc;border-radius:2px;}
	.date_selector .button:hover, .date_selector .button.hover{background:#5985c7;color: #fff;cursor: pointer;border-color:#3a930d;}
	.date_selector .prev{left: 0;}
	.date_selector .next{right: 0;}
	.date_selector table{border-spacing: 0;border-collapse: collapse;clear: both;margin: 0; width:220px;}
	.date_selector th, .date_selector td{width: 2.5em;height: 2em;padding: 0 !important;text-align: center !important;color: #666;font-weight: normal;}
	.date_selector th{font-size: 12px;}
	.date_selector td{border:1px solid #f1f1f1;line-height: 2em;text-align: center;white-space: nowrap;color:#5985c7;background: #fff;}
	.date_selector td.today{background: #eee;}
	.date_selector td.unselected_month{color: #ccc;}
	.date_selector td.selectable_day{cursor: pointer;}
	.date_selector td.selected{background:#2b579a;color: #fff;font-weight: bold;}
	.date_selector td.selectable_day:hover, .date_selector td.selectable_day.hover{background:#5985c7;color: #fff;}
	
</style>
<script type="text/javascript" src="<%=basePath%>js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery.tab.js"></script>
<script type="text/javascript" src="<%=basePath%>myjs/add_stu.js"></script>
<script type="text/javascript" src="<%=basePath%>myjs/pageGroup.js"></script>
<script type="text/javascript">
	DateInput = (function($) {
		function DateInput(el, opts) {
			if (typeof(opts) != "object") opts = {};
			$.extend(this, DateInput.DEFAULT_OPTS, opts);
			this.input = $(el);
			this.bindMethodsToObj("show", "hide", "hideIfClickOutside", "keydownHandler", "selectDate");
			this.build();
			this.selectDate();
			this.hide()
		};
		DateInput.DEFAULT_OPTS = {
			month_names: ["一月份", "二月份", "三月份", "四月份", "五月份", "六月份", "七月份", "八月份", "九月份", "十月份", "十一月份", "十二月份"],
			short_month_names: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"],
			short_day_names: ["日", "一", "二", "三", "四", "五", "六"],
			start_of_week: 1
		};
		DateInput.prototype = {
			build: function() {
				var monthNav = $('<p class="month_nav">' + '<a class="button prev" title="[Page-Up]">&#171;</a>' + ' <a class="month_name"></a> ' + '<a class="button next" title="[Page-Down]">&#187;</a>' + '</p>');
				this.monthNameSpan = $(".month_name", monthNav);
				$(".prev", monthNav).click(this.bindToObj(function() {
					this.moveMonthBy( - 1)
				}));
				$(".next", monthNav).click(this.bindToObj(function() {
					this.moveMonthBy(1)
				}));
				var yearNav = $('<p class="year_nav">' + '<a class="button prev" title="[Ctrl+Page-Up]">&#171;</a>' + ' <a class="year_name"></a> ' + '<a class="button next" title="[Ctrl+Page-Down]">&#187;</a>' + '</p>');
				this.yearNameSpan = $(".year_name", yearNav);
				$(".prev", yearNav).click(this.bindToObj(function() {
					this.moveMonthBy( - 12)
				}));
				$(".next", yearNav).click(this.bindToObj(function() {
					this.moveMonthBy(12)
				}));
				var nav = $('<div class="nav"></div>').append(monthNav, yearNav);
				var tableShell = "<table><thead><tr>";
				$(this.adjustDays(this.short_day_names)).each(function() {
					tableShell += "<th>" + this + "</th>"
				});
				tableShell += "</tr></thead><tbody></tbody></table>";
				this.dateSelector = this.rootLayers = $('<div class="date_selector"></div>').append(nav, tableShell).insertAfter(this.input);
				if ($.browser.msie && $.browser.version < 7) {
					this.ieframe = $('<iframe class="date_selector_ieframe" frameborder="0" src="#"></iframe>').insertBefore(this.dateSelector);
					this.rootLayers = this.rootLayers.add(this.ieframe);
					$(".button", nav).mouseover(function() {
						$(this).addClass("hover")
					});
					$(".button", nav).mouseout(function() {
						$(this).removeClass("hover")
					})
				};
				this.tbody = $("tbody", this.dateSelector);
				this.input.change(this.bindToObj(function() {
					this.selectDate()
				}));
				this.selectDate()
			},
			selectMonth: function(date) {
				var newMonth = new Date(date.getFullYear(), date.getMonth(), 1);
				if (!this.currentMonth || !(this.currentMonth.getFullYear() == newMonth.getFullYear() && this.currentMonth.getMonth() == newMonth.getMonth())) {
					this.currentMonth = newMonth;
					var rangeStart = this.rangeStart(date),
					rangeEnd = this.rangeEnd(date);
					var numDays = this.daysBetween(rangeStart, rangeEnd);
					var dayCells = "";
					for (var i = 0; i <= numDays; i++) {
						var currentDay = new Date(rangeStart.getFullYear(), rangeStart.getMonth(), rangeStart.getDate() + i, 12, 00);
						if (this.isFirstDayOfWeek(currentDay)) dayCells += "<tr>";
						if (currentDay.getMonth() == date.getMonth()) {
							dayCells += '<td class="selectable_day" date="' + this.dateToString(currentDay) + '">' + currentDay.getDate() + '</td>'
						} else {
							dayCells += '<td class="unselected_month" date="' + this.dateToString(currentDay) + '">' + currentDay.getDate() + '</td>'
						};
						if (this.isLastDayOfWeek(currentDay)) dayCells += "</tr>"
					};
					this.tbody.empty().append(dayCells);
					this.monthNameSpan.empty().append(this.monthName(date));
					this.yearNameSpan.empty().append(this.currentMonth.getFullYear());
					$(".selectable_day", this.tbody).click(this.bindToObj(function(event) {
						this.changeInput($(event.target).attr("date"))
					}));
					$("td[date=" + this.dateToString(new Date()) + "]", this.tbody).addClass("today");
					$("td.selectable_day", this.tbody).mouseover(function() {
						$(this).addClass("hover")
					});
					$("td.selectable_day", this.tbody).mouseout(function() {
						$(this).removeClass("hover")
					})
				};
				$('.selected', this.tbody).removeClass("selected");
				$('td[date=' + this.selectedDateString + ']', this.tbody).addClass("selected")
			},
			selectDate: function(date) {
				if (typeof(date) == "undefined") {
					date = this.stringToDate(this.input.val())
				};
				if (!date) date = new Date();
				this.selectedDate = date;
				this.selectedDateString = this.dateToString(this.selectedDate);
				this.selectMonth(this.selectedDate)
			},
			changeInput: function(dateString) {
				this.input.val(dateString).change();
				this.hide()
			},
			show: function() {
				this.rootLayers.css("display", "block");
				$([window, document.body]).click(this.hideIfClickOutside);
				this.input.unbind("focus", this.show);
				$(document.body).keydown(this.keydownHandler);
				this.setPosition()
			},
			hide: function() {
				this.rootLayers.css("display", "none");
				$([window, document.body]).unbind("click", this.hideIfClickOutside);
				this.input.focus(this.show);
				$(document.body).unbind("keydown", this.keydownHandler)
			},
			hideIfClickOutside: function(event) {
				if (event.target != this.input[0] && !this.insideSelector(event)) {
					this.hide()
				}
			},
			insideSelector: function(event) {
				var offset = this.dateSelector.position();
				offset.right = offset.left + this.dateSelector.outerWidth();
				offset.bottom = offset.top + this.dateSelector.outerHeight();
				return event.pageY < offset.bottom && event.pageY > offset.top && event.pageX < offset.right && event.pageX > offset.left
			},
			keydownHandler: function(event) {
				switch (event.keyCode) {
				case 9:
				case 27:
					this.hide();
					return;
					break;
				case 13:
					this.changeInput(this.selectedDateString);
					break;
				case 33:
					this.moveDateMonthBy(event.ctrlKey ? -12 : -1);
					break;
				case 34:
					this.moveDateMonthBy(event.ctrlKey ? 12 : 1);
					break;
				case 38:
					this.moveDateBy( - 7);
					break;
				case 40:
					this.moveDateBy(7);
					break;
				case 37:
					this.moveDateBy( - 1);
					break;
				case 39:
					this.moveDateBy(1);
					break;
				default:
					return
				}
				event.preventDefault()
			},
			stringToDate: function(string) {
				var matches;
				if (matches = string.match(/^(\d{1,2}) ([^\s]+) (\d{4,4})$/)) {
					return new Date(matches[3], this.shortMonthNum(matches[2]), matches[1], 12, 00)
				} else {
					return null
				}
			},
			dateToString: function(date) {
				return date.getFullYear()+"-"+this.short_month_names[date.getMonth()]+"-" +date.getDate()
			},
			setPosition: function() {
				var offset = this.input.offset();
				this.rootLayers.css({
					top: offset.top + this.input.outerHeight(),
					left: offset.left
				});
				if (this.ieframe) {
					this.ieframe.css({
						width: this.dateSelector.outerWidth(),
						height: this.dateSelector.outerHeight()
					})
				}
			},
			moveDateBy: function(amount) {
				var newDate = new Date(this.selectedDate.getFullYear(), this.selectedDate.getMonth(), this.selectedDate.getDate() + amount);
				this.selectDate(newDate)
			},
			moveDateMonthBy: function(amount) {
				var newDate = new Date(this.selectedDate.getFullYear(), this.selectedDate.getMonth() + amount, this.selectedDate.getDate());
				if (newDate.getMonth() == this.selectedDate.getMonth() + amount + 1) {
					newDate.setDate(0);
				};
				this.selectDate(newDate);
			},
			moveMonthBy: function(amount) {
				var newMonth = new Date(this.currentMonth.getFullYear(), this.currentMonth.getMonth() + amount, this.currentMonth.getDate());
				this.selectMonth(newMonth);
			},
			monthName: function(date) {
				return this.month_names[date.getMonth()];
			},
			bindToObj: function(fn) {
				var self = this;
				return function() {
					return fn.apply(self, arguments);
				}
			},
			bindMethodsToObj: function() {
				for (var i = 0; i < arguments.length; i++) {
					this[arguments[i]] = this.bindToObj(this[arguments[i]]);
				}
			},
			indexFor: function(array, value) {
				for (var i = 0; i < array.length; i++) {
					if (value == array[i]) return i;
				}
			},
			monthNum: function(month_name) {
				return this.indexFor(this.month_names, month_name);
			},
			shortMonthNum: function(month_name) {
				return this.indexFor(this.short_month_names, month_name);
			},
			shortDayNum: function(day_name) {
				return this.indexFor(this.short_day_names, day_name);
			},
			daysBetween: function(start, end) {
				start = Date.UTC(start.getFullYear(), start.getMonth(), start.getDate());
				end = Date.UTC(end.getFullYear(), end.getMonth(), end.getDate());
				return (end - start) / 86400000;
			},
			changeDayTo: function(dayOfWeek, date, direction) {
				var difference = direction * (Math.abs(date.getDay() - dayOfWeek - (direction * 7)) % 7);
				return new Date(date.getFullYear(), date.getMonth(), date.getDate() + difference);
			},
			rangeStart: function(date) {
				return this.changeDayTo(this.start_of_week, new Date(date.getFullYear(), date.getMonth()), -1);
			},
			rangeEnd: function(date) {
				return this.changeDayTo((this.start_of_week - 1) % 7, new Date(date.getFullYear(), date.getMonth() + 1, 0), 1);
			},
			isFirstDayOfWeek: function(date) {
				return date.getDay() == this.start_of_week;
			},
			isLastDayOfWeek: function(date) {
				return date.getDay() == (this.start_of_week - 1) % 7;
			},
			adjustDays: function(days) {
				var newDays = [];
				for (var i = 0; i < days.length; i++) {
					newDays[i] = days[(i + this.start_of_week) % 7]
				};
				return newDays;
			}
		};
		$.fn.date_input = function(opts) {
			return this.each(function() {
				new DateInput(this, opts)
			});
		};
		$.date_input = {
			initialize: function(opts) {
				$("input.date_input").date_input(opts)
			}
		};
		return DateInput;
	})(jQuery);
</script>

</head>

<body>
	<input type="hidden" id="pagecount" value="${pages }">
	<input type="hidden" id="part" value="${loginemp.pid }">
	<input type="hidden" id="statusLog" value="1">
	<div id="dcMain">
		<!-- 当前位置 -->
		<div id="urHere">
			长沙ETC客户关系管理中心<b>></b><strong>客户管理</strong>
		</div>
		<div class="mainBox"
			style="height:auto!important;height:550px;min-height:550px;">
			<h3>
				<c:if test="${loginemp.pid eq '1'}">  
					<a class="actionBtn add" onclick="ShowDiv('MyDiv','fade')">新增客户</a>
				</c:if>
				客户管理
			</h3>
			<script type="text/javascript">
				$(function() {
					$(".idTabs").idTabs();
					$("#chostel").date_input();
				});
			</script>
			
			
			<div class="idTabs">
				<ul class="tab">
					<li>
						<a href="#customer_info" onclick="statuschange(1)">客户信息</a>
					</li>
					<li>
						<a href="#customer_status" onclick="checkCustomerStatus(${loginemp.pid},1)">客户状态</a>
					</li>
					<li>
						<a href="#customer_select" >客户查询</a>
					</li>
					<!-- <li>
						<a href="#customer_log">客户记录</a>
					</li>
					<li>
						<a href="#customer_contact">客户联系人</a>
					</li> -->
				</ul>
				<div class="customer_info">
					<form action="" method="post" enctype="multipart/form-data">
						<div id="customer_info">
							<table width="100%" border="0" cellpadding="8" cellspacing="0"
								class="tableBasic" id="customerInfo">
								<tr>
									<th>姓名</th>
									<th>性别</th>
									<th>电话</th>
									<th>qq</th>
									<th>学校</th>
									<th>专业</th>
									<th>年级</th>
									<th>操作</th>
								</tr>
							<c:forEach items="${allCostomerInfo }" var="costomer" varStatus="status">
								<tr>
									<td>${costomer.crname}</td>
									<td>${costomer.crsex}</td>
									<td>${costomer.crtel }</td>
									<td>${costomer.cronline }</td>
									<td>${costomer.crschool }</td>
									<td>${costomer.crmajor }</td>
									<td>${costomer.crgrade }</td>
									<td><a href="customer/selectOnecustomer.do?crid=${costomer.crid }">修改 </a></td>
								</tr>
							</c:forEach>
							</table>
						</div>
						
						<div id="customer_status">
							<table width="100%" border="0" cellpadding="8" cellspacing="0"
								class="tableBasic" id="customerStatusTable">
								
							</table>
						</div>
						<div id="customer_select">
							<table width="100%" border="0" cellpadding="8" cellspacing="0"
								class="tableBasic" id="selectCusTable">
							</table>
							<div>
								<input type="text" id="cusName" placeholder="请输入客户名"><input type="button" class="btn" onclick="customerByName()" value="查询">
							</div>
						</div>
						<!-- <div id="customer_log">
							<table width="100%" border="0" cellpadding="8" cellspacing="0"
								class="tableBasic">
								<tr>
									<th width="131">名称</th>
									<th>内容</th>
								</tr>
							</table>
						</div>
						<div id="customer_contact">
							<table width="100%" border="0" cellpadding="8" cellspacing="0"
								class="tableBasic">
								<tr>
								
									<th width="131">名称</th>
									<th>内容</th>
								</tr>
							</table>
						</div> -->
					</form>
				</div>
		</div>
		<div>
			<div id="pageGro" class="cb">
				<div class="pageUp">上一页</div>
				    <div class="pageList">
				        <ul>
				            <li>1</li>
				            <li>2</li>
				            <li>3</li>
				            <li>4</li>
				            <li>5</li>
				        </ul>
				    </div>
			    <div class="pageDown">下一页</div>
			</div>
		</div>
		
	</div>
	</div>

	<!--弹出层时背景层DIV-->
	<div id="fade" class="black_overlay"></div>
	<div id="MyDiv" class="white_content">

		<form id="payment" action="customer/addCustomer.do" method="post" onsubmit="return checkCoutomer()">
			<%-- <input type="hidden" name="pid" value="${loginper.pid }"> --%>
			<div style="text-align: right; cursor: default;">
				<span onclick="CloseDiv('MyDiv','fade')">×</span>
			</div>
			<fieldset>
				<legend>客户详细资料</legend>
				<ol>
					<li>
						<label for="uname">*&nbsp;客户姓名：</label>
						<input id="uname" name="crname" type="text" placeholder="请输入客户名"
							required autofocus maxlength="20" onkeyup="value=value.replace(/[ -~]/g,'')">
					</li>
					<li>
						<label for="crsex">*&nbsp;性别：</label>
						<input id="man" name="crsex" type="radio" checked="checked" value="男">男
						&nbsp;&nbsp;<input id="woman" name="crsex" type="radio" value="女">女
					</li>
					<li>
						<label for="utel">*&nbsp;电话：</label>
						<input id="utel" name="crtel" maxlength="11" onkeyup="value=value.replace(/[^\d]/g,'')"  type="tel" required>
					</li>
					<li>
						<label for="uqq">qq：</label>
						<input id="uqq" name="cronline" maxlength="25" onkeyup="value=value.replace(/[^\d]/g,'')">
					</li>
					<li>
						<label for="uschool">学校院系：</label>
						<input id="uschool" name="crschool" type="text" placeholder="请输入学校院系名称"
							required autofocus maxlength="30" onkeyup="value=value.replace(/[ -~]/g,'')">
					</li>
					<li>
						<label for="umajor">专业：</label>
						<input id="umajor" name="crmajor" type="text"
							 autofocus maxlength="20" onkeyup="value=value.replace(/[ -~]/g,'')">
					</li>
					<li>
						<label for="uclass">年级：</label>
						<input id="uclass" name="crgrade" type="text"
							 autofocus maxlength="10">
					</li>
					<li>
						<label for="cremark">备注：</label>
						<textarea id="cremark" name="cremark"></textarea>
					</li>
				</ol>
			</fieldset>
			<div id="customerbtn">
				<button type="submit">确定</button>
			</div>
		</form>
	</div>
	<div class="clear"></div>
	
</body>
</html>
