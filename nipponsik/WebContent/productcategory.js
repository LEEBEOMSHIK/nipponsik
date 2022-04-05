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
	
	var selValue = $("select[name='seloption']").val();
	$("select[name='seloption']").on("change",function(){
		location.href="select.search?seloption="+ selValue;
	});
	
	//필터 부분 동작 (열고 닫기)
	$("#catefilter1").on("click",function(){
		event.preventDefault();
		$("#catefilterList1").toggleClass("list-on list-off");
		
		if($("#catefilterList1").hasClass("list-on")){
			$("#catefilter1 > i").attr("class","xi-angle-up-min");
		} else if($("#catefilterList1").hasClass("list-off")){
			$("#catefilter1 > i").attr("class","xi-angle-down-min");
		}
	});
	//페이지 링크연결 부분
	$("#catelabel1").on("click",function(){
		location.href="product.nipponsik?cate_list=102";
	});
	$("#catelabel1-deep1").on("click",function(){
		location.href="detail_category.search?detail_category=봉지라면";
	});
	$("#catelabel1-deep2").on("click",function(){
		location.href="detail_category.search?detail_category=컵라면";
	});
	$("#catelabel1-deep3").on("click",function(){
		location.href="detail_category.search?detail_category=기타면류";
	});
	
	//필터 부분 동작 (열고 닫기)
	$("#catefilter2").on("click",function(){
		event.preventDefault();
		$("#catefilterList2").toggleClass("list-on list-off");
		
		if($("#catefilterList2").hasClass("list-on")){
			$("#catefilter2 > i").attr("class","xi-angle-up-min");
		} else if($("#catefilterList2").hasClass("list-off")){
			$("#catefilter2 > i").attr("class","xi-angle-down-min");
		}
	});
	//페이지 링크연결 부분
	$("#catelabel2").on("click",function(){
		location.href="product.nipponsik?cate_list=103";
	});
	$("#catelabel2-deep1").on("click",function(){
		location.href="detail_category.search?detail_category=봉지과자";
	});
	$("#catelabel2-deep2").on("click",function(){
		location.href="detail_category.search?detail_category=샌드";
	});
	$("#catelabel2-deep3").on("click",function(){
		location.href="detail_category.search?detail_category=과자";
	});
	$("#catelabel2-deep4").on("click",function(){
		location.href="detail_category.search?detail_category=비스킷";
	});
	$("#catelabel2-deep5").on("click",function(){
		location.href="detail_category.search?detail_category=캔디";
	});
	$("#catelabel2-deep6").on("click",function(){
		location.href="detail_category.search?detail_category=쿠키";
	});
	
	//필터 부분 동작 (열고 닫기)
	$("#catefilter3").on("click",function(){
		event.preventDefault();
		$("#catefilterList3").toggleClass("list-on list-off");
		
		if($("#catefilterList3").hasClass("list-on")){
			$("#catefilter3 > i").attr("class","xi-angle-up-min");
		} else if($("#catefilterList3").hasClass("list-off")){
			$("#catefilter3 > i").attr("class","xi-angle-down-min");
		}
	});
	//페이지 링크연결 부분
	$("#catelabel3").on("click",function(){
		location.href="product.nipponsik?cate_list=104";
	});
	$("#catelabel3-deep1").on("click",function(){
		location.href="detail_category.search?detail_category=된장류";
	});
	$("#catelabel3-deep2").on("click",function(){
		location.href="detail_category.search?detail_category=김밥 재료";
	});
	$("#catelabel3-deep3").on("click",function(){
		location.href="detail_category.search?detail_category=기타식품";
	});
	
	//필터 부분 동작 (열고 닫기)
	$("#catefilter4").on("click",function(){
		event.preventDefault();
		$("#catefilterList4").toggleClass("list-on list-off");
		
		if($("#catefilterList4").hasClass("list-on")){
			$("#catefilter4 > i").attr("class","xi-angle-up-min");
		} else if($("#catefilterList4").hasClass("list-off")){
			$("#catefilter4 > i").attr("class","xi-angle-down-min");
		}
	});
	//페이지 링크연결 부분
	$("#catelabel4").on("click",function(){
		location.href="product.nipponsik?cate_list=105";
	});
	$("#catelabel4-deep1").on("click",function(){
		location.href="detail_category.search?detail_category=육수";
	});
	$("#catelabel4-deep2").on("click",function(){
		location.href="detail_category.search?detail_category=소스";
	});
	$("#catelabel4-deep3").on("click",function(){
		location.href="detail_category.search?detail_category=간장";
	});
	$("#catelabel4-deep4").on("click",function(){
		location.href="detail_category.search?detail_category=식초";
	});
	
	//필터 부분 동작 (열고 닫기)
	$("#catefilter5").on("click",function(){
		event.preventDefault();
		$("#catefilterList5").toggleClass("list-on list-off");
		
		if($("#catefilterList5").hasClass("list-on")){
			$("#catefilter5 > i").attr("class","xi-angle-up-min");
		} else if($("#catefilterList5").hasClass("list-off")){
			$("#catefilter5 > i").attr("class","xi-angle-down-min");
		}
	});
	//페이지 링크연결 부분
	$("#catelabel5").on("click",function(){
		location.href="product.nipponsik?cate_list=106";
	});
	$("#catelabel5-deep1").on("click",function(){
		location.href="detail_category.search?detail_category=일본주";
	});
	
	//필터 부분 동작 (열고 닫기)
	$("#catefilter6").on("click",function(){
		event.preventDefault();
		$("#catefilterList6").toggleClass("list-on list-off");
		
		if($("#catefilterList6").hasClass("list-on")){
			$("#catefilter6 > i").attr("class","xi-angle-up-min");
		} else if($("#catefilterList6").hasClass("list-off")){
			$("#catefilter6 > i").attr("class","xi-angle-down-min");
		}
	});
	//페이지 링크연결 부분
	$("#catelabel6").on("click",function(){
		location.href="product.nipponsik?cate_list=107";
	});
	$("#catelabel6-deep1").on("click",function(){
		location.href="detail_category.search?detail_category=전통차";
	});
	$("#catelabel6-deep2").on("click",function(){
		location.href="detail_category.search?detail_category=녹차";
	});
	$("#catelabel6-deep3").on("click",function(){
		location.href="detail_category.search?detail_category=홍차";
	});
	$("#catelabel6-deep4").on("click",function(){
		location.href="detail_category.search?detail_category=밀크티";
	});
	
	//필터 부분 동작 (열고 닫기)
	$("#catefilter7").on("click",function(){
		event.preventDefault();
		$("#catefilterList7").toggleClass("list-on list-off");
		
		if($("#catefilterList7").hasClass("list-on")){
			$("#catefilter7 > i").attr("class","xi-angle-up-min");
		} else if($("#catefilterList7").hasClass("list-off")){
			$("#catefilter7 > i").attr("class","xi-angle-down-min");
		}
	});
	//페이지 링크연결 부분
	$("#catelabel7").on("click",function(){
		location.href="product.nipponsik?cate_list=108";
	});
	$("#catelabel7-deep1").on("click",function(){
		location.href="detail_category.search?detail_category=탄산음료";
	});
	$("#catelabel7-deep2").on("click",function(){
		location.href="detail_category.search?detail_category=차 음료";
	});
	$("#catelabel7-deep3").on("click",function(){
		location.href="detail_category.search?detail_category=스포츠음료";
	});
	$("#catelabel7-deep4").on("click",function(){
		location.href="detail_category.search?detail_category=기타음료";
	});
	
	//필터 부분 동작 (열고 닫기)
	$("#catefilter8").on("click",function(){
		event.preventDefault();
		$("#catefilterList8").toggleClass("list-on list-off");
		
		if($("#catefilterList8").hasClass("list-on")){
			$("#catefilter8 > i").attr("class","xi-angle-up-min");
		} else if($("#catefilterList8").hasClass("list-off")){
			$("#catefilter8 > i").attr("class","xi-angle-down-min");
		}
	});
	//페이지 링크연결 부분
	$("#catelabel8").on("click",function(){
		location.href="product.nipponsik?cate_list=109";
	});
	$("#catelabel8-deep1").on("click",function(){
		location.href="detail_category.search?detail_category=즉석식품";
	});
	$("#catelabel8-deep2").on("click",function(){
		location.href="detail_category.search?detail_category=카레";
	});
	$("#catelabel8-deep3").on("click",function(){
		location.href="detail_category.search?detail_category=스프";
	});
	
	//필터 부분 동작 (열고 닫기)
	$("#catefilter9").on("click",function(){
		event.preventDefault();
		$("#catefilterList9").toggleClass("list-on list-off");
		
		if($("#catefilterList9").hasClass("list-on")){
			$("#catefilter9 > i").attr("class","xi-angle-up-min");
		} else if($("#catefilterList9").hasClass("list-off")){
			$("#catefilter9 > i").attr("class","xi-angle-down-min");
		}
	});
	//페이지 링크연결 부분
	$("#catelabel9").on("click",function(){
		location.href="product.nipponsik?cate_list=109";
	});
	$("#catelabel9-deep1").on("click",function(){
		location.href="detail_category.search?detail_category=소고기";
	});
	$("#catelabel9-deep2").on("click",function(){
		location.href="detail_category.search?detail_category=돼지고기";
	});
	
	
	//가격필터 부분 링크연결
	$("#priceFilter2").on("click",function(){
		location.href="priceFilter.search";
	});
	
	$("#priceFilter3").on("click",function(){
		location.href="priceFilter2.search";
	});
	
	$("#priceFilter4").on("click",function(){
		location.href="priceFilter3.search";
	});
	
	$("#priceFilter5").on("click",function(){
		location.href="priceFilter4.search";
	});
	
	$("#priceFilter6").on("click",function(){
		location.href="priceFilter5.search";
	});
	

}