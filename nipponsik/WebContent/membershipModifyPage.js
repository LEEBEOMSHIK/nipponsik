window.onload = function(){
	$(function(){
		var id = $(".hiddenId").val();
		var pw1 = $("#pw1").val();
		var pw2 = $("#pw2").val();
		var pw3 = $("#pw3").val();
		
		$(".btn1").on("click",function(){
			$(".box-on1").css("display","block");
		});
		
		$(".btn2").on("click",function(){
			$(".box-on2").css("display","block");
		});
		$(".btn3").on("click",function(){
			$(".box-on3").css("display","block");
		});
		$(".btn4").on("click",function(){
			$(".box-on4").css("display","block");
		});
		
		$(".pwChange").on("click",function(){
			if(pw1 == ""){
				$(".detail1").html("현재 비밀번호를 입력하세요.");
				$(".detail1").attr("style","color:#e52528;");
				alert(pw1);
			}
			
			if(pw2 == ""){
				$(".detail2").css("display","block");
				$(".detail3").css("display","block");
				alert(pw2);
			}
			if(pw3 == ""){
				$(".detail5").html("현재 비밀번호를 입력하세요.");
				$(".detail5").attr("style","color:#e52528;");
			}
		});
	});
}
