<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="userDTO.UserDTO"%>
<%@ page import="userDAO.UserDAO"%>
<%@ page import="java.util.*" %>
<%@ page import="orderDTO.OrderDTO" %>
<%@ page import="goodsReplyDTO.GoodsReplyDTO" %>
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

List<OrderDTO> orderList = (List)request.getAttribute("orderList");

int orderListCount = 0;
if(request.getAttribute("orderListCount") != null){
	orderListCount = Integer.parseInt(request.getAttribute("orderListCount").toString());
}

List<GoodsReplyDTO> goodsReplyList = (List)request.getAttribute("goodsReplyList");
int goodsReplyCount = 0;
if(request.getAttribute("goodsReplyCount") != null){
	goodsReplyCount = Integer.parseInt(request.getAttribute("goodsReplyCount").toString());
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>NIPPONSIK 마이페이지</title>
<link rel="stylesheet" type="text/css" href="mypage.css">
<link rel="stylesheet" type="text/css" href="goods_review.css">
<link rel="stylesheet" type="text/css" href="goods_reviewList.css">
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
				<div class="myrighttop">
					<div class="myright-title">
						<div class="title-box">
							<img src="logo/review.png" id="review-img">
							<span id="review-title">리뷰 관리</span>
						</div>
					</div>
				</div>
				<!-- 리뷰 관리 탭 -->
				<div class="review-tab-box tab-margin">
					<div class="review-tab-inner">
						<ul>
							<li id="review-tab1" class="tab-click">
							리뷰 작성
							<span><%=orderListCount %></span>
							</li>
							<li id="review-tab2">
							작성한 리뷰
							<span><%=goodsReplyCount %></span>
							</li>
						</ul>
					</div>
				</div>
				<!-- 구매한 상품에 대한 리뷰 -->
				<%
				  if(orderList != null){
					  for(int i=0; i<orderList.size(); i++){
						  %>
						 <form action="goods_review.jsp" method="post">
						 <input type="hidden" name="goods_code" value="<%=orderList.get(i).getOrder_goodsCode()%>">
						 <input type="hidden" name="goods_name" value="<%=orderList.get(i).getOrder_goodsName()%>">
						 <input type="hidden" name="goods_category" value="<%=orderList.get(i).getOrder_goodsCategory()%>">
						<div class="buyBox">
							<div class="buy-product-box">
								<div class="buy-product-content-box">
									<div class="buy-product-img-box">
										<img alt="" src="indexpicture/<%=orderList.get(i).getOrder_goodsCategory() %>/<%= orderList.get(i).getOrder_goodsCode()%>.png">
									</div>
									<div class="buy-product-detail-box">
										<div class="buy-product-detail-name"><%=orderList.get(i).getOrder_goodsName() %></div>
										<div class="buy-product-detail-detail"><%=orderList.get(i).getOrder_goodsName() %></div>
										<div class="buy-product-detail-baesong">2021.12.31 배송</div>
									</div>
									<div class="buy-product-btn-box">
										<button type="submit">리뷰 작성하기</button>
									</div>
								</div>
							</div>
						</div>
						</form>
						  <%
					  }
					  %>
					  <%
				  } else if(orderList == null) {
					  %>
					  <div class="buyBox">
					  <div class="no-buy-product-box">리뷰 작성이 가능한 상품이 없습니다.</div>
					  </div>
					  <%
				  }
				%>
				<!-- 작성한 리뷰 클릭 시, 보여줘야 하는 부분 -->
				<%
				  if(goodsReplyList != null){
					  for(int i=0; i< goodsReplyList.size(); i++){
						  %>
						  <form action="goods_reviewModify.jsp" method="post" id="replyForm">
						  <input type="hidden" name="gdsRe_num" value="<%=goodsReplyList.get(i).getGdsRe_num()%>">
						  <input type="hidden" name="gdsRe_content" value="<%=goodsReplyList.get(i).getGdsRe_content()%>">
						  <input type="hidden" name="gdsRe_safac" value="<%=goodsReplyList.get(i).getGdsRe_safac()%>">
						  <input type="hidden" name="gdsRe_imgFile" value="<%=goodsReplyList.get(i).getGdsRe_imgFile()%>">
						  <input type="hidden" name="goods_name" value="<%=goodsReplyList.get(i).getGoods_name()%>">
						  <input type="hidden" name="goods_category" value="<%=goodsReplyList.get(i).getGoods_category()%>">
						  <input type="hidden" name="goods_code" value="<%=goodsReplyList.get(i).getGdsRe_gdsCode()%>">
							<div class="reviewBox">
								<div class="reviewed-box">
									<div class="reviewed-content-box">
										<div class="reviewed-content-top">
											<div class="reviewed-product-img">
												<img alt="" src="indexpicture/<%=goodsReplyList.get(i).getGoods_category() %>/<%=goodsReplyList.get(i).getGoods_code() %>.png">
											</div>
											<div class="reviewed-product-name">
												<a href="product.detail?goods_code=<%=goodsReplyList.get(i).getGoods_code()%>"><%=goodsReplyList.get(i).getGoods_name() %></a>
											</div>
											<div class="modify-delete-box">
												<button type="submit">수정</button>
												<button type="button" onclick="deletesubmit()">삭제</button>
											</div>
										</div>
										<div class="reviewed-content-bottom">
										<input type="hidden" name="gdsRe_star" value="<%=goodsReplyList.get(i).getGdsRe_star()%>" id="gdsRe_star">
											<div class="star-point">
												<ul>
													<li><img src="logo/rate-star.png"></li>
													<li><img src="logo/rate-star.png"></li>
													<li><img src="logo/rate-star.png"></li>
													<li><img src="logo/rate-star.png"></li>
													<li><img src="logo/rate-star.png"></li>
												</ul>
												<span>2022.03.03</span>
											</div>
											<div class="reviewed-content-inner-box"><%=goodsReplyList.get(i).getGdsRe_content() %></div>
											<div class="reviewed-safac-box">
												<table>
													<tr class="reviewed-safac-table-col">
														<td>만족도</td>
														<td><%=goodsReplyList.get(i).getGdsRe_safac() %></td>
													</tr>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
							</form>
						  <%
					  }
				%>
					  <%
				  }else {
					  %>
					  <div class="reviewBox">
					  <div class="no-buy-product-box">리뷰 작성한 상품이 없습니다.</div>
					  </div>
					  <%
				  }
				%>
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
	
	// 탭 클릭 이벤트
	$("#review-tab1").on("click",function(){
		$(this).addClass("tab-click");
		$("#review-tab2").removeClass("tab-click");
		$(".buyBox").css("display","block");
		$(".reviewBox").css("display","none");
	});
	$("#review-tab2").on("click",function(){
		$(this).addClass("tab-click");
		$("#review-tab1").removeClass("tab-click");
		$(".buyBox").css("display","none");
		$(".reviewBox").css("display","block");
	});
	
	function deletesubmit(){
		$("#replyForm").attr("action","delete.gdsReply");
	}
	

	
</script>
</body>
</html>