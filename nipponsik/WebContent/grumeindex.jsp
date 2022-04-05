<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="userDAO.UserDAO" %>
<%@ page import="userDTO.UserDTO" %>
<%
	request.setCharacterEncoding("utf-8");
    
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
<title>NIPPONSIK 장바구니</title>
<link rel="stylesheet" type="text/css" href="myhometopfooter.css">
<link rel="stylesheet" type="text/css" href="cartpage.css">
<link rel="stylesheet" type="text/css" href="grumeindex.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="myhome.js"></script>
<link rel="stylesheet"
	href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
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
	<!-- 중간 section부분 -->
	<section class="grume-full-section">
		<div class="grume-section-tul">
			<div class="first-grume-box">
				<div class="grume-genre-navi">
					<div class="grume-navi-title">
						<h2>일본 구루메</h2>
					</div>
					<div class="genre-search-table">
						<table>
							<tr class="genre-search-tr1">
								<td class="grume-table-first-col">
									<a href="#a">
										<div class="grume-table-title">
											<span>장르로 찾기</span>
										</div>
										<div class="more-see-box">
											<span>더보기</span>
											<i class="xi-angle-right-min"></i>
										</div>
									</a>
								</td>
							</tr>
							<tr>
								<td class="grume-table-col">
									<a href="#a">스시</a>
									<a href="#a">해산물요리</a>
									<a href="#a">튀김요리</a>
									<a href="#a">면요리</a>
									<a href="#a">닭요리</a>
									<a href="#a">꼬치요리</a>
									<a href="#a">나베요리</a>
									<a href="#a">오뎅</a>
									<a href="#a">덮밥요리</a>
								</td>
							</tr>
							<tr class="genre-search-tr2">
								<td class="grume-table-first-col">
									<a href="#a">
										<div class="grume-table-title">
											<span>에리어로 찾기</span>
										</div>
										<div class="more-see-box">
											<span>더보기</span>
											<i class="xi-angle-right-min"></i>
										</div>
									</a>
								</td>
							</tr>
							<tr>
								<td class="grume-table-col">
									<a href="#a">도쿄</a>
									<a href="#a">오사카</a>
									<a href="#a">홋카이도</a>
									<a href="#a">아이치</a>
									<a href="#a">후쿠오카</a>
									<a href="#a">시즈오카</a>
									<a href="#a">교토</a>
								</td>
							</tr>
							<tr>
								<td class="search-col">
									<div class="search-area-box">
										<input type="text" name="grume-search">
										<button type="submit">검색</button>
									</div>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="grume-image-slide-box">
					<div class="grume-image-slide">
						<div class="grume-slide">
							<a href="#a">
								<img alt="" src="indexpicture/mainslide1.png">
							</a>
						</div>
						<div class="grume-slide">
							<a href="#a">
								<img alt="" src="indexpicture/mainslide2.png">
							</a>
						</div>
						<div class="grume-slide">
							<a href="#a">
								<img alt="" src="indexpicture/mainslide1.png">
							</a>
						</div>
						<div class="grume-slide">
							<a href="#a">
								<img alt="" src="indexpicture/mainslide2.png">
							</a>
						</div>
					</div>
					<div class="grume-image-slide-info-box">
						<a href="#a">
							<span>일본 구루메 Best10</span>
						</a>
					</div>
				</div>
			</div>
			
			<!-- 두번째 섹션 -->
			<div class="second-grume-box">
				<div class="second-grume-title-box">
					<div class="second-grume-title">
						<h2>NIPPONSIK의 추천</h2>
					</div>
					<div class="second-grume-more-see-box">
						<a href="#a">
							<span>더보기</span>
							<i class="xi-angle-right-min"></i>
						</a>
					</div>
				</div>
				<!-- NIPPONSIK 일본 음식 리스트 부분 -->
				<div class="nipponsik-list-box">
					<ul>
						<li class="nipponsik-one-list">
							<a href="#a" class="nipponsik-list-link">
								<div class="nipponsik-list-img">
									<img alt="" src="indexpicture/3/10001.PNG">
								</div>
								<div>
									<div class="nipponsik-list-title">일본 정식집</div>
									<div class="nipponsik-list-content">일본 정식집</div>
								</div>
							</a>
						</li>
						<li class="nipponsik-one-list">
							<a href="#a" class="nipponsik-list-link">
								<div class="nipponsik-list-img">
									<img alt="" src="indexpicture/3/10001.PNG">
								</div>
								<div>
									<div class="nipponsik-list-title">일본 정식집</div>
									<div class="nipponsik-list-content">일본 정식집</div>
								</div>
							</a>
						</li>
						<li class="nipponsik-one-list">
							<a href="#a" class="nipponsik-list-link">
								<div class="nipponsik-list-img">
									<img alt="" src="indexpicture/3/10001.PNG">
								</div>
								<div>
									<div class="nipponsik-list-title">일본 정식집</div>
									<div class="nipponsik-list-content">일본 정식집</div>
								</div>
							</a>
						</li>
					</ul>
					<ul>
						<li class="nipponsik-one-list">
							<a href="#a" class="nipponsik-list-link">
								<div class="nipponsik-list-img">
									<img alt="" src="indexpicture/3/10001.PNG">
								</div>
								<div>
									<div class="nipponsik-list-title">일본 정식집</div>
									<div class="nipponsik-list-content">일본 정식집</div>
								</div>
							</a>
						</li>
						<li class="nipponsik-one-list">
							<a href="#a" class="nipponsik-list-link">
								<div class="nipponsik-list-img">
									<img alt="" src="indexpicture/3/10001.PNG">
								</div>
								<div>
									<div class="nipponsik-list-title">일본 정식집</div>
									<div class="nipponsik-list-content">일본 정식집</div>
								</div>
							</a>
						</li>
						<li class="nipponsik-one-list">
							<a href="#a" class="nipponsik-list-link">
								<div class="nipponsik-list-img">
									<img alt="" src="indexpicture/3/10001.PNG">
								</div>
								<div>
									<div class="nipponsik-list-title">일본 정식집</div>
									<div class="nipponsik-list-content">일본 정식집</div>
								</div>
							</a>
						</li>
					</ul>
				</div>
			</div>
			<!-- 세번째 섹션 -->
			<div class="third-grume-box">
				<div class="second-grume-title-box">
					<div class="second-grume-title">
						<h2>장르별 음식 체크</h2>
					</div>
					<div class="second-grume-more-see-box">
						<a href="#a">
							<span>더보기</span>
							<i class="xi-angle-right-min"></i>
						</a>
					</div>
				</div>
				<!-- 장르별 음식체크 리스트 -->
				<div class="genre-check-list">
					<ul>
						<li>야키니쿠</li>
						<li>소고기</li>
						<li>돼지고기</li>
						<li>닭고기</li>
						<li>해산물</li>
						<li>나베</li>
					</ul>
					<ul>
						<li>일본 정식</li>
						<li>면</li>
						<li>전통차</li>
						<li>음료</li>
						<li>죽</li>
						<li>그 밖의 요리</li>
					</ul>
				</div>
				<div class="grume-genre-content-box">
					<ul>
						<li>
							<a href="#a">
								<div class="grume-genre-content-img">
									<img alt="" src="indexpicture/10002.png">
								</div>
								<div class="grume-genre-content-title">컨텐츠 타이틀</div>
								<div class="grume-genre-content">컨텐츠 내용</div>
							</a>
						</li>
						<li>
							<a href="#a">
								<div class="grume-genre-content-img">
									<img alt="" src="indexpicture/10002.png">
								</div>
								<div class="grume-genre-content-title">컨텐츠 타이틀</div>
								<div class="grume-genre-content">컨텐츠 내용</div>
							</a>
						</li>
						<li>
							<a href="#a">
								<div class="grume-genre-content-img">
									<img alt="" src="indexpicture/10002.png">
								</div>
								<div class="grume-genre-content-title">컨텐츠 타이틀</div>
								<div class="grume-genre-content">컨텐츠 내용</div>
							</a>
						</li>
						<li>
							<a href="#a">
								<div class="grume-genre-content-img">
									<img alt="" src="indexpicture/10002.png">
								</div>
								<div class="grume-genre-content-title">컨텐츠 타이틀</div>
								<div class="grume-genre-content">컨텐츠 내용</div>
							</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</section>
	<!-- footer 부분 -->
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
			$('.grume-image-slide').slick({
				autoplay: true,
				infinite: true,
				speed: 400,
				pause: 4000,
				autoControls: true,
				dots: true
			});
	</script>
	</body>
</html>
	