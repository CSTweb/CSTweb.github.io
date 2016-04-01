// JavaScript Document
// Author: Waydrow
// Date: 2016-01-23
// Changes(每次修改+1): 0

//导航栏
jQuery(document).ready(function($) {
	$("li.second").hover(function() {
		$(this).children('ul').stop(true,false).slideDown("fast");
	}, function() {
		$(this).children('ul').stop(true,false).slideUp("fast");
	});


	try {
		if (window.console && window.console.log) {
			console.log("%c全心学技术，用心去生活 —— 爱特工作室", "color:red");
			console.log("本网站由 爱特工作室 设计制作\n中国海洋大学 信息学院北楼B505，学生实践中心\n介绍视频：http://v.youku.com/v_show/id_XNzYyMTU2OTg0.html");
		}
	} catch(e) {}
});

