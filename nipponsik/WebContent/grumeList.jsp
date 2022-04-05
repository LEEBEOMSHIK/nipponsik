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
	<title>NIPPONSIK 구루메 리스트</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<script type="text/javascript" src="indexpage.js"></script>
	<link rel="stylesheet" type="text/css" href="indexpage.css">
	<link rel="stylesheet" type="text/css" href="grumeList.css">
	<link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
  <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
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
	<!-- 구루메 리스트 박스 -->
	<section class="grume-list-total-box">
		<!-- 1080px frame -->
		<div class="grume-list-inner-frame">
		<!-- total table box -->
			<div class="grume-list-tabel-box">
				<table>
					<tr>
						<td>
							<!-- 왼쪽 카테고리 선택 부분 -->
							<div class="grume-list-condition">
								<!-- 전체 테이블 -->
								<table class="grume-list-all-table">
									<tr>
										<td>
										<!-- 장르에서 찾기 테이블 -->
											<table>
												<tr>
													<td>
														<div class="grume-list-category-title">
															장르
															<span>에서 찾기</span>
														</div>
													</td>
												</tr>
												<tr>
												<!-- 장르에서 찾기 보여주기-->
													<td>
														<a href="#a" class="grume-list-category-show">
															닭고기  <!-- 음식 장르 입력 -->
															<div class="grume-genre-detail-list">
																
															</div>
														</a>
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<!-- 장소에서 찾기 테이블 -->
									<tr>
										<td>
											<table>
												<tr>
													<td>
														<div class="grume-list-category-title">
															장소
															<span>에서 찾기</span>
														</div>
													</td>
												</tr>
												<tr>
												<!-- 장르에서 찾기 보여주기-->
													<td>
														<a href="#a" class="grume-list-category-show">
															닭고기  <!-- 음식 장르 입력 -->
															<div class="grume-area-detail-list">
																
															</div>
														</a>
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<!-- 키워드로 찾기 -->
									<tr>
										<td>
											<table>
												<tr>
													<td>
														<div class="grume-list-category-title">
															키워드
															<span>로 찾기</span>
														</div>
													</td>
												</tr>
												<tr>
													<td>
													<form action="" method="post"> <!-- 어디로 보낼 것인지 입력 -->
														<div class="keyword-search-box">
															<input type="text" name="grume_search_keyword" placeholder="키워드(한 단어)">
															<button type="submit">검색</button>
														</div>
													</form>
													</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</div>
						</td>
						<!-- 오른쪽 리스트 필드 -->
						<td>
							<table>
								<tr>
									<td>
										<div class="grume-list-right-title">
											<h1>일본의 ???요리</h1>
										</div>
										<div>
											<span>총</span>
											<span>??</span>
											<span>건 중 1~15건 표시</span>
										</div>
									</td>
								</tr>
							</table>
							<!-- 리스트 탭 부분 -->
							<ul>
								<li>추천 순</li>
								<li>찜 수순</li>
								<li>이름 순</li>
							</ul>
							
							<!-- 구루메 리스트 -->
							<table class="grume-list-table">
								<tr>
									<td>
										<!-- 리스트 이미지 부분 -->
										<div class="list-img-box">
											<div class="list-img-in">
												<a href="#a">
													<img alt="" src="">
												</a>
											</div>
										</div>
									</td>
									<td width="15"></td>
									<td>
										<div class="grume-food-detail-box">
											<!-- 타이틀 부분 -->
											<div class="grume-food-top">
												<div class="grume-food-title">닭고기</div>
												<div class="grume-food-detail">
													<span>서울</span>
													<span> > </span>
													<span>상세 주소</span>
													<a href="#a" class="favorit">
														<span>
															<img alt="" src="" width="18">
															<span>찜 수</span>
														</span>
													</a>
												</div>
											</div>
											<!-- 상세 설명 부분 -->
											<div class="grume-food-middle">
												<a href="#a">상세 타이틀</a> <!-- 구루미 상세의 타이틀이 여기에 옴 -->
												<div class="grume-food-middle-detail">상세설명1</div>
												<div class="grume-food-middle-detail">상세설명2</div>
												<div class="grume-food-middle-detail">상세설명3</div>
											</div>
										</div>
									</td>
								</tr>
							</table>
							<!-- 페이징 부분 시작 -->
							<div></div>
						</td>
					</tr>
				</table>
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
</body>
</html>