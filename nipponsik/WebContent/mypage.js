window.onload = function(){
	$(function(){
		$(".smallcategory").hide();
		$(".categorybtn").mouseover(function(){
			$(".smallcategory").show();
		});
		$(".categorybtn, .smallcategory").mouseleave(function(){
			$(".smallcategory").hide();
		});
	});
	    
	$(".mypage").mouseenter(function () {
		$(".mypagecategory").css({
			"display":"block"
		});
	});
	$(".mypage").mouseleave(function () {  //왜 작동을 안하는지...?
		$(".mypagecategory").css({
			"display":"none"
		});
	});
	
	$(".mainnavicategorybox").mouseover(function () {
		$(".fixdetailcategorytul").css({
			"display":"block"
		});
		$(".absolute-navi").css({
			"display":"block"
		});
	});
	
	$(".fixdetailcategorytul").mouseout(function () {  //제대로 작동을 하지 않음
		$(".fixdetailcategorytul").css({
			"display":"none"
		});
		$(".absolute-navi").css({
			"display":"none"
		});
	});

}