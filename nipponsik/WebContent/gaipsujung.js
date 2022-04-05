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
	
	
	
	$("#id").on("focusin",function(){
 			$(this).css({
 	 			"border":"2px solid #C6F1E7"});
 	 		$(".changedetailid").css({
 	 			"color": "#8BF7AF",
 	 			"font-size": "10pt",
 	 			"top":"-10px",
 	 			"background-color": "white",
 	 			"width": "76px",
 	 			"padding-right": "0px",
 	 			"transition" : ".5s"
 	 		});
    });
		
	$("#id").on("focusout",function(){
		if($(this).val() != null){
			$(this).css({
				"border":"1px solid #A6A6A6"
		     });
			$(".changedetailid").css({
	 			"color": "#5f6368",
	 			"font-size": "10pt",
	 			"top":"-10px",
	 			"background-color": "white",
	 			"width": "76px",
	 			"padding-right": "0px",
	 			"transition" : ".5s"
	 		});
		}
		else if($(this).val() == null){
			$(this).css({
				"border":"1px solid #A6A6A6"
		     });
			$(".changedetailid").css({
				"top": "11px",
		        "left": "11px",
		        "color": "#5f6368",
		        "width": "86px",
		        "padding": "0 5px",
		        "font-size":"11pt"
				});
		}
   });
		
	
	$("#pw").on("focusin",function(){
 		$(this).css({
 			"border":"2px solid #C6F1E7"});
 		$(".changedetailpw").css({
 			"color": "#8BF7AF",
 			"font-size": "10pt",
 			"top":"-10px",
 			"background-color": "white",
 			"width": "89px",
 			"padding-right": "0px",
 			"transition" : ".5s"
 		});
 	});
	
	$("#pw").on("focusout",function(){
		if($("#pw").val() != null){
			$(this).css({
				"border":"1px solid #A6A6A6"
		     });
			$(".changedetailpw").css({
	 			"color": "#5f6368",
	 			"font-size": "10pt",
	 			"top":"-10px",
	 			"background-color": "white",
	 			"width": "89px",
	 			"padding-right": "0px",
	 			"transition" : ".5s"
	 		});
		}
		else if($("#pw").val() == null){
			$(this).css({
				"border":"1px solid #A6A6A6"
		     });
			$(".changedetailpw").css({
				"top": "11px",
		        "left": "11px",
		        "color": "#5f6368",
		        "width": "95px",
		        "padding": "0 5px",
		        "font-size":"11pt"
				});
		}
   });
	
	
	$("#pwck").on("focusin",function(){
 		$(this).css({
 			"border":"2px solid #C6F1E7"});
 		$(".changedetailpw2").css({
 			"color": "#8BF7AF",
 			"font-size": "10pt",
 			"top":"-10px",
 			"background-color": "white",
 			"width": "89px",
 			"padding-right": "0px",
 			"transition" : ".5s"
 		});
 	});
	
	$("#pwck").on("focusout",function(){
		if($("#pwck").val() != null){
			$(this).css({
				"border":"1px solid #A6A6A6"
		     });
			$(".changedetailpw2").css({
	 			"color": "#5f6368",
	 			"font-size": "10pt",
	 			"top":"-10px",
	 			"background-color": "white",
	 			"width": "89px",
	 			"padding-right": "0px",
	 			"transition" : ".5s"
	 		});
		}
		else if($("#pwck").val() == null){
			$(this).css({
				"border":"1px solid #A6A6A6"
		     });
			$(".changedetailpw2").css({
				"top": "11px",
		        "left": "11px",
		        "color": "#5f6368",
		        "width": "95px",
		        "padding": "0 5px",
		        "font-size":"11pt"
				});
		}
   });
	
	$("#name").on("focusin",function(){
 		$(this).css({
 			"border":"2px solid #C6F1E7"});
 		$(".changedetailname").css({
 			"color": "#8BF7AF",
 			"font-size": "10pt",
 			"top":"-10px",
 			"background-color": "white",
 			"width": "65px",
 			"padding-right": "0px",
 			"transition" : ".5s"
 		});
 	});
	
	$("#name").on("focusout",function(){
		if($("#name").val() != null){
			$(this).css({
				"border":"1px solid #A6A6A6"
		     });
			$(".changedetailname").css({
	 			"color": "#5f6368",
	 			"font-size": "10pt",
	 			"top":"-10px",
	 			"background-color": "white",
	 			"width": "65px",
	 			"padding-right": "0px",
	 			"transition" : ".5s"
	 		});
		}
		else if($("#name").val() == null){
			$(this).css({
				"border":"1px solid #A6A6A6"
		     });
			$(".changedetailname").css({
				"top": "11px",
		        "left": "11px",
		        "color": "#5f6368",
		        "width": "95px",
		        "padding": "0 5px",
		        "font-size":"11pt"
				});
		}
   });
	
	$("#nick").on("focusin",function(){
 		$(this).css({
 			"border":"2px solid #C6F1E7"});
 		$(".changedetailnick").css({
 			"color": "#8BF7AF",
 			"font-size": "10pt",
 			"top":"-10px",
 			"background-color": "white",
 			"width": "76px",
 			"padding-right": "0px",
 			"transition" : ".5s"
 		});
 	});
	
	$("#nick").on("focusout",function(){
		if($(this).val() != null){
			$(this).css({
				"border":"1px solid #A6A6A6"
		     });
			$(".changedetailnick").css({
	 			"color": "#5f6368",
	 			"font-size": "10pt",
	 			"top":"-10px",
	 			"background-color": "white",
	 			"width": "76px",
	 			"padding-right": "0px",
	 			"transition" : ".5s"
	 		});
		}
		else if($(this).val() == null){
			$(this).css({
				"border":"1px solid #A6A6A6"
		     });
			$(".changedetailnick").css({
				"top": "11px",
		        "left": "11px",
		        "color": "#5f6368",
		        "width": "86px",
		        "padding": "0 5px",
		        "font-size":"11pt"
				});
		}
   });
	
	$("#birth").on("focusin",function(){
 		$(this).css({
 			"border":"2px solid #C6F1E7"});
 		$(".changedetailbirth").css({
 			"color": "#8BF7AF",
 			"font-size": "10pt",
 			"top":"-10px",
 			"background-color": "white",
 			"width": "89px",
 			"padding-right": "0px",
 			"transition" : ".5s"
 		});
 	});
	
	$("#birth").on("focusout",function(){
		if($(this).val() != null){
			$(this).css({
				"border":"1px solid #A6A6A6"
		     });
			$(".changedetailbirth").css({
	 			"color": "#5f6368",
	 			"font-size": "10pt",
	 			"top":"-10px",
	 			"background-color": "white",
	 			"width": "89px",
	 			"padding-right": "0px",
	 			"transition" : ".5s"
	 		});
		}
		else if($(this).val() == null){
			$(this).css({
				"border":"1px solid #A6A6A6"
		     });
			$(".changedetailbirth").css({
				"top": "11px",
		        "left": "11px",
		        "color": "#5f6368",
		        "width": "86px",
		        "padding": "0 5px",
		        "font-size":"11pt"
				});
		}
   });
	
	$("#phno").on("focusin",function(){
 		$(this).css({
 			"border":"2px solid #C6F1E7"});
 		$(".changedetailph").css({
 			"color": "#8BF7AF",
 			"font-size": "10pt",
 			"top":"-10px",
 			"background-color": "white",
 			"width": "89px",
 			"padding-right": "0px",
 			"transition" : ".5s"
 		});
 	});
	
	$("#phno").on("focusout",function(){
		if($(this).val() != null){
			$(this).css({
				"border":"1px solid #A6A6A6"
		     });
			$(".changedetailph").css({
	 			"color": "#5f6368",
	 			"font-size": "10pt",
	 			"top":"-10px",
	 			"background-color": "white",
	 			"width": "89px",
	 			"padding-right": "0px",
	 			"transition" : ".5s"
	 		});
		}
		else if($(this).val() == null){
			$(this).css({
				"border":"1px solid #A6A6A6"
		     });
			$(".changedetailph").css({
				"top": "11px",
		        "left": "11px",
		        "color": "#5f6368",
		        "width": "86px",
		        "padding": "0 5px",
		        "font-size":"11pt"
				});
		}
   });
	
	$("#email1").on("focusout",function(){
		if($(this).val() != null){
			$(this).css({
				"border":"1px solid #A6A6A6"
		     });
			$(".changeemaildetail").css({
	 			"color": "#5f6368",
	 			"font-size": "10pt",
	 			"top":"-10px",
	 			"background-color": "white",
	 			"width": "76px",
	 			"padding-right": "0px",
	 			"transition" : ".5s"
	 		});
		}
		else if($(this).val() == null){
			$(this).css({
				"border":"1px solid #A6A6A6"
		     });
			$(".changeemaildetail").css({
				"top": "11px",
		        "left": "11px",
		        "color": "#5f6368",
		        "width": "86px",
		        "padding": "0 5px",
		        "font-size":"11pt"
				});
		}
   });
	
	$("#email1").on("focusin",function(){
 		$(this).css({
 			"border":"2px solid #C6F1E7"});
 		$(".changeemaildetail").css({
 			"color": "#8BF7AF",
 			"font-size": "10pt",
 			"top":"-10px",
 			"background-color": "white",
 			"width": "76px",
 			"padding-right": "0px",
 			"transition" : ".5s"
 		});
 	});
	
	$("#emailinput2").on("focusin",function(){
 		$(this).css({
 			"border":"2px solid #C6F1E7",
 		});
 	});
	
	$("#emailinput2").on("focusout",function(){
		$(this).css({
		"border":"1px solid #A6A6A6",
     });
	});
	
	$("input[id='allagree']").on("click",function(){   
		if($("input[id='allagree']").is(":checked")){
			$(".agree").prop("checked",true);
			$(".service").css({
				"background-color":"#C6F1E7",
				"color":"black",
				"border":"1px solid #C6F1E7"
			});
		} else {
			$(".agree").prop("checked",false);
			$(".service").css({
				"background-color":"transparent",
				"color":"black",
				"border":"1px solid #a6a6a6"
			});
		}
	});
	// 전체 동의가 되어 있지 않을 때, 전체 동의 풀기
	$(".agree").on("click",function(){
		var total = $(".agree").length;
		var checked = $(".agree:checked").length;
		
		if(total != checked){
			$("#allagree").prop("checked",false);
			$(".service").css({
				"background-color":"transparent",
				"color":"black",
				"border":"1px solid #a6a6a6"
			});
		} else{
			$("#allagree").prop("checked",true);
			$(".service").css({
				"background-color":"#C6F1E7",
				"color":"black",
				"border":"1px solid #C6F1E7"
			});
		}
	});
	
	$("#id2").on("click",function(){  
		var id = $("#id").val();
		var idLength = $("#id").val().length;
		
		if(id == ""){
			$(".iddetail").html("아이디를 입력해주세요.");
			$(".iddetail").attr("style","color:#e52528;");
		} else if(idLength < 8){
			$(".iddetail").html("숫자 포함한 영문자 8자 이상으로 아이디를 만들어주세요.");
			$(".iddetail").attr("style","color:#e52528;");
		} else{
			$.ajax({
				type:"post",
				url:"iddbCheck.jsp",
				data:{id:id},
				dataType:"html",
				success:function(result){  // 계속 '실패' 오작동이 됨 
					if(result == 1){
						$(".iddetail").html("사용할 수 없는 아이디 입니다.");
						$(".iddetail").attr("style","color:#e52528;");
					} else if(result == -1) {
						$(".iddetail").html("사용할 수 있는 아이디 입니다.");
						$(".iddetail").attr("style","color:#1a73e8;");
					} 
				},
				error:function(){
					alert("에러");
				}
				
			});
		}
		
		
	});
	
	$("#pw").on("keyup",function(){
		var pw = $("#pw").val();
		var id = $("#id").val();
		
		if(pw == id){
			$(".pwdetail").html("아이디와 동일한 비밀번호는 사용할 수 없습니다.");
			$(".pwdetail").attr("style","color:#e52528;");
		}
	});
	
	$("#pwck").on("keyup",function(){
		var pw = $("#pw").val();
		var pwck = $("#pwck").val();
		console.log(pw);
		console.log(pwck);
		
		if(pw != pwck){
			$(".pwdetail2").html("비밀번호가 일치하지 않습니다.");
			$(".pwdetail2").attr("style","color:#e52528;");
		} else if(pw == pwck){
			$(".pwdetail2").html("비밀번호가 일치합니다.");
			$(".pwdetail2").attr("style","color:#1a73e8;");
		}
	});
	
	

	

}