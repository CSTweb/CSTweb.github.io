jQuery(document).ready(function($) {
	$("nav>ul>li").hover(function() {
		$(this).children('ul.li-second').stop(true,false).slideDown("fast");
	}, function() {
		$(this).children('ul.li-second').stop(true,false).slideUp("fast");
	});
	$("ul.li-second>li").hover(function() {
		$(this).children('ul.li-third').stop(true,false).slideDown("fast");
	}, function() {
		$(this).children('ul.li-third').stop(true,false).slideUp("fast");
	});


	try {
		if (window.console && window.console.log) {
			console.log("%c全心学技术，用心去生活 —— 爱特工作室", "color:red");
			console.log("本网站由 爱特工作室 设计制作\n中国海洋大学 信息学院北楼B505，学生实践中心\n介绍视频：http://v.youku.com/v_show/id_XNzYyMTU2OTg0.html");
		}
	} catch(e) {}
});

