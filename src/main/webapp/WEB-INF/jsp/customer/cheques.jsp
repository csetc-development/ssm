<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>核对收款信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link href="<%=basePath%>css/public.css" rel="stylesheet" type="text/css">
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
		.date_selector .year_nav{float: right;width: 33%;margin-right: 55px;}
		.date_selector .month_name, .date_selector .year_name{font-weight: bold;line-height: 20px; font-size: 12px;}
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
		
		#one{position:relative;}

		.sigpayinfo{
			position:absolute;
			text-align:center; 
			display:block;
			top:30px;
			left:50px;
		}
		
		#sigpaytable{
			color:#0046a6;              /* 表格文字颜色 */  
		    background-color:#d2e8ff;   /* 表格背景色 */  
		    font-family:Arial;          /* 表格字体 */  
		    text-align: center;
		}
		
	</style>
	<script type="text/javascript" src="<%=basePath%>js/jquery-1.8.3.min.js"></script>
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
				var monthNav = $('<p class="month_nav">' + '<span class="button prev" title="[Page-Up]">&#171;</span>' + ' <span class="month_name"></span> ' + '<span class="button next" title="[Page-Down]">&#187;</span>' + '</p>');
				this.monthNameSpan = $(".month_name", monthNav);
				$(".prev", monthNav).click(this.bindToObj(function() {
					this.moveMonthBy( - 1)
				}));
				$(".next", monthNav).click(this.bindToObj(function() {
					this.moveMonthBy(1)
				}));
				var yearNav = $('<p class="year_nav">' + '<span class="button prev" title="[Ctrl+Page-Up]">&#171;</span>' + ' <span class="year_name"></span> ' + '<span class="button next" title="[Ctrl+Page-Down]">&#187;</span>' + '</p>');
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
				return event.pageY < offset.bottom && event.pageY > <offset.top && event.pageX> < offset.right && event.pageX > <offset.left>
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
					newDate.setDate(0)
				};
				this.selectDate(newDate);
			},
			moveMonthBy: function(amount) {
				var newMonth = new Date(this.currentMonth.getFullYear(), this.currentMonth.getMonth() + amount, this.currentMonth.getDate());
				this.selectMonth(newMonth);
			},
			monthName: function(date) {
				return this.month_names[date.getMonth()]
			},
			bindToObj: function(fn) {
				var self = this;
				return function() {
					return fn.apply(self, arguments);
				}
			},
			bindMethodsToObj: function() {
				for (var i = 0; i < arguments.length; i++) {
					this[arguments[i]] = this.bindToObj(this[arguments[i]])
				}
			},
			indexFor: function(array, value) {
				for (var i = 0; i < array.length; i++) {
					if (value == array[i]) return i
				}
			},
			monthNum: function(month_name) {
				return this.indexFor(this.month_names, month_name)
			},
			shortMonthNum: function(month_name) {
				return this.indexFor(this.short_month_names, month_name)
			},
			shortDayNum: function(day_name) {
				return this.indexFor(this.short_day_names, day_name)
			},
			daysBetween: function(start, end) {
				start = Date.UTC(start.getFullYear(), start.getMonth(), start.getDate());
				end = Date.UTC(end.getFullYear(), end.getMonth(), end.getDate());
				return (end - start) / 86400000
			},
			changeDayTo: function(dayOfWeek, date, direction) {
				var difference = direction * (Math.abs(date.getDay() - dayOfWeek - (direction * 7)) % 7);
				return new Date(date.getFullYear(), date.getMonth(), date.getDate() + difference)
			},
			rangeStart: function(date) {
				return this.changeDayTo(this.start_of_week, new Date(date.getFullYear(), date.getMonth()), -1)
			},
			rangeEnd: function(date) {
				return this.changeDayTo((this.start_of_week - 1) % 7, new Date(date.getFullYear(), date.getMonth() + 1, 0), 1)
			},
			isFirstDayOfWeek: function(date) {
				return date.getDay() == this.start_of_week
			},
			isLastDayOfWeek: function(date) {
				return date.getDay() == (this.start_of_week - 1) % 7
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
			})
		};
		$.date_input = {
			initialize: function(opts) {
				$("input.date_input").date_input(opts);
			}
		};
		return DateInput
	})(jQuery);
	</script>
	
	<script type="text/javascript">
	$(function(){
		$(".sign").hide();
		$('#datePicker').date_input();
		var htmlContent="";
		$.ajax({
			type : 'POST',
			url : 'paytype/selectypeall.do',
			dataType :'json',
			async:false,
			data : { "cid" : "" },
			success : function(data) {
				for(var obj in data){
					htmlContent += "<option value='"+data[obj].ptid+"'>"+data[obj].ptname+"</option>";
				}
			}
		});
		$("#ptname").html(htmlContent);
		
		var cid = $("#cid").val();
		var summoney = $("#summoney").html();
		var countmoney;
		$.ajax({
			type : 'POST',
			url : 'payrecord/getcountmoney.do',
			dataType :'json',
			async:false,
			data : { "cid" : cid },
			success : function(data) {
				$("#countmoney").html(data);
				countmoney = data;
				if(summoney <= data){
					alert("已缴清所有费用");
					$(".sign").hide();
				}else{
					$(".sign").show();
				}
				
			}
		});
	});
	
	function mover(cid){
		var htmlContent="";
		$.ajax({
			type : 'POST',
			url : 'payrecord/sigdet.do',
			dataType :'json',
			async:false,
			data : { "cid" : cid },
			success : function(data) {
				if(data.length>0){
					htmlContent += "<tr><th>时间</th><th>缴费类型</th><th>金额</th><th>经手人</th></tr>";
					$.each(data,function(i,p){
						htmlContent += "<tr><td>"+p.prtime;
						htmlContent += "</td><td>"+p.ptname;
						htmlContent += "</td><td>"+p.prpaymoney;
						htmlContent += "</td><td>"+p.ename+"</td></tr>";
					});
					$("#sigpaytable").html(htmlContent);
					$("#sigpayinfo").show();
				}
					
			}
		});
		
	}
	
	function mout(){
		$("#sigpayinfo").hide();
	}
</script>
  </head>
  
  <body>
    <div id="dcMain">
		<!-- 当前位置 -->
		<div id="urHere">
			长沙ETC客户关系管理中心<b>></b>业务管理<b>></b><strong>核对收款信息</strong>
		</div>
		<div class="mainBox"
			style="height:auto!important;height:550px;min-height:550px;">
			<h3>
				核对收款信息
			</h3>
			<form action="payrecord/addrecord.do" method="post">
			<input type="hidden" id="cid" name="prpaycode" value="${sigpay.cid}"/>
				<table class="tableBasic" width="100%" border="0" cellpadding="8" cellspacing="0">
					<tr>
						<td>客户姓名：${sigpay.crname }</td>
						<td>销售：${sigpay.ename }</td>
					</tr>
					<tr>
						<td>客户类型：${sigpay.btname }</td>
						<td>所属区域：${sigpay.aname }</td>
					</tr>
					<tr>
						<td>应缴金额：<span id="summoney">${sigpay.creceivables }</span></td> 
						<td id="one" >已缴金额：<a id="countmoney" onmouseover="mover(${sigpay.cid})" onmouseout="mout()"></a>
							<div id="sigpayinfo" class="sigpayinfo">
								<table id="sigpaytable">
								</table>
							</div>
						</td> 
						
					</tr>
					<tr class="sign">
						<td>经手人 ：${loginemp.ename }</td>
						<td>收款时间：<input type="text" id="datePicker" name="prtime" class="date_picker" placeholder="点击选择日期"/></td>
					</tr>
					<tr class="sign">
						<td>此次缴费类型：<select id="ptname" name="prpaytype"></select></td>
						<td>金额：<input type="text" id="prpaymoney" name="prpaymoney" required onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();"/></td>
					</tr>
					<tr class="sign">
						<td colspan="2"><input type="submit" class="btn" value="确定"/></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
  </body>
</html>
