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
	
	
	// 디테일 페이지 상품 개수에 따른 계산...
	var sell_price = parseInt($("#sell_price").val() || 0);
	var amount = parseInt($(".buy-amount").val() || 0);
	var sum = $("#sum").val();
		sum = sell_price;  // onload가 되면 다 더한 값이 기존 가격으로 설정
		
	$(".buy-amount").on("keyup",function(){  // amount 값이 바뀌면
		sum = amount * sell_price;
	});
	
    $(".xi-angle-up-min").on("click",function(){  // add가 되면
    	amount++;
	});
    
    $(".xi-angle-down-min").on("click",function(){  // del가 되면
		if(amount > 1){
			amount--;
		}
	});
    
    $("#tab1").on("click",function(){
    	var offset = $(".product-detail-tableBox").offset();
    	
    	$("html").animate({scrollTop:offset.top}, 400);
    	$("#tab1").addClass("on");
    	$("#tab2").removeClass("on");
    	$("#tab3").removeClass("on");
    	$("#tab4").removeClass("on");
    			
    });
    
    $("#tab2").on("click",function(){
    	var offset = $(".product-review-box").offset().top+1;
    	
    	$("html").animate({scrollTop:offset},400);
    	$("#tab2").addClass("on");
    	$("#tab1").removeClass("on");
    	$("#tab3").removeClass("on");
    	$("#tab4").removeClass("on");
    });
    
    $("#tab3").on("click",function(){
    	var offset = $(".product-qna-box").offset().top+1;
    	
    	$("html").animate({scrollTop:offset},400);
    	$("#tab3").addClass("on");
    	$("#tab2").removeClass("on");
    	$("#tab1").removeClass("on");
    	$("#tab4").removeClass("on");
    });
    
    $("#tab4").on("click",function(){
    	var offset = $(".baesong-info-box").offset().top+1;
    	
    	$("html").animate({scrollTop:offset},400);
    	$("#tab4").addClass("on");
    	$("#tab2").removeClass("on");
    	$("#tab3").removeClass("on");
    	$("#tab1").removeClass("on");
    });
    
    /*모달 창에 대한 스크립*/
    $(".qna-button").on("click",function(){
    	$(".qna-modal-box").css({
    		"display":"block"
    	});
    	$(".qna-modal-content-box").css({
    		"display":"block"
    	});
    });
   
    $(".modal-close").on("click",function(){
    	$(".qna-modal-box").css({
    		"display":"none"
    	});
    	$(".qna-modal-content-box").css({
    		"display":"none"
    	});
    });
    
    $(".modal-close").on("click",function(){
    	$(".qna-modal-box").css({
    		"display":"none"
    	});
    	$(".qna-modal-content-box").css({
    		"display":"none"
    	});
    });
    
    $(document).on("mouseup",function(e){
    	var modalContent = $(".qna-modal-content-box");
    	
    	if(modalContent.has(e.target).length == 0){  //modalContent에 이벤트 발생된 개수가 0개이면
    		$(".qna-modal-box").css({
        		"display":"none"
        	});
    		$(".qna-modal-content-box").css({
        		"display":"none"
        	});
    	}
    });
    
    $(window).on("scroll",function(){  //현재의 스크롤 값을 알기 위한 함수
    	var scrollValue = $(document).scrollTop();
    	var reveiwboxScroll = $(".product-review-box").offset();
    	var qnaboxScroll = $(".product-qna-box").offset();
    	var baesongScroll = $(".baesong-info-box").offset();

    	if(scrollValue < 757){   // 스크롤 높이에 따른 탭 변화
    		$("#tab1").removeClass("on");
        	$("#tab2").removeClass("on");
        	$("#tab3").removeClass("on");
        	$("#tab4").removeClass("on");
    	}
    	if(scrollValue > 757){
    		$("#tab1").addClass("on");
        	$("#tab2").removeClass("on");
        	$("#tab3").removeClass("on");
        	$("#tab4").removeClass("on");
    	}
    	if(scrollValue > reveiwboxScroll.top){
    		$("#tab2").addClass("on");
        	$("#tab1").removeClass("on");
        	$("#tab3").removeClass("on");
        	$("#tab4").removeClass("on");
    	}
    	if(scrollValue > qnaboxScroll.top){
    		$("#tab3").addClass("on");
        	$("#tab2").removeClass("on");
        	$("#tab1").removeClass("on");
        	$("#tab4").removeClass("on");
    	}
    	if(scrollValue > baesongScroll.top ){
    		$("#tab4").addClass("on");
        	$("#tab2").removeClass("on");
        	$("#tab3").removeClass("on");
        	$("#tab1").removeClass("on");
    	} 
    	
    	if(scrollValue > 767){  // 탭이 탭 높이에 오면 붙을 수 있도록 함
    		$(".tab-title").css({
    			"position":"fixed",
    			"top":"0",
    			"z-index":"3"
    		});
    	}else{
    		$(".tab-title").css("position","absolute");
    	}
    	
    });
}