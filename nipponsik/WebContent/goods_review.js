window.onload = function(){
$(function(){
	$("#cancel").on("click",function(){
		history.back();
	});
	
	$("#star5").on("click",function(){
		$("#star5").attr("src","logo/rate-star.png");
		console.log("클릭");
	});
	
	$("#star-status").on("click",function(){
		console.log("클릭");
	});
});
}