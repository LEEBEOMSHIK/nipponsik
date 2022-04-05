<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="userDAO.UserDAO" %>
<%@ page import="userDTO.UserDTO" %>
<% request.setCharacterEncoding("utf-8"); %>
<%
	String id = null;
	if(session.getAttribute("idbox") != null){
		id = (String) session.getAttribute("idbox");
	}
	
	UserDAO userDAO = new UserDAO();
	UserDTO userDTO = userDAO.selectUser(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NIPPONSIK 개인정보 수정</title>
<link rel="stylesheet" type="text/css" href="myhometopfooter.css">
<link rel="stylesheet" type="text/css" href="membershipCheckPage.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="myhome.js"></script>
<link rel="stylesheet"
	href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
</head>
<body>
	<header>
		<%
			if (id != null) {
		%>
		<div class="toplogout">
			<div class="logouttul">
				<div class="logouttulin">
					<ul>
						<li><a href="#a"><%=userDTO.getCustom_name()%>님</a></li>
						<li><a href="sessionDelete.jsp"><input type="button"
								name="logoutbtn" value="로그아웃"></a></li>
						<li><a href="boardList.bo">고객센터</a></li>
						<li><a href="bbs.jsp">커뮤니티</a></li>
					</ul>
				</div>
			</div>
		</div>
		<%
			}
			if (id == null) {
		%>
		<div class="toplogout">
			<div class="logouttul">
				<div class="logouttulin">
					<ul>
						<li><a href="loginpage.jsp">로그인</a></li>
						<li><a href="gaip.jsp">회원가입</a></li>
						<li><a href="boardList.bo">고객센터</a></li>
						<li><a href="bbs.jsp">커뮤니티</a></li>
					</ul>
				</div>
			</div>
		</div>
		<%
			}
		%>
		<div class="topnavi">
			<div class="categorybtn">
				<i class="xi-bars"></i><br>
				<a href="#a" class="cate1"><p>카테고리</p></a>
				<div class="smallcategory">
					<ul>
						<li><a href="product.nipponsik?cate_list=102">면류</a></li>
						<li><a href="product.nipponsik?cate_list=103">과자,스위트</a></li>
						<li><a href="product.nipponsik?cate_list=104">식재료</a></li>
						<li><a href="product.nipponsik?cate_list=105">조미료</a></li>
						<li><a href="product.nipponsik?cate_list=106">술</a></li>
						<li><a href="product.nipponsik?cate_list=107">차</a></li>
						<li><a href="product.nipponsik?cate_list=108">음료</a></li>
						<li><a href="product.nipponsik?cate_list=109">가공식품</a></li>
						<li><a href="product.nipponsik?cate_list=110">고기</a></li>
						<li><a href="product.nipponsik?cate_list=111">건어물</a></li>
					</ul>
				</div>
			</div>
			<div class="rightheader">
				<div class="rightup">
					<div class="toplogo">
						<a href="indexpage.jsp"><img src="logo/logo3.png"></a>
					</div>
					<form action="goods.search" method="post" name="searchForm">
						<nav class="searchArea">
							<input type="search" name="search" placeholder="어떤 상품을 찾으시나요?"
								id="search">
							<div class="lens">
								<button type="submit" value="전송" name="searchSend">
									<i class="xi-search"></i>
								</button>
							</div>
						</nav>
					</form>
					<nav class="toprightnavi">
						<ul class="toprightnavitul">
							<li class="mycart"><a href="cartAction.jsp"><i
									class="xi-cart-o"></i><br>장바구니</a></li>
							<li class="mypage"><a href="list.order"><i
									class="xi-user-o"></i><br>마이페이지</a>
								<div class="mypagecategory">
									<i class="xi-caret-up-min"></i>
									<ul class="mypagecategorytul">
										<li><a href="list.order">마이페이지</a></li>
										<li><a href="#a">나의 주문 내역</a></li>
									</ul>
								</div></li>
						</ul>
					</nav>
				</div>
				<div class="rightdown">
					<nav class="mainnavi">
						<ul class="mainnavicategory">
							<li class="mainnavicategorybox"><a href="grumeindex.jsp"
								class="firsttab">일본 구루메</a></li>
							<li class="mainnavicategorybox"><a
								href="product.nipponsik?cate_list=102" class="firsttab">면류</a>
								<ul class="fixdetailcategorytul">
									<li><a href="detail_category.search?detail_category=봉지라면" class="secondtab">봉지라면</a></li>
									<li><a href="detail_category.search?detail_category=컵라면" class="secondtab">컵라면</a></li>
									<li><a href="detail_category.search?detail_category=기타면류" class="secondtab">기타면류</a></li>
								</ul></li>
							<li class="mainnavicategorybox"><a
								href="product.nipponsik?cate_list=103" class="firsttab">과자,스위트</a>
								<ul class="fixdetailcategorytul">
									<li><a href="detail_category.search?detail_category=봉지과자" class="secondtab">봉지과자</a></li>
									<li><a href="detail_category.search?detail_category=샌드" class="secondtab">샌드</a></li>
									<li><a href="detail_category.search?detail_category=과자" class="secondtab">과자</a></li>
									<li><a href="detail_category.search?detail_category=비스킷" class="secondtab">비스킷</a></li>
									<li><a href="detail_category.search?detail_category=캔디" class="secondtab">캔디</a></li>
									<li><a href="detail_category.search?detail_category=쿠키" class="secondtab">쿠키</a></li>
								</ul></li>
							<li class="mainnavicategorybox"><a
								href="product.nipponsik?cate_list=104" class="firsttab">식재료</a>
								<ul class="fixdetailcategorytul">
									<li><a href="detail_category.search?detail_category=된장류" class="secondtab">된장류</a></li>
									<li><a href="detail_category.search?detail_category=김밥 재료" class="secondtab">김밥 재료</a></li>
									<li><a href="detail_category.search?detail_category=기타식품" class="secondtab">기타식품</a></li>
								</ul></li>
							<li class="mainnavicategorybox"><a
								href="product.nipponsik?cate_list=105" class="firsttab">조미료</a>
								<ul class="fixdetailcategorytul">
									<li><a href="detail_category.search?detail_category=육수" class="secondtab">육수</a></li>
									<li><a href="detail_category.search?detail_category=소스" class="secondtab">소스</a></li>
									<li><a href="detail_category.search?detail_category=간장" class="secondtab">간장</a></li>
									<li><a href="detail_category.search?detail_category=식초" class="secondtab">식초</a></li>
								</ul></li>
							<li class="mainnavicategorybox"><a
								href="product.nipponsik?cate_list=106" class="firsttab">술</a>
								<ul class="fixdetailcategorytul">
									<li><a href="detail_category.search?detail_category=일본주" class="secondtab">일본주</a></li>
								</ul></li>
							<li class="mainnavicategorybox"><a
								href="product.nipponsik?cate_list=107" class="firsttab">차</a>
								<ul class="fixdetailcategorytul">
									<li><a href="detail_category.search?detail_category=전통차" class="secondtab">전통차</a></li>
									<li><a href="detail_category.search?detail_category=녹차" class="secondtab">녹차</a></li>
									<li><a href="detail_category.search?detail_category=홍차" class="secondtab">홍차</a></li>
									<li><a href="detail_category.search?detail_category=밀크티" class="secondtab">밀크티</a></li>
								</ul></li>
							<li class="mainnavicategorybox"><a
								href="product.nipponsik?cate_list=108" class="firsttab">음료</a>
								<ul class="fixdetailcategorytul">
									<li><a href="detail_category.search?detail_category=탄산음료" class="secondtab">탄산음료</a></li>
									<li><a href="detail_category.search?detail_category=차 음료" class="secondtab">차 음료</a></li>
									<li><a href="detail_category.search?detail_category=스포츠음료" class="secondtab">스포츠음료</a></li>
									<li><a href="detail_category.search?detail_category=기타음료" class="secondtab">기타음료</a></li>
								</ul></li>
							<li class="mainnavicategorybox"><a
								href="product.nipponsik?cate_list=109" class="firsttab">가공식품</a>
								<ul class="fixdetailcategorytul">
									<li><a href="detail_category.search?detail_category=즉석식품" class="secondtab">즉석식품</a></li>
									<li><a href="detail_category.search?detail_category=카레" class="secondtab">카레</a></li>
									<li><a href="detail_category.search?detail_category=스프" class="secondtab">스프</a></li>
								</ul></li>
							<li class="mainnavicategorybox"><a
								href="product.nipponsik?cate_list=110" class="firsttab">고기</a>
								<ul class="fixdetailcategorytul">
									<li><a href="detail_category.search?detail_category=소고기" class="secondtab">소고기</a></li>
									<li><a href="detail_category.search?detail_category=돼지고기" class="secondtab">돼지고기</a></li>
								</ul></li>
							<li class="mainnavicategorybox"><a
								href="product.nipponsik?cate_list=111" class="firsttab">건어물</a>

							</li>
						</ul>
						<div class="absolute-navi"></div>
					</nav>
				</div>
			</div>
		</div>
	</header>
	<!--  -->
	<section id="section-box">
	<form action="updateUser.jsp" method="post">
		<div class="member-check-box">
			<div class="member-check-title">
				<h1>회원 정보 수정</h1>
			</div>
			<div class="member-check-table">
				<table>
					<colgroup>
						<col width="160px">
					</colgroup>
					<tr class="table-col">
						<td>아이디(이메일)</td>
						<td class="first-row">
							<input type="hidden" name="custom_emailinput" value="<%= userDTO.getCustom_emailinput()%>">
							<input type="hidden" name="custom_mailsearch" value="<%= userDTO.getCustom_mailsearch()%>">
							<span><%= userDTO.getCustom_emailinput() %>@<%= userDTO.getCustom_mailsearch() %></span>
							<button type="button" class="changeBtn btn1">이메일 변경</button>
							<div class="detail-box box-on1">
								<input type="text" name="change_custom_emailinput" class="detail-inner-box" value="<%= userDTO.getCustom_emailinput() %>"> @ 
								<input type="text" name="change_custom_mailsearch" class="detail-inner-box" value="<%= userDTO.getCustom_mailsearch() %>">
							</div>
						</td>
					</tr>
					<tr class="table-col">
						<td>이름</td>
						<td class="first-row">
							<input type="hidden" name="custom_name" value="<%= userDTO.getCustom_name()%>">
							<span><%= userDTO.getCustom_name() %></span>
							<button type="button" class="changeBtn btn2">이름 변경</button>
							<div class="detail-box box-on2">
								<input type="text" name="change_custom_name" class="detail-inner-box small-box" value="<%= userDTO.getCustom_name() %>"> 
							</div>
						</td>
					</tr>
					<tr class="table-col">
						<td>닉네임</td>
						<td class="first-row">
							<input type="hidden" name="custom_nickname" value="<%= userDTO.getCustom_nickname()%>">
							<span><%= userDTO.getCustom_nickname() %></span>
							<button type="button" class="changeBtn btn3">닉네임 변경</button>
							<div class="detail-box box-on3">
								<input type="text" name="change_custom_nickname" class="detail-inner-box small-box" value="<%= userDTO.getCustom_nickname() %>"> 
							</div>
						</td>
					</tr>
					<tr class="table-col">
						<td>핸드폰 번호</td>
						<td class="first-row">
							<input type="hidden" name="custom_phone" value="<%= userDTO.getCustom_phone()%>">
							<span><%= userDTO.getCustom_phone() %></span>
							<button type="button" class="changeBtn btn4">휴대폰 번호 변경</button>
							<div class="detail-box box-on4">
								<input type="text" name="change_custom_phone" class="detail-inner-box small-box" value="<%= userDTO.getCustom_phone() %>"> 
							</div>
						</td>
					</tr>
					<tr class="table-col">
						<td>비밀번호변경</td>
						<td>
							<input type="hidden" name="custom_pw" value="<%= userDTO.getCustom_pw()%>" class="hiddenPw">
							<div class="current-pw-box">
								<span>현재 비밀번호</span>
								<span><input type="password" name="moto_custom_password" class="pw-input-box" id="pw1" maxlength="15"></span>
								<div class="detail1"></div>
							</div>
							<div class="new-pw-box">
								<span>새 비밀번호</span>
								<span><input type="password" name="new_custom_password" class="pw-input-box" id="pw2" maxlength="15"></span>
								<div class="detail2">
									<span><i class='xi-close'></i></span>
									<span></span>
								</div>
								<div class="detail3">
									<span><i class='xi-close'></i></span>
									<span></span>
								</div>
								<div class="detail4"></div>
							</div>
							<div class="pwCheck-box">
								<span>비밀번호 다시 입력</span>
								<span><input type="password" name="new_custom_password" class="pw-input-box" id="pw3" maxlength="15"></span>
								<div class="detail5">
									<span><i class='xi-close'></i></span>
									<span></span>
								</div>
							</div>
							<div class="pw-change-box">
								<button type="button" class="changeBtn pwChange">비밀번호 변경</button>
							</div>
						</td>
					</tr>
					<tr class="table-col">
						<td>배송지 변경</td>
						<td class="first-row">
							<span><%= userDTO.getCustom_address2()%><%= userDTO.getCustom_address3()%><%= userDTO.getCustom_address4()%><%= userDTO.getCustom_address5()%></span>
							<button type="button" class="changeBtn">배송지 변경</button>
						</td>
					</tr>
				</table>
			</div>
			<div class="deleteUser-box">
				<span>탈퇴를 원하시면 우측의 회원탈퇴 버튼을 눌러주세요.</span>
				<span><a href="deleteUser.jsp">회원탈퇴</a></span>
			</div>
			<div class="btn">
				<input type="submit" value="변경 완료" class="outBtn1">
			</div>
		</div>
		</form>
	</section>
	<!-- footer -->
		<footer class="footer">
		<div class="footerdetail">
		<div class="policy">
		<ul>
			<li><a href="#a">개인정보처리방침</a></li>
			<li><a href="#a">서비스이용약관</a></li>
			<li><a href="#a">멤버쉽이용약관</a></li>
			<li><a href="#a">고객문의</a></li>
			<li><a href="#a">고객설문</a></li>
			<li><a href="#a">사이트 맵</a></li>
			<li><a href="#a">BI 소개</a></li>
		</ul>
	    </div>
	    <div class="companyinfo">
		<div class="footerlogo"><a href="#a"><img src="logo/logo3.png"></a></div>
		<div class="companydetail">
			<pre>
상호명: NIPPONSIK(주)
대표이사: 이범식
서울시 은평구 은평로 12길
사업자 등록번호: 000-00-00000
		    </pre>
		</div>
		<div class="companynumber">
			<a href="#a"></a>
			<pre>
<p>365 고객센터</p>
<p>1577-0000</p>
<p>서울시 은평구 은평로 12길</p>
<p>email: help@nipponsik.com</p>
		    </pre>
		    </a>
		</div>
		<div class="snsconnet">
			<a href="#a"><img src="logo/insta.png"></a>
			<a href="#a"><img src="logo/facebook.png"></a>
			<a href="#a"><img src="logo/twitter.png"></a>
		</div>
		</div>
	</div>
</footer>
<script type="text/javascript">
$(function(){
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
		var pw = $(".hiddenPw").val();
		var pw1 = $("#pw1").val();
		var pw2 = $("#pw2").val();
		var pw3 = $("#pw3").val();
		
		if(pw1 == ""){
			$(".detail1").html("현재 비밀번호를 입력하세요.");
			$(".detail1").attr("style","color:#e52528;");
			$("#pw1").attr("style","border:1px solid #e7223d;")
		} else if(pw1 != pw){
			$(".detail1").html("현재 비밀번호가 일치하지 않습니다.");
			$(".detail1").attr("style","color:#e52528;");
			$("#pw1").attr("style","border:1px solid #e7223d;")
		} else if(pw1 == pw){
			$(".detail1").html("현재 비밀번호가 일치합니다.");
			$(".detail1").attr("style","color:#1a73e8;");
			$("#pw1").attr("style","border:1px solid #1a73e8;")
		}
		
		if(pw2 == ""){
			$(".detail2").css("display","block");
			$(".detail2 > span:last-child").html("아이디(이메일) 제외");
			$(".detail2 > span").attr("style","color:#e52528;");
			$(".detail3").css("display","block");
			$(".detail3 > span:last-child").html("3개 이상 연속되거나 동일한 문자/숫자 제외");
			$(".detail3 > span").attr("style","color:#e52528;");
			$("#pw2").attr("style","border:1px solid #e7223d;")
		}
		if(pw3 == ""){
			$(".detail5").css("display","block");
			$(".detail5 > span:last-child").html("확인을 위해 새 비밀번호를 다시 입력해주세요.");
			$(".detail5 > span").attr("style","color:#e52528;");
			$("#pw3").attr("style","border:1px solid #e7223d;")
		} else if(pw3 != pw2){
			$(".detail5").css("display","block");
			$(".detail5 > span:last-child").html("새 비밀번호가 일치하지 않습니다.");
			$(".detail5 > span").attr("style","color:#e52528;");
			$("#pw3").attr("style","border:1px solid #e7223d;")
		} else if(pw3 == pw2){
			$(".detail5").css("display","block");
			$(".detail5 > span:first-child").html("<i class='xi-radiobox-blank'></i>");
			$(".detail5 > span:last-child").html("새 비밀번호가 일치합니다.");
			$(".detail5 > span").attr("style","color:#1a73e8;");
			$("#pw3").attr("style","border:1px solid #1a73e8;")
		}
	});
	
	$("form").on("submit",function(){
		var pw1 = $("#pw1").val();
		var pw2 = $("#pw2").val();
		var pw3 = $("#pw3").val();
		
		if(pw1 == ""){
			alert("현재 비밀번호를 입력해주세요.");
			return false;
		} else if (pw != pw1){
			alert("현재의 비밀번호가 일치하지 않습니다.");
			return false;
		} else if (pw2 == ""){
			alert("변경할 비밀번호를 입력해주세요.");
			return false;
		} else if (pw3 == ""){
			alert("변경할 비밀번호 확인을 입력해주세요.");
			return false;
		}  else if (pw2 != pw3){
			alert("변경할 비밀번호가 서로 맞지 않습니다.");
			return false;
		}
	});
});
</script>
	
</body>
</html>