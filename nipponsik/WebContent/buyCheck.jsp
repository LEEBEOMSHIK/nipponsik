<%@page import="userDAO.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<meta charset="utf-8">
<%@ page import="userDTO.UserDTO"%>
<%@ page import="indexGoodsDAO.IndexGoodsDAO"%>
<%@ page import="productDTO.ProductDTO"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	String id = null;
	if (session.getAttribute("idbox") != null) {
		id = (String) session.getAttribute("idbox");
	} else {
		%>
		<script>
			alert("로그인이 필요한 서비스입니다.");
			location.href="loginpage.jsp";
		</script>
		<% 
	}
	UserDAO userDAO = new UserDAO();
	UserDTO userDTO = userDAO.selectUser(id);
	
	String goods_name = null;
	int sum_goods_price = 0;
	int amount = 0;
	int goods_code = 0;
	int goods_price = 0;
	int goods_category = 0;
	
	if(request.getParameter("goods_name") != null){
		goods_name = request.getParameter("goods_name");
	}
	if(request.getParameter("sum_goods_price") != null){
		sum_goods_price = Integer.parseInt(request.getParameter("sum_goods_price"));
	}
	if(request.getParameter("amount") != null){
		amount = Integer.parseInt(request.getParameter("amount"));
	}
	if(request.getParameter("goods_code") != null){
		goods_code = Integer.parseInt(request.getParameter("goods_code"));
	}
	if(request.getParameter("goods_price") != null){
		goods_price = Integer.parseInt(request.getParameter("goods_price"));
	}
	if(request.getParameter("goods_category") != null){
		goods_category = Integer.parseInt(request.getParameter("goods_category"));
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NIPPONSIK 주문/결제 페이지</title>
<link rel="stylesheet" type="text/css" href="myhometopfooter.css">
<link rel="stylesheet" type="text/css" href="buyCheck.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="myhome.js"></script>
<link rel="stylesheet"
	href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
</head>
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
	<!-- 중간 섹션 부분 -->
	<section class="buy-Check-all-box">
		<div class="buy-Check-inner-frame">
			<form action="insert.order" method="post">
			<input type="hidden" name="goods_name" value="<%=goods_name%>">
			<input type="hidden" name="goods_code" value="<%=goods_code%>">
			<input type="hidden" name="sum_goods_price" value="<%=sum_goods_price%>">
			<input type="hidden" name="amount" value="<%=amount%>">
			<input type="hidden" name="goods_price" value="<%=goods_price%>">
			<input type="hidden" name="goods_category" value="<%=goods_category%>">
			<div class="buy-Check-top">
				<h3>주문/결제</h3>
				<span>주문결제</span>
			</div>
			<!-- 구매자 정보 -->
			<div class="who-buy-info-box">
				<div class="who-buy-info-title">구매자 정보</div>
				<table class="who-buy-info-table">
					<tr class="who-buy-info-table-col">
						<td>이름</td>
						<td><%=userDTO.getCustom_name() %></td>
					</tr>
					<tr class="who-buy-info-table-col">
						<td>이메일</td>
						<td><%=userDTO.getCustom_emailinput() %>@<%=userDTO.getCustom_mailsearch() %></td>
					</tr>
					<tr class="who-buy-info-table-col">
						<td>휴대폰 번호</td>
						<td>
							<%=userDTO.getCustom_phone() %>
							<span id="cellph-detail">쿠폰/티켓 정보는 구매한 분의 번호로 전송됩니다.</span>
						</td>
					</tr>
				</table>
			</div>
			<!-- 받는 사람 정보 -->
			<div class="who-buy-info-box">
				<div class="who-buy-info-title">받는사람 정보</div>
				<table class="who-buy-info-table">
					<tr class="who-buy-info-table-col">
						<td>이름</td>
						<td><%=userDTO.getCustom_name() %></td>
					</tr>
					<tr class="who-buy-info-table-col">
						<td>배송주소</td>
						<td>
							<%=userDTO.getCustom_address1() %>
							<%=userDTO.getCustom_address2() %>
							<%=userDTO.getCustom_address4() %>
							<span id="nomal-address">기본배송지</span>
						</td>
					</tr>
					<tr class="who-buy-info-table-col">
						<td>배송 요청사항</td>
						<td>
							<div class="baesong-detail-box">
								<ul>
									<li>
										<input type="radio" name="baesong_detail" value="문 앞" id="baesong1" class="baesong-radio">
										<label for="baesong1">
											<span>문 앞</span>
										</label>
									</li>
									<li>
										<input type="radio" name="baesong_detail" value="경비실" id="baesong2" class="baesong-radio">
										<label for="baesong2">
											<span>경비실</span>
										</label>
									</li>
									<li>
										<input type="radio" name="baesong_detail" value="택배함" id="baesong3" class="baesong-radio">
										<label for="baesong3">
											<span>택배함</span>
										</label>
									</li>
								</ul>
							</div>
						</td>
					</tr>
				</table>
			</div>
			<!-- 결제 정보 -->
			<div class="who-buy-info-box">
				<div class="who-buy-info-title">결제 정보</div>
				<table class="who-buy-info-table">
					<tr class="who-buy-info-table-col">
						<td>상품 내용</td>
						<td>
							<%=goods_name %>
							<span id="goods-detail">수량 <%=amount %>개/배송비 무료</span>
						</td>
					</tr>
					<tr class="who-buy-info-table-col">
						<td>총 상품 가격</td>
						<td><fmt:formatNumber value="<%=sum_goods_price %>" pattern="#,###"/>원</td>
					</tr>
					<tr class="who-buy-info-table-col">
						<td>배송비</td>
						<td>
							무료
						</td>
					</tr>
					<tr class="who-buy-info-table-col">
						<td>총 결제 금액</td>
						<td>
							<fmt:formatNumber value="<%=sum_goods_price %>" pattern="#,###"/>원
						</td>
					</tr>
					<tr class="who-buy-info-table-col">
						<td>결제방법</td>
						<td id="payment-option-col">
							<div class="payment-option">
								<ul>
									<li>
										<input type="radio" name="payment_option" value="계좌이체" id="hurikomi" class="payment-radio">
										<label for="hurikomi">
											<span>계좌이체</span>
										</label>
									</li>
									<li>
										<input type="radio" name="payment_option" value="신용/체크카드" id="credit" class="payment-radio">
										<label for="credit">
											<span>신용/체크카드</span>
										</label>
									</li>
									<li>
										<input type="radio" name="payment_option" value="신용/체크카드" id="cellphone" class="payment-radio">
										<label for="cellphone">
											<span>휴대폰</span>
										</label>
									</li>
								</ul>
							</div>
						</td>
					</tr>
				</table>
			</div>
			
			<div class="btns">
				<a href="javascript:history.back()">돌아가기</a>
				<button type="submit">결제하기</button>
			</div>
			</form>
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

</body>
</html>