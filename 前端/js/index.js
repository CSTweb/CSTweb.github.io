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
});