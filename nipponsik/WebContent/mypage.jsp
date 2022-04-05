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

List<OrderDTO> orderList = new ArrayList<OrderDTO>();
if(request.getAttribute("orderList") != null){
	orderList = (List)request.getAttribute("orderList");
}
int orderListCount = 0;
if(request.getAttribute("orderListCount") != null){
	orderListCount = Integer.parseInt(request.getAttribute("orderListCount").toString());
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>NIPPONSIK 마이페이지</title>
<link rel="stylesheet" type="text/css" href="mypage.css">
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
								<li><a href="review.manage">리뷰 관리</a></li>
								<li><a href="#a">찜 리스트</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="myrightinfo">
				<div class="myrighttop">
					<ul class="myrighttop_tul">
						<li>
							<div>미사용티켓</div> <a href="#a">0</a> <span class="count">장</span>
						</li>
						<li>
							<div>배송중</div> <a href="#a">0</a> <span class="count">개</span>
						</li>
						<li>
							<div>할인쿠폰</div> <a href="#a">0</a> <span class="count">장</span>
						</li>
						<li class="myrighttop_last">
							<ul class="myrighttop_lasttul">
								<li class="myrighttop_lastcol">
									<div class="usesum">이 달의 사용 금액</div> <a href="#a"
									class="sumlink">0</a> <span class="sumcount">원</span>
								</li>
								<li class="myrighttop_lastcol">
									<div class="usesum">포인트 적립액</div> <a href="#a" class="sumlink">0</a>
									<span class="sumcount">원</span>
								</li>
							</ul>
						</li>
					</ul>
				</div>
				<div class="myrightAll">
				<div class="myrightmiddle">
					<div class="ordermokrok-title">주문목록</div>
					<div class="ordermokroktul">
						<ul class="ordermokrok-tab">
							<li id="tab1" class="on">전체</li>
							<li id="tab2">예약/주문</li>
							<li id="tab3">포인트적립</li>
						</ul>
					</div>
					<div class="month-search">
						<table>
							<tr>
								<td class="tb-cell-1">
									<div class="month-search-box">
										<ul>
											<li><a href="#a">8월</a></li>
											<li><a href="#a">9월</a></li>
											<li><a href="#a">10월</a></li>
											<li><a href="#a">11월</a></li>
											<li><a href="#a">12월</a></li>
											<li class="active"><a href="#a">1월</a></li>
										</ul>
									</div>
								</td>
								<td class="tb-cell-2">
									<div class="orderprocesstul">
										<select name="orderprocess" class="orderprocess">
											<option value="전체상태">전체상태</option>
											<option value="결제진행중">결제진행중</option>
											<option value="결제대기중">결제대기중</option>
											<option value="결제완료">결제완료</option>
											<option value="배송확인">배송확인</option>
											<option value="구매완료">구매완료</option>
											<option value="취소">취소</option>
											<option value="반품">반품</option>
											<option value="교환">교환</option>
										</select>
									</div>
								</td>
								<td class="tb-cell-3">
									<div class="ordersearchbtn">
										<a href="#a">조회</a> <i class=""></i>
									</div>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<!-- 상품 주문 상태 -->
				<%
					if(orderList != null){
						for(int i=0; i<orderList.size();i++){
							%>
							<div class="order-product">
				<!-- 주문 상품이 있을 때 -->
					<div class="order-product-box">
						<div class="order-box-title">
							<h2 id="order-day"><%=orderList.get(i).getOrder_date() %> 주문</h2>
							<div class="order-moreDetail">
							    <a href="#a">주문하기<i class="xi-angle-right"></i></a>
							</div>
						</div>
						<div class="order-box-detail">
							<table>
								<tr>
									<td id="firstcol">
										<div class="order-status">
										<input type="hidden" value="<%=orderList.get(i).getOrder_date() %>" id="baesong-day-calc">
											<h2 class="order-status-current">배송완료</h2>
											<h2 class="baesongDate"></h2>
											<span>도착</span>
										</div>
										<div class="order-add-detail">
											<a href="product.detail?goods_code=<%=orderList.get(i).getOrder_goodsCode()%>">
												<div class="image-box">
													<img alt="" src="indexpicture/<%=orderList.get(i).getOrder_goodsCategory() %>/<%=orderList.get(i).getOrder_goodsCode()%>.png">
											</div>
											</a>
											<div class="add-detail-box">
												<a href="product.detail?goods_code=<%=orderList.get(i).getOrder_goodsCode()%>">
													<div class="add-detail-title"><%=orderList.get(i).getOrder_goodsName() %></div>
												</a>
												<div class="add-detail-price">
													<div class="detail-price"><fmt:formatNumber value="<%=orderList.get(i).getOrder_goodsPrice() %>" />원  <fmt:formatNumber value="<%=orderList.get(i).getOrder_goodsAmount() %>" />개 </div>
													<a href="#a">장바구니 담기</a>
												</div>
											</div>
										</div>
									</td>
									<td id="secondcol">
										<div>
											<a href="#" class="on">배송조회</a>
										</div>
										<div>
											<a href="#">교환,반품 신청</a>
										</div>
										<div>
											<a href="#">리뷰 작성하기</a>
										</div>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
							<%
						}
						%>
						<%
					} else if(orderList == null){
						%>
					<!-- 주문 상품이 없을 때 -->
					<div class="order-product">
						<div class="no-order-product-box">
							<h4>주문하신 상품이 없습니다.</h4>
						</div>
					</div>
						<%
					}
				%>
				<!-- 배송 관련 정보 -->
				<div class="baesong-info-box">
					<div class="baesong-info-inner">
						<div class="baesong-info-top">
							<div class="baesong-info-top-title">
								<h1>배송상품 주문상태 안내</h1>
							</div>
							<div class="baesong-info-top-img">
								<img alt="" src="logo/baesong.png">
							</div>
						</div>
						<div class="baesong-info-middle">
							<div class="baesong-info-middle-title">
								<span>취소/반품/교환 신청</span>
								<span>전 확인해주세요!</span>
							</div>
							<!-- 캔슬 정보 -->
							<div class="baesong-info-middle-contentTitle">
								<div class="baesong-info-middle-inner-title">취소</div>
								<div class="baesong-info-middle-content">
									- 여행/레저/숙박 상품은 취소 시 수수료가 발생할 수 있으며,
								</div>
								<div class="baesong-info-middle-content">
									취소수수료를 확인하여 2일 이내(주말,공휴일 제외) 처리결과를 문자로 안내해드립니다.(당일 접수 기준, 마감시간 오후 4시)
								</div>
								<div class="baesong-info-middle-content">
									- 문화 상품은 사용 전날 24시까지 취소 신청 시 취소수수료가 발생되지 않습니다.
								</div>
							</div>
							<!-- 반품 정보 -->
							<div class="baesong-info-middle-contentTitle">
								<div class="baesong-info-middle-inner-title">반품</div>
								<div class="baesong-info-middle-content">
									- 상품 수령 후 7일 이내 신청하여 주세요.
								</div>
								<div class="baesong-info-middle-content">
									- 상품이 출고된 이후에는 배송 완료 후, 반품 상품을 회수합니다.
								</div>
								<div class="baesong-info-middle-content">
									- 설치상품/주문제작/해외배송/신선냉동 상품 등은 고객센터에서만 반품 신청이 가능합니다.
								</div>
							</div>
							<!-- 교환 정보 -->
							<div class="baesong-info-middle-contentTitle">
								<div class="baesong-info-middle-inner-title">교환</div>
								<div class="baesong-info-middle-content">
									- 상품의 교환 신청은 고객센터로 문의하여 주세요.
								</div>
							</div>
						</div>
					</div>
				</div>
             </div>
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
	
	$("#tab1").on("click",function(){
		$(this).addClass("on");
		$("#tab2").removeClass("on");
		$("#tab3").removeClass("on");
	});
	$("#tab2").on("click",function(){
		$(this).addClass("on");
		$("#tab1").removeClass("on");
		$("#tab3").removeClass("on");
	});
	$("#tab3").on("click",function(){
		$(this).addClass("on");
		$("#tab1").removeClass("on");
		$("#tab2").removeClass("on");
	});
	
	var baesongdayBefore = $("#baesong-day-calc").val();  //배송 날짜 계산 관련
	var baesongdayAfter = new Date(baesongdayBefore);
	baesongdayAfter.setDate(baesongdayAfter.getDate() +2);
	var day = baesongdayAfter.getDate();
	var month = baesongdayAfter.getMonth() + 1;
	var dayFormat = month + "/" + day;
	
	$(".baesongDate").html(dayFormat);
	
</script>
</body>
</html>