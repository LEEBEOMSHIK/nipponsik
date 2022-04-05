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

}