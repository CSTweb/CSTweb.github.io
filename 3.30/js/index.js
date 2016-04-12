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

	// course页 课程模块header 控制
 	$("a.course-a").each(function(index, el) {
 		$(this).hover(function() {
 			$(".course-a").removeClass('course-a-active');
			$(this).addClass('course-a-active');
			$($(".course-icon")[0]).css(
           	  "background-position","0 -54px"
              );
            $($(".course-icon")[1]).css(
              "background-position","-54px -54px"
              );
            $($(".course-icon")[2]).css(
              "background-position","-108px -54px"
              );
            $($(".course-icon")[3]).css(
              "background-position","-162px -54px"
              );
            $($(".course-icon")[4]).css(
              "background-position","-216px -54px"
              );
            $(".course-content").hide();
            $($(".course-content")[index]).show();
			switch(index)
			{
				case 0:
					$($(".course-icon")[index]).css("background-position","0 0");
					break;
				case 1:
					$($(".course-icon")[index]).css("background-position","-54px 0");
					break;
				case 2:
					$($(".course-icon")[index]).css("background-position","-108px 0");
					break;
				case 3:
					$($(".course-icon")[index]).css("background-position","-162px 0");
					break;
				case 4:
					$($(".course-icon")[index]).css("background-position","-216px 0");
					break;				
				default:
					break;
			}
 		});
 	});
	//课程模块 mobie-header控制
	$("a.course-ma").each(function(index, el) {
		$(this).on('click', function() {
			$(".course-ma").removeClass('course-ma-active');
			$(this).addClass('course-ma-active');
			$(".course-content").hide();
			$($(".course-content")[index]).show();
		});
	});
	//teacher-list页 right-header中的导航的控制

	$("li.selection>a").each(function(index, el) {
		$(this).on('click', function() {
			$("li.selection>a").css("color","#333");
			$(this).css("color","#fff");
			$(".teacher-list-all").hide();
			$($(".teacher-list-all")[index]).show();
		});
	});
	
	
	


	try {
		if (window.console && window.console.log) {
			console.log("%c全心学技术，用心去生活 —— 爱特工作室", "color:red");
			console.log("本网站由 爱特工作室 设计制作\n中国海洋大学 信息学院北楼B505，学生实践中心\n介绍视频：http://v.youku.com/v_show/id_XNzYyMTU2OTg0.html");
		}
	} catch(e) {}
});

