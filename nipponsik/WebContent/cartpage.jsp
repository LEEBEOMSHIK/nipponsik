<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="userDTO.UserDTO" %>
<%@ page import="userDAO.UserDAO" %>
<%@ page import="cartDAO.CartDAO" %>
<%@ page import="cartDTO.CartDTO" %>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	request.setCharacterEncoding("utf-8");
    
    String id = null;
    if(session.getAttribute("idbox") != null){
    	id = (String) session.getAttribute("idbox");
    }
    UserDAO userDAO = new UserDAO();
    UserDTO userDTO = userDAO.selectUser(id);
    
    ArrayList<CartDTO> list = new ArrayList<CartDTO>();
    list = (ArrayList<CartDTO>) request.getAttribute("list");
    
    String cartCount = String.valueOf(request.getAttribute("cartCount"));  // int 값을 String으로 변경시킬 때 valueOf를 사용함 (null값도 문자열로 반환하여 출력) - null값 오류가 사라짐
    int cartCount2 = 0;
    if(cartCount != null){
    	cartCount2 = Integer.parseInt(cartCount);
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NIPPONSIK 장바구니</title>
<link rel="stylesheet" type="text/css" href="myhometopfooter.css">
<link rel="stylesheet" type="text/css" href="cartpage.css">
<script type="text/javascript" src="cartpage.js"></script>
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
	<% if(list != null && id != null){
		%>
			<section class="cart-middle">
	 	<div class="cart-section-bax">
		<div class="cart-process-status"></div>
		<div class="cart-content-box">
			<div class="cart-reservation">
				<table>
					<tr class="table-head">
						<td>
							<label for="select-all" class="selectAll-label">
								<input type="checkbox" name="select-all" value="selectAll" id="select-all" class="select-all">
								<span>전체선택</span>
							</label>
						</td>
						<td colspan="2">상품정보</td>
						<td>상품금액</td>
						<td>배송비</td>
					</tr>
					<!-- list for문 -->
					<% for(int i=0; i<list.size(); i++){
						%>
						<tr class="table-content">
						<td><input type="checkbox" name="select-product" value="select-product" class="select-product" id="select-product" value="<%=list.get(i).getGoods_price() %>"></td>
						<td><a href="product.detail?goods_code=<%=list.get(i).getGoods_code() %>"><img src="indexpicture/<%=list.get(i).getGoods_category() %>/<%=list.get(i).getGoods_code() %>.png" alt=""></a></td>
						<td>
							<div class="cart-product-title">
								<a href="product.detail?goods_code=<%=list.get(i).getGoods_code() %>" class="cart-product-title-inner"><%= list.get(i).getGoods_name() %></a>
							</div>
							<div class="cart-product-detail">
								<div class="product-detail-top">
									<div class="product-baesong-detail">
										<span><%= list.get(i).getCart_date().substring(6,10) %> 도착 보장</span>
										<span>(밤 12시 전 주문 시)</span>
									</div>
									<div class="product-cost">
										<div class="one-product-cost">
											<input type="hidden" class="sell_price" id="sell_price" value="<%= list.get(i).getGoods_price()%>">
											<input type="hidden" class="sum_sell_price" value="1">
											<div class="one-price"><fmt:formatNumber value="<%= list.get(i).getGoods_price() %>" pattern="#,###" />원</div>
											<select name="product-amount" id="selectValue" class="selectValue" onchange="changeAmount()">
												<option value="<%=list.get(i).getAmount()%>"><%=list.get(i).getAmount()%></option>
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
												<option value="5">5</option>
												<option value="6">6</option>
												<option value="7">7</option>
												<option value="8">8</option>
												<option value="9">9</option>
												<option value="10">10</option>
											</select>
										</div>
										<div class="total-product-cost">
											<div class="total-price">
												<span id="totalPrice" class="totalPrice"><fmt:formatNumber value="<%= list.get(i).getGoods_price()*list.get(i).getAmount() %>" pattern="#,###" /></span>
												원
											</div>
											<a href="cartDelete.co?cart_num=<%= list.get(i).getCart_num() %>" id="delete-x">
												<i class="xi-close-thin"></i>
											</a>
										</div>
									</div>
								</div>
								<div class="product-detail-bottom">
									<div class="point-box">
										<i class="point-picture"></i>
										 최대 <fmt:formatNumber value="<%= list.get(i).getGoods_price()*0.1 %>" pattern="#,###" />원 적립
									</div>
								</div>
							</div>
						</td>
						<td>
							<span class="totalPrice2"><fmt:formatNumber value="<%= list.get(i).getGoods_price() %>" pattern="#,###" /></span>
							원
						</td>
						<td>무료</td>
					</tr>
						
						<% 
					}%>
					
					<tr class="third-col">
						<td colspan="5">
							<div class="price-summary">
								<span>상품가격</span>
								<span class="totalProductCost">26,800</span>
								<span>원</span>
								<span></span>
								<span>배송비</span>
								<span>무료</span>
								<span></span>
								<span>주문금액</span>
								<span class="totalProductCost">26,800</span>
								<span>원</span>
							</div>
						</td>
					</tr>
				</table>
			</div>
			<div class="cart-table-foot">
				<div class="cart-selectAll">
					<label for="selectAll"><input type="checkbox" value="selectAll" id="selectAll" class="select-all2">전체 선택 (
					<span class="checkedLength">0</span>
					/ <%= cartCount2 %> )</label>
				</div>
				<a href="cartDeleteAll.co">전체 삭제</a>
			</div>
			<div class="final-cost-confirm">
				<div class="final-cost-confirm-innerbox">
					<span>총 상품 가격</span>
					<span>26,800</span>
					<span>원</span>
					<span></span>
					<span>총 배송비</span>
					<span>0</span>
					<span>원</span>
					<span></span>
					<span>총 주문 금액</span>
					<span>26,800원</span>
				</div>
			</div>
			<div class="btns">
				<a href="indexpage.jsp">계속 쇼핑하기</a>
				<a href="#a">구매하기</a>
			</div>
		</div>
		</div>
	</section>
		
		<%
	} else {%>
	<!-- list 값이 없는 경우 -->
	<section class="cart-middle">
	 	<div class="cart-section-bax">
		<div class="cart-process-status"></div>
		<div class="cart-content-box">
			<div class="cart-reservation">
				<table>
					<tr class="table-head">
						<td colspan="2">상품정보</td>
						<td>상품금액</td>
						<td>배송비</td>
					</tr>
					<tr>
						<td colspan="4" class="cart-no-item">
							<p class="cart-no-item-title">장바구니에 담긴 상품이 없습니다</p>
						</td>
					</tr>
				</table>
			</div>
			<div class="cart-no-item-recommend-box">
				<div class="cart-no-item-recommend-inner">
					<div>
						<p>오늘의 추천 상품</p>
						<p>보러가기</p>
					</div>
					<a href="indexpage.jsp">계속 쇼핑하기</a>
				</div>
			</div>
		</div>
		</div>
	</section>
	<% } %>

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
	
	$(".select-all").on("click",function(){
		var checked = 0;
		
		if($(".select-all").is(":checked")){
			$(".select-product").prop("checked",true);
			$(".select-all2").prop("checked",true);
			if($(".select-product:checked").length != 0){
				checked = $(".select-product:checked").length;
			}
			$(".checkedLength").text(checked);
		} else {
			$(".select-product").prop("checked",false);  // 왜 반대로 나오지??
			$(".select-all2").prop("checked",false);
			if($(".select-product:checked").length != 0){
				checked = $(".select-product:checked").length;
			}
			
			$(".checkedLength").text(checked);
		}
		console.log(checked);
	});
	
	$(".select-all2").on("click",function(){

		var	checked = 0;
		
		if($(".select-all2").is(":checked")){
			$(".select-product").prop("checked",true);
			$(".select-all").prop("checked",true);
			if($(".select-product:checked").length != 0){
				checked = $(".select-product:checked").length;
			}
			$(".checkedLength").text(checked);
		} else {
			$(".select-product").prop("checked",false);  // 왜 반대로 나오지??
			$(".select-all").prop("checked",false);
			if($(".select-product:checked").length != 0){
				checked = $(".select-product:checked").length;
			}
			$(".checkedLength").text(checked);
		}
	});
	
	$(".select-product").on("click",function(idx){  // 한번 누르고 나면 전체 선택 부분이 움직이지 않음
		var checked = 0;
		
		if($(".select-product:checked").length != 0){
			checked = $(".select-product:checked").length;
		}
		
		var total = $(".select-product").length;
		
		if(total == checked){
			$(".select-all").prop("checked",true);
			$(".select-all2").prop("checked",true);
			$(".checkedLength").text(checked);
		} else {
			$(".select-all").prop("checked",false);
			$(".select-all2").prop("checked",false);
			$(".checkedLength").text(checked);
		}
		
		//체크된 값 더해서 넣기
		$(".select-product:checked").each(function(idx,e){
			var total = 0;
			var priceOne = $(".select-product:checked").eq(idx).val();
			console.log(priceOne);
			
			//형변환
			total += parseInt(priceOne);  //더하기가 제대로 이루어지지 않음
			console.log(total);  //마지막 값만 잡힘...
			total = total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			$(".totalProductCost").html(total);
		});
	});

	//카트 자동 계산 부분
	function changeAmount(){
		$(".sell_price , .selectValue").each(function(idx){
			var sellPrice = $(".sell_price").eq(idx).val();
			var amount = $(".selectValue").eq(idx).val();
			
			//형변환
			sellPrice = sellPrice*1;
			amount = amount*1;
			
			var total = sellPrice*amount;
			$(".select-product").eq(idx).val(total);
			// 3자리 컴마 추가
			total = total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			$(".totalPrice").eq(idx).html(total);
			$(".totalPrice2").eq(idx).html(total);
		});
	}
	
	function addComma(value){
		value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
</script>
</body>
</html>