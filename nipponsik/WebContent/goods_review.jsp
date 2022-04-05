<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="userDTO.UserDTO"%>
<%@ page import="userDAO.UserDAO"%>
<%@ page import="java.util.*" %>
<%@ page import="orderDTO.OrderDTO" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% 
request.setCharacterEncoding("utf-8");

String id = null;
if(session.getAttribute("idbox") != null){
	id = (String) session.getAttribute("idbox");
} else {
	%>
	<script type="text/javascript">
		alert("로그인이 필요한 서비스입니다.");
		location.href="loginpage.jsp";
	</script>
	<%
}

UserDAO userDAO = new UserDAO();
UserDTO userDTO = userDAO.selectUser(id);

String goods_name = null;
if(request.getParameter("goods_name") != null){
	goods_name = request.getParameter("goods_name");
}
int goods_category = 0;
if(request.getParameter("goods_category") != null){
	goods_category = Integer.parseInt(request.getParameter("goods_category"));
}
int goods_code = 0;
if(request.getParameter("goods_code") != null){
	goods_code = Integer.parseInt(request.getParameter("goods_code"));
}


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>NIPPONSIK 리뷰 페이지</title>
<link rel="stylesheet" type="text/css" href="mypage.css">
<link rel="stylesheet" type="text/css" href="goods_review.css">
<script type="text/javascript" src="goods_review.js"></script>
<link rel="stylesheet"
	href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script src="mypage.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
	<section class="totalsection">
		<div class="wrapsection">
			<div class="myleftnavi">
				<div class="mylefttop">
					<span>MY정보</span>
				</div>
				<div class="myleftmiddle">
					<div class="myleftfirstbox">
						<div class="myleftfirstbox_title">MY 정보</div>
						<div class="myleftfirstbox_content">
							<ul>
								<li><a href="membershipCheckPage.jsp">개인정보확인</a></li>
								<li><a href="#a">결제수단 관리</a></li>
								<li><a href="#a">배송지 관리</a></li>
							</ul>
						</div>
					</div>
					<div class="myleftsecondbox">
						<div class="myleftfirstbox_title">MY 혜택</div>
						<div class="myleftfirstbox_content">
							<ul>
								<li><a href="#a">할인쿠폰</a></li>
								<li><a href="#a">기프트 카드</a></li>
							</ul>
						</div>
					</div>
					<div class="myleftthirdbox">
						<div class="myleftfirstbox_title">MY 쇼핑</div>
						<div class="myleftthirdbox_content">
							<ul>
								<li><a href="#a">주문목록/배송조회</a></li>
								<li><a href="#a">취소/반품/교환/환불</a></li>
								<li><a href="#a">정기배송관리</a></li>
								<li><a href="#a">영수중 조회/출력</a></li>
							</ul>
						</div>
					</div>
					<div class="myleftfourthbox">
						<div class="myleftfirstbox_title">MY 활동</div>
						<div class="myleftfirstbox_content">
							<ul>
								<li><a href="#a">문의하기</a></li>
								<li><a href="#a">문의내역 확인</a></li>
								<li><a href="#a">리뷰 관리</a></li>
								<li><a href="#a">찜 리스트</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="myrightinfo" id="right-review">
			<form action="insert.gdsReply" method="post" enctype="multipart/form-data" onsubmit="return blank_check()">
				<div class="myrighttop">
					<div class="myright-title">
						<div class="title-box">
							<img src="logo/review.png" id="review-img">
							<span id="review-title">상품 리뷰 관리</span>
						</div>
						<div>이 상품의 품질에 대해서 얼마나 만족하시나요?</div>
					</div>
				</div>
				<!-- 어떤 상품에 대한 리뷰인지 -->
				<div class="myreview-middle-box">
					<div class="product-img-box">
						<img alt="" src="indexpicture/<%=goods_category %>/<%=goods_code %>.png">
					</div>
					<div class="product-info-box">
						<div class="product-name"><%=goods_name %></div>
						<input type="hidden" name="goods_code" value="<%=goods_code%>">
						<div class="product-rating-star">
							<ul class="star-point">
								<li><img alt="" src="logo/writing-star.png" id="star1"></li>
								<li><img alt="" src="logo/writing-star.png" id="star2"></li>
								<li><img alt="" src="logo/writing-star.png" id="star3"></li>
								<li><img alt="" src="logo/writing-star.png" id="star4"></li>
								<li><img alt="" src="logo/writing-star.png" id="star5"></li>
							</ul>
							<span id="star-status">(필수)*</span>
							<input type="hidden" name="gdsRe_star" value="0" id="hiddenstar">
						</div>
					</div>
				</div>
				<!-- 상세 리뷰 설명 -->
				<div class="myreview-detail-box">
					<div class="myreview-detail-left">리뷰</div>
					<div class="myreview-detail-right">
						<div class="myreview-detail-question">
							<ul>
								<li>상품에 대한 만족도를 알려주세요</li>
								<li>
									<input type="radio" id="safac1" name="gdsReply_safac" value="아주 만족해요">
									<label for="safac1">아주 만족해요</label>
								</li>
								<li>
									<input type="radio" id="safac2" name="gdsReply_safac" value="적당히 만족해요">
									<label for="safac2">적당히 만족해요</label>
								</li>
								<li>
									<input type="radio" id="safac3" name="gdsReply_safac" value="만족 스럽지 않아요">
									<label for="safac3">만족 스럽지 않아요</label>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<!-- 상세리뷰 content부분 -->
				<div class="myreview-content-box">
					<div class="myreview-content-left">상세리뷰</div>
					<div class="myreview-content-right">
						<textarea rows="5" placeholder="상품 품질에 대한 고객님의 솔직한 리뷰를 남겨주세요." maxlength="500" name="gdsRe_content"></textarea>
					</div>
				</div>
				<!-- 사진 업로드 부분 -->
				<div class="myreview-upload-box">
					<div class="myreview-upload-left">사진첨부</div>
					<div class="myreview-upload-right">
						<div class="myreview-upload-inner">
							<button type="button">
								<label for="fileBtn" class="upload-Label">사진첨부</label>
							</button>
							<input type="file" name="gdsRe_imgFile" accept="image/*" id="fileBtn">
							<span class="upload-count"></span>
							<span class="upload-detail">사진은 최대 20MB 이하의 JPG, PNG, GIF 파일 10장까지 첨부 가능합니다.</span>
						</div>
					</div>
				</div>
				<!-- 버튼 부분 -->
				<div class="review-btns">
					<button type="button" id="cancel">취소하기</button>
					<button type="submit">등록하기</button>
				</div>
				</form>
            </div>
         </div>
	</section>
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
				<div class="footerlogo">
					<a href="#a"><img src="logo/logo3.png"></a>
				</div>
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
					<a href="#a"><img src="logo/insta.png"></a> <a href="#a"><img
						src="logo/facebook.png"></a> <a href="#a"><img
						src="logo/twitter.png"></a>
				</div>
			</div>
		</div>
	</footer>
	<script type="text/javascript">
	$(function(){
	 	$(".smallcategory").hide();
	 	$(".categorybtn").mouseover(function(){
	 		$(".smallcategory").show();
	 	});
	 	$(".categorybtn, .smallcategory").mouseleave(function(){
	 		$(".smallcategory").hide();
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
	
	// 별 동작 이벤트
	$("#star5").on("click",function(){  
		$(".star-point > li > img").attr("src","logo/rate-star.png");
		$("#star-status").html("최고");
		$("#hiddenstar").attr("value","5");
	});
	$("#star4").on("click",function(){
		$("#star1,#star2,#star3,#star4").attr("src","logo/rate-star.png");
		$("#star5").attr("src","logo/writing-star.png");
		$("#star-status").html("좋음");
		$("#hiddenstar").attr("value","4");
	});
	$("#star3").on("click",function(){
		$("#star1,#star2,#star3").attr("src","logo/rate-star.png");
		$("#star5,#star4").attr("src","logo/writing-star.png");
		$("#star-status").html("보통");
		$("#hiddenstar").attr("value","3");
	});
	$("#star2").on("click",function(){
		$("#star1,#star2").attr("src","logo/rate-star.png");
		$("#star5,#star4,#star3").attr("src","logo/writing-star.png");
		$("#star-status").html("별로");
		$("#hiddenstar").attr("value","2");
	});
	$("#star1").on("click",function(){
		$("#star1").attr("src","logo/rate-star.png");
		$("#star5,#star4,#star3,#star2").attr("src","logo/writing-star.png");
		$("#star-status").html("최악");
		$("#hiddenstar").attr("value","1");
	});
	
	
	//미입력 값 유효성 검사
	function blank_check(){
		if($("input[name='gdsRe_star']").val() == 0){
			alert("별점이 체크되지 않았습니다.");
			return false;
		} else if($("input[name='gdsReply_safac']").is(":checked") == false){
			alert("만족도를 체크해주세요.");
			return false;
		} else if($("textarea[name='gdsRe_content']").val() == ""){
			alert("상세 리뷰 내용을 입력해주세요.");
			return false;
		}
	}
	 //파일 첨부된 값이 있을 경우
	 
	 $("#fileBtn").on("change",function(){
		 var fileCheck = $("#fileBtn").val();
		 $(".upload-count").html(fileCheck);
		 $(".upload-detail").css({
			 "display":"inline-block",
			 "padding-top":"10px"
		 });
	 });
</script>
</body>
</html>