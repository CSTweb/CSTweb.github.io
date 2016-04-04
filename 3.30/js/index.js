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
	$(".course-a2").click(function(){
            $(".course-a").removeClass('course-a-active');
            $(".course-a2").addClass('course-a-active');
           	$(".course-icon1").css(
           	  "background-position","0 -54px"
              );
            $(".course-icon2").css(
              "background-position","-54px 0"
              );
            $(".course-icon3").css(
              "background-position","-108px -54px"
              );
            $(".course-icon4").css(
              "background-position","-162px -54px"
              );
            $(".course-icon5").css(
              "background-position","-216px -54px"
              );
            $(".course-content").css("display","none");
            $(".course-content2").css("display","block");

    });
    $(".course-a3").click(function(){
            $(".course-a").removeClass('course-a-active');
            $(".course-a3").addClass('course-a-active');
           	$(".course-icon1").css(
           	  "background-position","0 -54px"
              );
            $(".course-icon2").css(
              "background-position","-54px -54px"
              );
            $(".course-icon3").css(
              "background-position","-108px 0"
              );
            $(".course-icon4").css(
              "background-position","-162px -54px"
              );
            $(".course-icon5").css(
              "background-position","-216px -54px"
              );
            $(".course-content").css("display","none");
            $(".course-content3").css("display","block");

    });
    $(".course-a4").click(function(){
            $(".course-a").removeClass('course-a-active');
            $(".course-a4").addClass('course-a-active');
           	$(".course-icon1").css(
           	  "background-position","0 -54px"
              );
            $(".course-icon2").css(
              "background-position","-54px -54px"
              );
            $(".course-icon3").css(
              "background-position","-108px -54px"
              );
            $(".course-icon4").css(
              "background-position","-162px -0"
              );
            $(".course-icon5").css(
              "background-position","-216px -54px"
              );
            $(".course-content").css("display","none");
            $(".course-content4").css("display","block");

    });
    $(".course-a5").click(function(){
            $(".course-a").removeClass('course-a-active');
            $(".course-a5").addClass('course-a-active');
           	$(".course-icon1").css(
           	  "background-position","0 -54px"
              );
            $(".course-icon2").css(
              "background-position","-54px -54px"
              );
            $(".course-icon3").css(
              "background-position","-108px -54px"
              );
            $(".course-icon4").css(
              "background-position","-162px -54px"
              );
            $(".course-icon5").css(
              "background-position","-216px 0"
              );
            $(".course-content").css("display","none");
            $(".course-content5").css("display","block");

    });
    $(".course-a1").click(function(){
            $(".course-a").removeClass('course-a-active');
            $(".course-a1").addClass('course-a-active');
           	$(".course-icon1").css(
           	  "background-position","0 0"
              );
            $(".course-icon2").css(
              "background-position","-54px -54px"
              );
            $(".course-icon3").css(
              "background-position","-108px -54px"
              );
            $(".course-icon4").css(
              "background-position","-162px -54px"
              );
            $(".course-icon5").css(
              "background-position","-216px -54px"
              );
            $(".course-content").css("display","none");
            $(".course-content1").css("display","block");

    });	
	
	$("li.selection1>a").click(function() {
		$("li.selection>a").css("color","#333")
		$("li.selection1>a").css("color","#fff")
		$(".teacher-list").hide();
		$(".teacher-list1").show();
	});
	$("li.selection2>a").click(function() {
		$("li.selection>a").css("color","#333")
		$("li.selection2>a").css("color","#fff")
		$(".teacher-list").hide();
		$(".teacher-list2").show();
	});
	$("li.selection3>a").click(function() {
		$("li.selection>a").css("color","#333")
		$("li.selection3>a").css("color","#fff")
		$(".teacher-list").hide();
		$(".teacher-list3").show();
	});
	
	
	


	try {
		if (window.console && window.console.log) {
			console.log("%c全心学技术，用心去生活 —— 爱特工作室", "color:red");
			console.log("本网站由 爱特工作室 设计制作\n中国海洋大学 信息学院北楼B505，学生实践中心\n介绍视频：http://v.youku.com/v_show/id_XNzYyMTU2OTg0.html");
		}
	} catch(e) {}
});

