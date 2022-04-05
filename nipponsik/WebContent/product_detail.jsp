<%@page import="qnaGoodsDTO.QnaGoodsDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="productDTO.ProductDTO"%>
<%@ page import="goodsReplyDTO.GoodsReplyDTO" %>
<%@ page import="userDTO.UserDTO"%>
<%@ page import="userDAO.UserDAO"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Date"%>
<%@ page import="vo.PageInfo" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% 
   ProductDTO productDTO = new ProductDTO();
%>
<%
   productDTO = (ProductDTO) request.getAttribute("productDTO");
  // String date = (String) request.getAttribute("date");
  // SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
  // Date date1 = format.parse(date);
  QnaGoodsDTO qnaGoodsDTO = new QnaGoodsDTO();
  List<QnaGoodsDTO> qnaList = (List<QnaGoodsDTO>)request.getAttribute("qnaList");
  
  GoodsReplyDTO goodsReplyDTO = new GoodsReplyDTO();
  List<GoodsReplyDTO> replyList = (List<GoodsReplyDTO>)request.getAttribute("goodsReplyList");
  
  //상품 리뷰에 대한 페이지 처리를 위함
  
  PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
  int pageNumber = pageInfo.getPage();
  int starPage = pageInfo.getStartPage();
  int endPage = pageInfo.getEndPage();
  int maxPage = pageInfo.getMaxPage();
  int count = pageInfo.getListCount();
  
  //상품 문의에 대한 페이지 처리를 위함
  PageInfo pageInfo2 =(PageInfo) request.getAttribute("pageInfo2");
  int pageNumber2 = pageInfo2.getPage();
  int starPage2 = pageInfo2.getStartPage();
  int endPage2 = pageInfo2.getEndPage();
  int maxPage2 = pageInfo2.getMaxPage();
  int count2 = pageInfo2.getListCount();
  
		  
   String baesong = null;
   if(productDTO.getGoods_price()>10000){
	   baesong ="무료배송";
   } else{
	   baesong = "배송비 3,000원";
   }
   
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
<title><%= productDTO.getGoods_name() %></title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="product_detail.js"></script>
<link rel="stylesheet" type="text/css" href="product_detail.css">
<link rel="stylesheet" type="text/css" href="product_detail2.css">
<link rel="stylesheet"
	href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<script type="text/javascript"
	src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
</head>
<body>
	<header>
	<%=pageNumber %>
	<%=starPage %>
	<%=endPage %>
	<%=maxPage %>
	<%=count %>
	<%=pageNumber2 %>
	<%=starPage2 %>
	<%=endPage2 %>
	<%=maxPage2 %>
	<%=count2 %>
	
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
		<div class="product-top">
			<div class="product-image">
				<img alt="사진 없음"
					src="indexpicture/<%= productDTO.getGoods_category() %>/<%= productDTO.getGoods_code()%>.png">
			</div>
			<div class="product-detail">
				<div class="product-detail-title">
					<h2><%=productDTO.getGoods_name() %></h2>
				</div>
				<div class="product-detail-price">
					<span id="sum-price"><fmt:formatNumber value="<%= productDTO.getGoods_price() %>" pattern="#,###"/></span>
					원
				</div>
				<div class="product-detail-baesong">
					<div class="baesong-pay"><%= baesong %></div>
					<div class="baesong-when">
						<span id="baesong-day"></span>
						까지 도착
					</div>
				</div>
				<div class="product-detail-company">
					<div class="seller-company">
						판매자 :
						<%= productDTO.getGoods_company() %></div>
					<div class="baesong-company">배송사 : 우체국</div>
				</div>
				<div class="product-detail-point">
					<span class="point-nomal">캐시적립 혜택</span> <span class="point-focus"><fmt:formatNumber
							value="<%= productDTO.getGoods_price()*0.1 %>" pattern="#,###" /></span>
					<span class="point-nomal">원 적립</span>
				</div>
				<form action="cartInsertAction.jsp" method="post">
					<input type="hidden" name="goods_price" id="sell_price" value="<%=productDTO.getGoods_price()%>">
					<input type="hidden" name="sum_goods_price" id="sum" value="<%=productDTO.getGoods_price()%>">
					<input type="hidden" name="goods_name" value="<%=productDTO.getGoods_name()%>">
					<input type="hidden" name="goods_code" value="<%=productDTO.getGoods_code()%>">
					<input type="hidden" name="goods_category" value="<%=productDTO.getGoods_category()%>">
					<div class="product-detail-btn">
						<div class="btn-collect">
							<table>
								<tr>
									<td rowspan="2">
										<div class="amount-box">
											<input type="text" name="amount" class="buy-amount" value="1" min="1">
										</div>
									</td>  <!-- input 수량 -->
									<td>
										<div class="amount-updown">
											<button type="button" class="amount-up">수량 더하기</button>
										</div>
									</td>  <!-- 업 앤 다운 -->
									<td rowspan="2" class="space-col"></td>  <!-- 띄기 -->
									<td rowspan="2">
										<div class="cart-btn-box">
											<button type="submit" class="cart-btn">장바구니 담기</button>
										</div>
									</td>   <!-- 장바구니 담기 -->
									<td rowspan="2" class="space-col"></td>  <!-- 띄기 -->
									<td rowspan="2">
										<div class="cart-btn-box">
											<button type="submit" class="buy-btn" onclick="return submit2(this.form);">바로 구매</button>
										</div>
									</td>  <!-- 바로구매 -->
								</tr>
								<tr>
									<td>
										<div class="amount-updown">
											<button type="button" class="amount-down">수량 빼기</button>
										</div>
									</td> 
								</tr>
							</table>
						</div>
					</div>
				</form>
			</div>
		</div>
		<div class="product-recommand">
			<div class="product-recommand-top">
				<h2>다른 고객이 함께 구매한 상품</h2>
			</div>
			<div class="product-recommand-slide">
				<div>slide1</div>
				<div>slide2</div>
				<div>slide3</div>
				<div>slide3</div>
				<div>slide3</div>
				<div>slide3</div>
				<div>slide3</div>
				<div>slide3</div>
			</div>
		</div>
		<div class="product-detail-tab">
			<ul class="tab-title">
				<li id="tab1">상품상세</li>
				<li id="tab2">상품 리뷰</li>
				<li id="tab3">상품 문의</li>
				<li id="tab4">배송/교환/반품 안내</li>
			</ul>
		</div>
		<div class="product-detail-tableBox">
			<p>필수 표기 정보</p>
			<table class="product-detail-table">
				<tr class="product-detail-row">
					<td>제품명</td>
					<td>상품 상세페이지 참조</td>
					<td>식품의 유형</td>
					<td>상품 상세페이지 참조</td>
				</tr>
				<tr class="product-detail-row">
					<td>생산자 및 소재지</td>
					<td>상품 상세페이지 참조</td>
					<td>제조연월일,유통기한 또는 품질 유지기한</td>
					<td>상품 상세페이지 참조</td>
				</tr>
				<tr class="product-detail-row">
					<td>포장단위별 내용물의 용량(중량),수량</td>
					<td>상품 상세페이지 참조</td>
					<td>원재료명 및 함량</td>
					<td>상품 상세페이지 참조</td>
				</tr>
				<tr class="product-detail-row">
					<td>영양성분</td>
					<td>상품 상세페이지 참조</td>
					<td>유전자변형식품에 해당하는 경우의 표시</td>
					<td>상품 상세페이지 참조</td>
				</tr>
				<tr class="product-detail-row">
					<td>소비자안전을 위한 주의사항</td>
					<td>상품 상세페이지 참조</td>
					<td>수입식품 문구</td>
					<td>상품 상세페이지 참조</td>
				</tr>
			</table>
		</div>
		<div class="product-detail-picture">
			<img
				src="indexpicture/<%= productDTO.getGoods_category() %>/<%=productDTO.getGoods_code() %>/<%= productDTO.getGoods_code() %>_01.png"
				alt=""> <img
				src="indexpicture/<%= productDTO.getGoods_category() %>/<%=productDTO.getGoods_code() %>/<%= productDTO.getGoods_code() %>_02.png"
				alt=""> <img
				src="indexpicture/<%= productDTO.getGoods_category() %>/<%=productDTO.getGoods_code() %>/<%= productDTO.getGoods_code() %>_03.png"
				alt="">

		</div>
		<!-- 상품 리뷰 부분 -->
		<div class="product-review-box">
			<div class="product-review-title">
				<h4>상품평</h4>
			</div>
			<% if(replyList != null){
				for(int i = 0; i<replyList.size(); i++){
				%>
				<!-- 리뷰가 있을 때의 박스 -->
				<div class="review-box">
					<div class="review-Writer"><%=replyList.get(i).getGdsRe_cust_id() %>/<%=replyList.get(i).getGdsRe_date() %></div>
					<div class="review-product-name"><%= productDTO.getGoods_name() %></div>
					<div class="product-rating-star">
							<ul class="star-point">
								<li><img alt="" src="logo/writing-star.png" id="star1"></li>
								<li><img alt="" src="logo/writing-star.png" id="star2"></li>
								<li><img alt="" src="logo/writing-star.png" id="star3"></li>
								<li><img alt="" src="logo/writing-star.png" id="star4"></li>
								<li><img alt="" src="logo/writing-star.png" id="star5"></li>
							</ul>
							<span id="star-status"><%= replyList.get(i).getGdsRe_safac() %></span>
							<input type="hidden" name="gdsRe_star" value="<%=replyList.get(i).getGdsRe_star() %>" id="hiddenstar1">
							<input type="hidden" name="gdsRe_star" value="<%=replyList.get(i).getGdsRe_star() %>" id="hiddenstar">
					</div>
					<div class="review-content"><%=replyList.get(i).getGdsRe_content() %></div>
				</div>
				<%
				}%>
				<section id="pageList">
				<%
					if (pageNumber <= 1) {
				%>
				<a href="#a" class="noUsenextPaging pre">Previous&nbsp;</a>
				<%
					} else {
				%>
				<a href="product.detail?goods_code=<%=productDTO.getGoods_code() %>&pageNumber=<%=pageNumber - 1%>" class="nextPaging nextpre">Previous</a>&nbsp;
				<%
					}
				%>

				<%
					for (int a = pageNumber; a <= endPage; a++) {
							if (a == pageNumber) {
				%>
				<a href="#a" class="noUsebunhoPaging"><%=a%></a>
				<%
					} else {
				%>
				<a href="product.detail?goods_code=<%=productDTO.getGoods_code() %>&pageNumber=<%=a %>" class="bunhoPaging"><%=a%>
				</a>&nbsp;
				<%
					}
				%>
				<%
					}
				%>

				<%
					if (pageNumber >= maxPage) {
				%>
				<a href="#a" class="noUsenextPaging next">Next</a>
				<%
					} else {
				%>
				<a href="product.detail?goods_code=<%=productDTO.getGoods_code() %>&pageNumber=<%=pageNumber + 1%>" class="nextPaging nextnext">Next</a>
				<%} %>
			</section>
			<%} else{
			%>	<!-- 리뷰가 없을 때의 박스 -->
				<div class="no-review-box">
					<div class="no-review-title">등록된 리뷰가 없습니다.</div>
				</div>
			<%
			}%>
		</div>
		
			<!-- 상품 문의 부분 -->
			<div class="product-qna-box">
				<!-- 문의 모달 창 -->
				<div class="qna-modal-box"></div>
					<div class="qna-modal-content-box">
						<div class="qna-modal-inner">
							<div class="qna-modal-top">
								<div class="qna-modal-title">상품 문의</div>
								<a href="#a" class="modal-close">+</a>
							</div>
							<form action="goods.qnaInsert" method="post">
								<div class="qna-modal-table-box">
									<input type="hidden" name="qna_goods_code" value="<%=productDTO.getGoods_code()%>">
									<input type="hidden" name="qna_goods_name" value="<%=productDTO.getGoods_name()%>">
									<table>
										<tr class="qna-modal-col">
											<td>상품정보</td>
											<td><%= productDTO.getGoods_name() %></td>
										</tr>
										<tr class="qna-modal-col">
											<td>문의내용</td>
											<td><textarea name="qna_content" maxlength="2048"></textarea>
											</td>
										</tr>
									</table>
								</div>
								<div class="qna-btn">
									<button type="submit" class="btnCss qnabtnCss">문의하기</button>
									<button type="reset" class="btnCss">다시 작성</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="product-qna-box-inner">
					<div class="product-qna-top">
						<div class="product-qna-title">상품문의</div>
						<a href="#a" class="qna-button">문의하기</a>
					</div>
					<div class="product-qna-detail-info">
						<ul>
							<li>구매한 상품의 취소/반품은 마이쿠팡 구매내역에서 신청 가능합니다.</li>
							<li>상품문의 및 후기게시판을 통해 취소나 환불, 반품 등은 처리되지 않습니다.</li>
							<li>가격, 판매자, 교환/환불 및 배송 등 해당 상품 자체와 관련 없는 문의는 고객센터 내 1:1
								문의하기를 이용해주세요.</li>
							<li>"해당 상품 자체"와 관계없는 글, 양도, 광고성, 욕설, 비방, 도배 등의 글은 예고 없이 이동,
								노출제한, 삭제 등의 조치가 취해질 수 있습니다.</li>
							<li>공개 게시판이므로 전화번호, 메일 주소 등 고객님의 소중한 개인정보는 절대 남기지 말아주세요.</li>
						</ul>
					</div>
					<!-- 질문과 답변이 있을 경우 -->
					<% if(qnaList != null){
						for(int i = 0; i < qnaList.size(); i++){
							%>
					<div class="qna-box">
						<div class="qna-question-box">
							<div class="question-writer"><%= qnaList.get(i).getQna_cust_id() %></div>
							<div class="question-product"><%= productDTO.getGoods_name() %></div>
							<div class="question-content"><%= qnaList.get(i).getQna_content() %></div>
							<button type="button">댓글 달기</button>
							<%if(qnaList.get(i).getQna_re_seq() == 0){
								%>
								<div class="qna-question-status">질문</div>
								<% 
							} else {
							%>
							<div class="qna-answer-status">답변</div>
							<%
							}%>
							<div class="qna-question-date"><%= qnaList.get(i).getQna_date() %></div>
						</div>
					</div>
				</div>
							<%
						}%>
						
						<%
					} 
					
					else {%>
					<!-- 질문과 답변이 없을 경우 -->
						<div class="qna-box">
							<div class="qna-noquestion-box">
								<div class="qna-question-box no-question">문의할 내용을 남겨주세요.</div>
							</div>
						</div>
						<%
					}%>
			<!-- qna pageList 부분 -->
			
			
			<!-- 배송/교환/환불 정보 내용 -->
			<div class="baesong-info-box">
				<div class="baesong-info">
					<div class="baesong-info-title">배송정보</div>
					<table class="baesong-info-table">
						<colgroup>
							<col width="150px">
							<col width="340px">
							<col width="150px">
						</colgroup>
						<tr class="baesong-col">
							<td>배송방법</td>
							<td>순차배송</td>
							<td rowspan="2">배송비</td>
							<td rowspan="2">무료배송<br> - 로켓배송 상품 중 19,800원 이상 구매 시
								무료배송<br> - 도서산간 지역 추가비용 없음
							</td>
						</tr>
						<tr class="baesong-col">
							<td>묶음배송 여부</td>
							<td>가능</td>
						</tr>
						<tr class="baesong-col">
							<td>배송기간</td>
							<td colspan="3">
								<ul>
									<li>서울지역 배송 : 주문 및 결제 완료 후, 1-2일 이내 도착</li>
									<li>서울지역 외 배송 : 주문 및 결제 완료 후, 2-3일 이내 도착</li>
									<li>천재지변, 물량 수급 변동 등 예외적인 사유 발생 시, 다소 지연될 수 있는 점 양해
										부탁드립니다.</li>
								</ul>
							</td>
						</tr>
					</table>
				</div>
				<div class="exchange-info-box">
					<div class="exchange-info-title">교환/반품 안내</div>
					<table class="exchange-info-table">
						<tr class="exchange-col">
							<td>교환/반품 비용</td>
							<td>5,000원<br> - 단, 고객 변심의 경우에만 발생<br> - 부분반품 시,
								남은금액이 무료배송 조건을 유지하면 일부 반품비용이 부과
							</td>
						</tr>
						<tr class="exchange-col">
							<td>교환/반품 신청 기준일</td>
							<td>5,000원<br> - 단순변심에 의한 로켓배송 상품의 교환/반품은 제품 수령 후 30일
								이내까지, 교환/반품 제한사항에 해당하지 않는 경우에만 가능 (교환/반품 비용 고객부담)<br> - 상품의
								내용이 표시·광고의 내용과 다른 경우에는 상품을 수령한 날부터 3개월 이내, 그 사실을 안 날 또는 알 수 있었던
								날부터 30일 이내에 청약철회 가능
							</td>
						</tr>
					</table>
				</div>
				<!-- 교환 반품 제한사항 -->
				<div class="restriction-info-box">
					<div class="restriction-info-title">교환/반품 제한사항</div>
					<ul>
						<li>주문/제작 상품의 경우, 상품의 제작이 이미 진행된 경우</li>
						<li>상품 포장을 개봉하여 사용 또는 설치 완료되어 상품의 가치가 훼손된 경우 (단, 내용 확인을 위한 포장
							개봉의 경우는 예외)</li>
						<li>고객의 사용, 시간경과, 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우</li>
						<li>세트상품 일부 사용, 구성품을 분실하였거나 취급 부주의로 인한 파손/고장/오염으로 재판매 불가한 경우</li>
						<li>모니터 해상도의 차이로 인해 색상이나 이미지가 실제와 달라, 고객이 단순 변심으로 교환/반품을 무료로
							요청하는 경우</li>
						<li>제조사의 사정 (신모델 출시 등) 및 부품 가격 변동 등에 의해 무료 교환/반품으로 요청하는 경우</li>
					</ul>
				</div>
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
	<script>
        $('.product-recommand-slide').slick({
        	  dots: true,
        	  infinite: false,
        	  speed: 300,
        	  slidesToShow: 4,
        	  autoplay: true,
        	  autoplaySpeed: 3000,
        	  infinite: true,
        	  slidesToScroll: 4,
        	  responsive: [
        	    {
        	      breakpoint: 1024,
        	      settings: {
        	        slidesToShow: 3,
        	        slidesToScroll: 3,
        	        infinite: true,
        	        dots: true
        	      }
        	    },
        	    {
        	      breakpoint: 600,
        	      settings: {
        	        slidesToShow: 2,
        	        slidesToScroll: 2
        	      }
        	    },
        	    {
        	      breakpoint: 480,
        	      settings: {
        	        slidesToShow: 1,
        	        slidesToScroll: 1
        	      }
        	    }
        	  ]
        	});

        $(".amount-up").click(function(){  // 상품 수량 input 값을 가감하는 함수
        	let upval = $(".buy-amount").val();
        	let upvalNumber = parseInt(upval);
        	
        	if(upval < 99){                     // 수량을 1~99까지의 설정
        		$(".buy-amount").val(upvalNumber + 1);
        	}
        	
        	let amount = parseInt($(".buy-amount").val());
        	let sell_price = parseInt($("#sell_price").val());
        	
        	let totalPrice = amount * sell_price;
        	let point = totalPrice * 0.1;
        	
        	let totalPrice1 = addComma(totalPrice.toString());
        	point = addComma(point.toString());
        	
        	$("#sum").attr("value",totalPrice); //form을 통해 가져가기 위해 설정
        	
        	$("#sum-price").html(totalPrice1);  //총 가격 출력
        	$(".point-focus").html(point); //포인트 부분 출력
        	
        });
        $(".amount-down").click(function(){  // 상품 수량 input 값을 가감하는 함수
        	let upval = $(".buy-amount").val();
        	
        	if(upval != 1){
        		$(".buy-amount").val(upval - 1);  // 수량을 1 밑으로 내려가지 못하게 설정
        	}
        	
        	let amount = parseInt($(".buy-amount").val());
        	let sell_price = parseInt($("#sell_price").val());
        	
        	let totalPrice = amount * sell_price;
        	let point = totalPrice * 0.1;
        	
        	let totalPrice1 = addComma(totalPrice.toString());
        	point = addComma(point.toString());
        	
        	$("#sum").attr("value",totalPrice);  //form을 통해 가져가기 위해 설정
        	
        	$("#sum-price").html(totalPrice1);  //총 가격 출력
        	$(".point-focus").html(point); //포인트 부분 출력
        });
        
        //날짜 계산
        let today = new Date();
        let month = today.getMonth() + 1;  //월에는 +1을 해주어야 한다!
        let day = today.getDate();
        let baesongday = day + 2;
        
        $("#baesong-day").html(month+"-"+baesongday);
        
        
        function addComma(value){  //comma찍는 함수
        	value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        	return value;
        }
        
        function submit2(form){  //바로가기로 form 정보를 보내기 위함
        	form.action="buyCheck.jsp";
        	form.submit();
        	return true;
        }
        

   		 //로드 되었을 때 받아온 별 값으로 미리 되어 있는 부분
   		 var getStar = $("#hiddenstar1").val();
   		 if(getStar = 5){
   			 $(".star-point > li > img").attr("src","logo/rate-star.png");
   				$("#hiddenstar").attr("value","5");
   		 }else if(getStar = 4){
   			 $("#star1,#star2,#star3,#star4").attr("src","logo/rate-star.png");
   				$("#star5").attr("src","logo/writing-star.png");
   				$("#hiddenstar").attr("value","4");
   		 }else if(getStar = 3){
   			 $("#star1,#star2,#star3").attr("src","logo/rate-star.png");
   				$("#star5,#star4").attr("src","logo/writing-star.png");
   				$("#hiddenstar").attr("value","3");
   		 }else if(getStar = 2){
   			 $("#star1,#star2").attr("src","logo/rate-star.png");
   				$("#star5,#star4,#star3").attr("src","logo/writing-star.png");
   				$("#hiddenstar").attr("value","2");
   		 }else{
   			 $("#star1").attr("src","logo/rate-star.png");
   				$("#star5,#star4,#star3,#star2").attr("src","logo/writing-star.png");
   				$("#hiddenstar").attr("value","1");
   		 }
   		 
        </script>
</body>
</html>