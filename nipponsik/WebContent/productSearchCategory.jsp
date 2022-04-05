<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="productDTO.ProductDTO" %>
<%@ page import="userDTO.UserDTO" %>
<%@ page import="userDAO.UserDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% request.setCharacterEncoding("utf-8"); %>
<% ProductDTO productDTO = new ProductDTO(); %>
<%
   int goodsSearchCount = (Integer) request.getAttribute("goodsSearchCount");
   String seloption = "";
   if(request.getAttribute("seloption") != null){
	   seloption = (String)request.getAttribute("seloption");
   }
  
   String id = null;
   if(session.getAttribute("idbox") != null){
   	id = (String) session.getAttribute("idbox");
   }
   UserDAO userDAO = new UserDAO();
   UserDTO userDTO = userDAO.selectUser(id);
   
   ArrayList<ProductDTO> goodsList = new ArrayList<ProductDTO>();
   goodsList = (ArrayList<ProductDTO>)request.getAttribute("goodsList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NIPPONSIK 카테고리</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="productcategory.js"></script>
<link rel="stylesheet" type="text/css" href="productcategory.css">
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
		<div class="totalsection">
	<section class="leftcategory">
				<div class="left-category-padding">
					<div class="left-category-tul">
					<!-- 배송 분류 별 -->
					<form action="/productSearchCategory.jsp" method="get">
						<div class="baesong-per-category-box">
							<div class="baesong-one-item">
								<label for="baesong-item1">
									<input type="checkbox" name="baesong-item1" id="baesong-item1" value="무료배송">
									<span>무료배송</span>
								</label>
							</div>
							<div class="baesong-one-item">
								<label for="baesong-item2">
									<input type="checkbox" name="baesong-item2" id="baesong-item2" value="정기배송">
									<span>정기배송</span>
								</label>
							</div>
						</div>
						</form>
						<!-- 카테고리 별 -->
						<div class="category-per-box">
							<div class="category-per-title">
								<span>카테고리</span>
							</div>
							<ul class="first-category-list">
								<li>
									<div class="category-per-list">
										<input type="radio" name="category-list1" id="category-list1">
										<label for="category-list1" id="catelabel1">
											<span>면류</span>
										</label>
										<a href="#a" class="up-down-btn" id="catefilter1">
											<i class="xi-angle-down-min"></i>
										</a>
									</div>
									<ul class="first-detail-category-list list-off" id="catefilterList1">
										<li>
											<label for="category-list-item2" id="catelabel1-deep1">
												<input type="radio" name="category-list-item2" id="category-list-item2">
												<span>봉지라면</span>
											</label>
										</li>
										<li>
											<label for="category-list-item3" id="catelabel1-deep2">
												<input type="radio" name="category-list-item3" id="category-list-item3">
												<span>컵라면</span>
											</label>
										</li>
										<li>
											<label for="category-list-item4" id="catelabel1-deep3">
												<input type="radio" name="category-list-item4" id="category-list-item4">
												<span>기타면류</span>
											</label>
										</li>
									</ul>
								</li>
								<li>
									<div class="category-per-list">
										<input type="radio" name="category-list2" id="category-list2">
										<label for="category-list2" id="catelabel2">
											<span>과자 / 스위트</span>
										</label>
											<a href="#a" class="up-down-btn" id="catefilter2">
												<i class="xi-angle-down-min"></i>
											</a>
									</div>
									<ul class="first-detail-category-list list-off" id="catefilterList2">
										<li>
											<label for="category-list-item2" id="catelabel2-deep1">
												<input type="radio" name="category-list-item2" id="category-list-item2">
												<span>봉지과자</span>
											</label>
										</li>
										<li>
											<label for="category-list-item3" id="catelabel2-deep2">
												<input type="radio" name="category-list-item3" id="category-list-item3">
												<span>샌드</span>
											</label>
										</li>
										<li>
											<label for="category-list-item4" id="catelabel2-deep3">
												<input type="radio" name="category-list-item4" id="category-list-item4">
												<span>과자</span>
											</label>
										</li>
										<li>
											<label for="category-list-item5" id="catelabel2-deep4">
												<input type="radio" name="category-list-item5" id="category-list-item5">
												<span>비스킷</span>
											</label>
										</li>
										<li>
											<label for="category-list-item6" id="catelabel2-deep5">
												<input type="radio" name="category-list-item6" id="category-list-item6">
												<span>캔디</span>
											</label>
										</li>
										<li>
											<label for="category-list-item6" id="catelabel2-deep6">
												<input type="radio" name="category-list-item6" id="category-list-item6">
												<span>쿠키</span>
											</label>
										</li>
									</ul>
								</li>
								<li>
									<div class="category-per-list">
										<input type="radio" name="category-list2" id="category-list2">
										<label for="category-list2" id="catelabel3">
											<span>식재료</span>
										</label>
										<a href="#a" class="up-down-btn" id="catefilter3">
											<i class="xi-angle-down-min"></i>
										</a>
									</div>
									<ul class="first-detail-category-list list-off" id="catefilterList3">
										<li>
											<a href="#a">
											<label for="category-list-item2" id="catelabel3-deep1">
												<input type="radio" name="category-list-item2" id="category-list-item2">
												<span>된장류</span>
											</label>
											</a>
										</li>
										<li>
											<label for="category-list-item3" id="catelabel3-deep2">
												<input type="radio" name="category-list-item3" id="category-list-item3">
												<span>김밥 재료</span>
											</label>
										</li>
										<li>
											<label for="category-list-item4" id="catelabel3-deep3">
												<input type="radio" name="category-list-item4" id="category-list-item4">
												<span>기타식품</span>
											</label>
										</li>
									</ul>
								</li>
								<li>
									<div class="category-per-list">
										<input type="radio" name="category-list2" id="category-list2">
										<label for="category-list2" id="catelabel4">
											<span>조미료</span>
										</label>
										<a href="#a" class="up-down-btn" id="catefilter4">
											<i class="xi-angle-down-min"></i>
										</a>
									</div>
									<ul class="first-detail-category-list list-off" id="catefilterList4">
										<li>
											<label for="category-list-item2" id="catelabel4-deep1">
												<input type="radio" name="category-list-item2" id="category-list-item2">
												<span>육수</span>
											</label>
										</li>
										<li>
											<label for="category-list-item3" id="catelabel4-deep2">
												<input type="radio" name="category-list-item3" id="category-list-item3">
												<span>소스</span>
											</label>
										</li>
										<li>
											<label for="category-list-item4" id="catelabel4-deep3">
												<input type="radio" name="category-list-item4" id="category-list-item4">
												<span>간장</span>
											</label>
										</li>
										<li>
											<label for="category-list-item5" id="catelabel4-deep4">
												<input type="radio" name="category-list-item5" id="category-list-item5">
												<span>식초</span>
											</label>
										</li>
									</ul>
								</li>
								<li>
									<div class="category-per-list">
										<input type="radio" name="category-list2" id="category-list2">
										<label for="category-list2" id="catelabel5">
											<span>술</span>
										</label>
										<a href="#a" class="up-down-btn" id="catefilter5">
											<i class="xi-angle-down-min"></i>
										</a>
										<ul class="first-detail-category-list list-off" id="catefilterList5">
										<li>
											<label for="category-list-item2" id="catelabel5-deep1">
												<input type="radio" name="category-list-item2" id="category-list-item2">
												<span>일본주</span>
											</label>
										</li>
									</ul>
									</div>
								</li>
								<li>
									<div class="category-per-list">
										<input type="radio" name="category-list2" id="category-list2">
										<label for="category-list2" id="catelabel6">
											<span>차</span>
										</label>
										<a href="#a" class="up-down-btn" id="catefilter6">
											<i class="xi-angle-down-min"></i>
										</a>
									</div>
									<ul class="first-detail-category-list list-off" id="catefilterList6">
										<li>
											<label for="category-list-item2" id="catelabel6-deep1">
												<input type="radio" name="category-list-item2" id="category-list-item2">
												<span>전통차</span>
											</label>
										</li>
										<li>
											<label for="category-list-item3" id="catelabel6-deep2">
												<input type="radio" name="category-list-item3" id="category-list-item3">
												<span>녹차</span>
											</label>
										</li>
										<li>
											<label for="category-list-item4" id="catelabel6-deep3">
												<input type="radio" name="category-list-item4" id="category-list-item4">
												<span>홍차</span>
											</label>
										</li>
										<li>
											<label for="category-list-item5" id="catelabel6-deep4">
												<input type="radio" name="category-list-item5" id="category-list-item5">
												<span>밀크티</span>
											</label>
										</li>
									</ul>
								</li>
								<li>
									<div class="category-per-list">
										<input type="radio" name="category-list2" id="category-list2">
										<label for="category-list2" id="catelabel7">
											<span>음료</span>
										</label>
										<a href="#a" class="up-down-btn" id="catefilter7">
											<i class="xi-angle-down-min"></i>
										</a>
									</div>
									<ul class="first-detail-category-list list-off" id="catefilterList7">
										<li>
											<label for="category-list-item2" id="catelabel7-deep1">
												<input type="radio" name="category-list-item2" id="category-list-item2">
												<span>탄산음료</span>
											</label>
										</li>
										<li>
											<label for="category-list-item3" id="catelabel7-deep2">
												<input type="radio" name="category-list-item3" id="category-list-item3">
												<span>차 음료</span>
											</label>
										</li>
										<li>
											<label for="category-list-item4" id="catelabel7-deep3">
												<input type="radio" name="category-list-item4" id="category-list-item4">
												<span>스포츠음료</span>
											</label>
										</li>
										<li>
											<label for="category-list-item5" id="catelabel7-deep4">
												<input type="radio" name="category-list-item5" id="category-list-item5">
												<span>기타음료</span>
											</label>
										</li>
									</ul>
								</li>
								<li>
									<div class="category-per-list">
										<input type="radio" name="category-list2" id="category-list2">
										<label for="category-list2" id="catelabel8">
											<span>가공식품</span>
										</label>
										<a href="#a" class="up-down-btn" id="catefilter8">
											<i class="xi-angle-down-min"></i>
										</a>
									</div>
									<ul class="first-detail-category-list list-off" id="catefilterList8">
										<li>
											<label for="category-list-item2" id="catelabel8-deep1">
												<input type="radio" name="category-list-item2" id="category-list-item2">
												<span>즉석식품</span>
											</label>
										</li>
										<li>
											<label for="category-list-item3" id="catelabel8-deep2">
												<input type="radio" name="category-list-item3" id="category-list-item3">
												<span>카레</span>
											</label>
										</li>
										<li>
											<label for="category-list-item4" id="catelabel8-deep3">
												<input type="radio" name="category-list-item4" id="category-list-item4">
												<span>스프</span>
											</label>
										</li>
									</ul>
								</li>
								<li>
									<div class="category-per-list">
										<input type="radio" name="category-list2" id="category-list2">
										<label for="category-list2" id="catelabel9">
											<span>고기</span>
										</label>
										<a href="#a" class="up-down-btn" id="catefilter9">
											<i class="xi-angle-down-min"></i>
										</a>
									</div>
									<ul class="first-detail-category-list list-off" id="catefilterList9">
										<li>
											<label for="category-list-item2" id="catelabel9-deep1">
												<input type="radio" name="category-list-item2" id="category-list-item2">
												<span>소고기</span>
											</label>
										</li>
										<li>
											<label for="category-list-item3" id="catelabel9-deep2">
												<input type="radio" name="category-list-item3" id="category-list-item3">
												<span>돼지고기</span>
											</label>
										</li>
									</ul>
								</li>
							</ul>
						</div>
						<!-- 브랜드별 분류 -->
						<div class="category-per-box">
							<div class="category-per-title">
								<span>브랜드</span>
							</div>
							<div class="baesong-one-item">
								<label for="baesong-item1">
									<input type="checkbox" name="baesong-item1" id="baesong-item1">
									<span>브랜드1</span>
								</label>
							</div>
							<div class="baesong-one-item">
								<label for="baesong-item1">
									<input type="checkbox" name="baesong-item1" id="baesong-item1">
									<span> 브랜드2</span>
								</label>
							</div>
							<div class="baesong-one-item">
								<label for="baesong-item1">
									<input type="checkbox" name="baesong-item1" id="baesong-item1">
									<span>브랜드3</span>
								</label>
							</div>
							<a href="#a" class="more-see">
								<span>+ 더보기</span>
							</a>
						</div>
						<!-- 가격별 분류 -->
						<div class="category-per-box">
							<div class="category-per-title">
								<span>가격</span>
							</div>
							<div class="price-per-box">
								<label for="price-per-label" id="priceFilter1">
									<span>가격전체</span>
								</label>
							</div>
							<div class="price-per-box">
								<label for="price-per-label" id="priceFilter2">
									<span>2만원 이하</span>
								</label>
							</div>
							<div class="price-per-box">
								<label for="price-per-label" id="priceFilter3">
									<span>2만원~4만원</span>
								</label>
							</div>
							<div class="price-per-box">
								<label for="price-per-label" id="priceFilter4">
									<span>4만원~6만원</span>
								</label>
							</div>
							<div class="price-per-box">
								<label for="price-per-label" id="priceFilter5">
									<span>6만원~8만원</span>
								</label>
							</div>
							<div class="price-per-box">
								<label for="price-per-label" id="priceFilter6">
									<span>8만원 이상</span>
								</label>
							</div>
							<!-- 가격 검색 -->
							<div class="price-search-box">
								<span>
									<input type="text" name="price-input1"> ~
								</span>
								<span>
									<input type="text" name="price-input2">원
								</span>
								<a href="#a">검색</a>
							</div>
						</div>
					</div>
				</div>
		</section>
	<div class="rightcategory">
	<section class="sectiontopnavi">
		<span><a href="#a">TOP</a></span>
		<span>></span>
		<span><a href="#a" class="redfont"><%= seloption %></a></span>
	</section>
	<section class="searchoption">
		<span class="searchamount redfont">총 <%= goodsSearchCount %>건 검색</span>
		<span class="optionbox">
			<form action="select.search" method="post">
			<select name="seloption" size="1" class="seloption" id="selectOption">
				<option ${(param.seloption == "goods_code")?"selected":""} value="goods_code">정렬순</option>
				<option ${(param.seloption == "newgoods_bunho")?"selected":""} value="newgoods_bunho">신제품</option>
				<option ${(param.seloption == "goods_price")?"selected":""} value="goods_price">가격</option>
				<option ${(param.seloption == "goods_name")?"selected":""} value="goods_name">상품명</option>
			</select>
			</form>
		</span>
		</section>
		<section class="product">
		<ul>
		<% if(goodsList != null){
		%>
		<% for(int i= 0; i<goodsList.size();i++){
			%>
			<li>
			   <div class="innerbox">
			   <div class="imgbox">
			   <a href="product_<%=goodsList.get(i).getGoods_code() %>.detail?goods_code=<%=goodsList.get(i).getGoods_code() %>" class="producttitlelink">
			      <img alt="사진 없음" src="indexpicture/<%= goodsList.get(i).getGoods_category() %>/<%=goodsList.get(i).getGoods_code() %>.PNG">
			   </a>
			   </div>
			   <div class="produckdetail">
			   <div class="producttitle"><a href="product_<%=goodsList.get(i).getGoods_code() %>.detail?goods_code=<%=goodsList.get(i).getGoods_code() %>" class="producttitlelink"><%=goodsList.get(i).getGoods_name() %></a></div>
			   <div class="productcode">상품코드 : <%=goodsList.get(i).getGoods_code() %></div>
			   <div class="productprice"><fmt:formatNumber value="<%= goodsList.get(i).getGoods_price() %>" pattern="#,###" />원</div>
			   </div>
			   </div>
			</li>
			<%
		}%>
			
	</section>
		<% 
	} else{%>
	<section class="no-item-product">
		<div class="no-item-search">
			<span>'<%= seloption%>'</span>
			<span>에 대한 검색결과가 없습니다.</span>
			<p>다른 검색어를 입력하시거나 철자와 띄어쓰기를 확인해 보세요.</p>
		</div>
			
	</section>
	<%} %>
</div>
</div>
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
	    	$("#selectOption").on("change",function(){
	    		$.ajax({
	    			url:"product.nipponsik?cate_list=99998",
	    			data:{"selectvalue":$("#selectOption").val()},
	    			dataType: "html",
	    			success: function(result){
	    				
	    			},
	    			error: function(){
	    				alert("실패");
	    			}
	    		});
	    	});
	    });
	</script>

</body>
</html>