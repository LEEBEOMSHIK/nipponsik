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
	}
	UserDAO userDAO = new UserDAO();
	UserDTO userDTO = userDAO.selectUser(id);

	IndexGoodsDAO indexGoodsDAO = new IndexGoodsDAO();
%>
<!DOCTYPE html>
<html>
<head>
<title>NIPPONSIK</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript"
	src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script type="text/javascript" src="indexpage.js"></script>
<link rel="stylesheet" type="text/css" href="indexpage.css">
<link rel="stylesheet"
	href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" type="text/css"
	href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
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
							<li class="mypage"><a href="list.order" onclick="return loginCheck()"><i
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
	<div class="section">
		<section class="topsection">
			<article class="mainslide">
				<div>
					<a href="product.detail?goods_code=10036"><img
						src="indexpicture/yakisobaslide.png"></a>
				</div>
				<div>
					<a href="product.detail?goods_code=10076"><img
						src="indexpicture/melonsodamainslide.png"></a>
				</div>
			</article>
		</section>

		<script type="text/javascript">
			$('.mainslide').slick({
				autoplay : true,
				infinite : true,
				speed : 400,
				pause : 4000,
				autoControls : true,
				dots : true
			});
		</script>

		<section class="middleinfo">
			<ul>
				<li class="news">
					<div class="newstitlebox">
						<span class="newstitle">일본의 최신 뉴스</span> <span class="newslist"><i
							class="xi-bars"></i>더보기</span>
					</div>
					<div class="recentnewsbox">
						<ul>
							<li>회전초밥 체인점에서 소바를 팔지 않는 이유?<i class="xi-camera"></i></li>
							<li>다급한 일본,도쿄 모든 음식점 금주령 내렸다...<i class="xi-camera"></i></li>
							<li>일본 내에서 비비고가 급격하게 성장!!<i class="xi-camera"></i></li>
							<li>일본음식인 줄 알았다고? 사실은 우리나라가 원조<i class="xi-camera"></i></li>
							<li>'한류 열풍'에 한식 위상 높아져...<i class="xi-camera"></i></li>
						</ul>
					</div>
				</li>
				<li class="event">
					<div class="eventtitlebox">
						<span class="eventtitle">이번 달 행사/이벤트</span> <span
							class="eventlist"><i class="xi-bars"></i>더보기</span>
					</div>
					<div class="eventbox">
						<ul>
							<li class="event1"><img src="indexpicture/event1.png"><span>매주
									화요일 한개의 상품이 1엔!!</span></li>
							<li class="event2"><img src="indexpicture/event2.png"><span>매주
									목요일 모든상품 3배 포인트!!</span></li>
							<li class="event3"><img src="indexpicture/event3.png"><span>매주
									토/일요일 수량한정 특가!!</span></li>
						</ul>
					</div>
				</li>
				<li class="recipe">
					<div class="recipetitlebox">
						<span class="recipetitle">이번 달 일본 요리 레시피</span> <span
							class="recipelist"><i class="xi-bars"></i>더보기</span>
					</div>
					<div class="recipemain">
						<div class="pictureinfo">
							<img src="indexpicture/woodbackground.jpg">
						</div>
						<div class="recipepicture">
							<img src="indexpicture/woodbackground.jpg" name="back"><img
								src="indexpicture/recipe3.png" name="front">
						</div>
					</div>
					<div class="recipeinfo">
						<i class="xi-angle-right-min"></i>일본 드라마 '카모메 식당'에서 나온 요리를 배워보자!
					</div>
				</li>
			</ul>
		</section>
		<div class="campaign">이 달의 캠페인 중인 상품</div>
		<section class="campaignTag">
			<ul>
				<li class="cam1"><a href="product.detail?goods_code=10077">
						<div class="campicture">
							<img src="indexpicture/8/10077.png">
						</div>
						<div class="camproduct">
							<div class="productname">아사히 음료 발효 BLED 요구르트 앤 칼피스 500ml 24팩</div>
							<div class="productdetail">
								<span class="pointcolor"><i class="xi-star"></i></span> <span
									class="pointcolor">4.9</span> <span class="nonpointcolor">/5.0(31)</span>
							</div>
							<div class="productprice">
								<span class="pricetitle">판매가격</span> <span class="priceinfo">89,880원</span>
							</div>
						</div>
						<div class="camsale">[할인] 3000원 할인 중</div>
				</a></li>
				<li class="cam1"><a href="product.detail?goods_code=10082">
						<div class="campicture">
							<img src="indexpicture/9/10082.png">
						</div>
						<div class="camproduct">
							<div class="productname">아지노모토 크노르 스프 파스타 DELI 버라이어티 박스 18봉입 토마토/버섯/명란젓</div>
							<div class="productdetail">
								<span class="pointcolor"><i class="xi-star"></i></span> <span
									class="pointcolor">4.8</span> <span class="nonpointcolor">/5.0(35)</span>
							</div>
							<div class="productprice">
								<span class="pricetitle">판매가격</span> <span class="priceinfo">18,000원</span>
							</div>
						</div>
						<div class="camsale">[증정] 2+1 행사 중</div>
				</a></li>
				<li class="cam1"><a href="product.detail?goods_code=10090">
						<div class="campicture">
							<img src="indexpicture/9/10090.png">
						</div>
						<div class="camproduct">
							<div class="productname">오사카오조 고기만두 50개입×2(총 100개) 양념×12봉 포함</div>
							<div class="productdetail">
								<span class="pointcolor"><i class="xi-star"></i></span> <span
									class="pointcolor">4.3</span> <span class="nonpointcolor">/5.0(40)</span>
							</div>
							<div class="productprice">
								<span class="pricetitle">판매가격</span> <span class="priceinfo">32,000원</span>
							</div>
						</div>
						<div class="camsale">[증정] 1+1 행사 중</div>
				</a></li>
				<li class="cam1"><a href="product.detail?goods_code=10098">
						<div class="campicture">
							<img src="indexpicture/10/10098.png">
						</div>
						<div class="camproduct">
							<div class="productname">가고시마 흑돼지 상등심 고기 흑돼지 5장 세트</div>
							<div class="productdetail">
								<span class="pointcolor"><i class="xi-star"></i></span> <span
									class="pointcolor">4.5</span> <span class="nonpointcolor">/5.0(100)</span>
							</div>
							<div class="productprice">
								<span class="pricetitle">판매가격</span> <span class="priceinfo">70,000원</span>
							</div>
						</div>
						<div class="camsale">[할인] 4000원 할인 중</div>
				</a></li>
				<li class="cam1"><a href="product.detail?goods_code=10056">
						<div class="campicture">
							<img src="indexpicture/6/10056.png">
						</div>
						<div class="camproduct">
							<div class="productname">폰슈구리아 일본주 세트 유자 복숭아 사과 딸기 세트</div>
							<div class="productdetail">
								<span class="pointcolor"><i class="xi-star"></i></span> <span
									class="pointcolor">4.7</span> <span class="nonpointcolor">/5.0(155)</span>
							</div>
							<div class="productprice">
								<span class="pricetitle">판매가격</span> <span class="priceinfo">50,000원</span>
							</div>
						</div>
						<div class="camsale">[증정] 사운품 증정 중</div>
				</a></li>
				<div class="interestposition">
					<aside class="interestproduct">
						<div class="toptitle">
							찾는 상품<br> 맞으신가요?
						</div>
						<div class="interestimg">
							<img src="indexpicture/cate2rank4.png">
						</div>
						<div class="producttitle">혼쯔유</div>
					</aside>
					<div class="adslistbtn">더 알아보기</div>

					<div class="myview">
						<div class="sidecart"></div>
						<div class="recentlyview"></div>
						<div class="recentlyviewlist"></div>
					</div>
				</div>
			</ul>
		</section>
		<div class="category">
			<img src="indexpicture/category.png">
		</div>
		<section class="rankingTag">
			<div class="displayflex">
				<div class="categoryleft">
					<div class="categoryleft1">
						<a href="#a"><div class="categoryleft1title">과자</div></a> <a
							href="#a"><div class="categoryleft1list">전체보기</div></a>
					</div>
					<div class="categoryleft2">
						<div class="categoryleft2title">HOT키워드</div>
						<div class="categoryleft2keyword">
							<ul>
								<a href="#a"><li>#일본과자</li></a>
								<a href="#a"><li>#스위트</li></a>
								<a href="#a"><li>#간편식</li></a>
								<a href="#a"><li>#빵류</li></a>
							</ul>
						</div>
					</div>
				</div>
				<%
					int goods_category = 3;
					List<ProductDTO> allList = indexGoodsDAO.allGoodsSelect(goods_category);
				%>
				<div class="categorycenter">
					<div class="categorycenterpic">
						<a
							href="product.detail?goods_code=<%=allList.get(12).getGoods_code()%>"><div>
								<img
									src="indexpicture/<%=allList.get(12).getGoods_category()%>/<%=allList.get(12).getGoods_code()%>_index.png">
							</div>
							<div class="categorycentercaption">
								<p>일본에서 난리난 초코샌드</p>
								<p>여기서만 맛볼 수 있는</p>
							</div> </a> <a
							href="product.detail?goods_code=<%=allList.get(13).getGoods_code()%>"><div>
								<img
									src="indexpicture/<%=allList.get(13).getGoods_category()%>/<%=allList.get(13).getGoods_code()%>_index.png">
							</div>
							<div class="categorycentercaption">
								<p>세상 달콤한 과자</p>
								<p>호빵같은 달콤함</p>
							</div> </a>
					</div>
				</div>
				<script type="text/javascript">
					$('.categorycenterpic').slick({
						dots : true,
						infinite : true,
						speed : 400,
						fade : true,
						cssEase : 'linear',
						autoplay : true

					});
				</script>
				<div class="slider">
					<div class="categoryright">
						<ul>
							<!-- 3개 상품씩 짝을 짓기 위해 -->
							<li><a
								href="product.detail?goods_code=<%=allList.get(0).getGoods_code()%>">
									<div class="picture">
										<img
											src="indexpicture/<%=allList.get(0).getGoods_category()%>/<%=allList.get(0).getGoods_code()%>.png">
									</div>
									<div class="name"><%=allList.get(0).getGoods_name()%></div>
							</a>
								<div class="price">
									<fmt:formatNumber value="<%=allList.get(0).getGoods_price()%>"
										pattern="#,###" />
									원
								</div></li>
							<li><a
								href="product.detail?goods_code=<%=allList.get(1).getGoods_code()%>">
									<div class="picture">
										<img
											src="indexpicture/<%=allList.get(1).getGoods_category()%>/<%=allList.get(1).getGoods_code()%>.png">
									</div>
									<div class="name"><%=allList.get(1).getGoods_name()%></div>
							</a>
								<div class="price">
									<fmt:formatNumber value="<%=allList.get(1).getGoods_price()%>"
										pattern="#,###" />
									원
								</div></li>
							<li><a
								href="product.detail?goods_code=<%=allList.get(2).getGoods_code()%>">
									<div class="picture">
										<img
											src="indexpicture/<%=allList.get(2).getGoods_category()%>/<%=allList.get(2).getGoods_code()%>.png">
									</div>
									<div class="name"><%=allList.get(2).getGoods_name()%></div>
							</a>
								<div class="price">
									<fmt:formatNumber value="<%=allList.get(2).getGoods_price()%>"
										pattern="#,###" />
									원
								</div></li>
						</ul>
						<ul>
							<!-- 3개 상품씩 짝을 짓기 위해 -->
							<li><a
								href="product.detail?goods_code=<%=allList.get(3).getGoods_code()%>">
									<div class="picture">
										<img
											src="indexpicture/<%=allList.get(3).getGoods_category()%>/<%=allList.get(3).getGoods_code()%>.png">
									</div>
									<div class="name"><%=allList.get(3).getGoods_name()%></div>
							</a>
								<div class="price">
									<fmt:formatNumber value="<%=allList.get(3).getGoods_price()%>"
										pattern="#,###" />
									원
								</div></li>
							<li><a
								href="product.detail?goods_code=<%=allList.get(4).getGoods_code()%>">
									<div class="picture">
										<img
											src="indexpicture/<%=allList.get(4).getGoods_category()%>/<%=allList.get(4).getGoods_code()%>.png">
									</div>
									<div class="name"><%=allList.get(4).getGoods_name()%></div>
							</a>
								<div class="price">
									<fmt:formatNumber value="<%=allList.get(4).getGoods_price()%>"
										pattern="#,###" />
									원
								</div></li>
							<li><a
								href="product.detail?goods_code=<%=allList.get(5).getGoods_code()%>">
									<div class="picture">
										<img
											src="indexpicture/<%=allList.get(5).getGoods_category()%>/<%=allList.get(5).getGoods_code()%>.png">
									</div>
									<div class="name"><%=allList.get(5).getGoods_name()%></div>
							</a>
								<div class="price">
									<fmt:formatNumber value="<%=allList.get(5).getGoods_price()%>"
										pattern="#,###" />
									원
								</div></li>
						</ul>
					</div>
					<div class="categoryright">
						<ul>
							<!-- 3개 상품씩 짝을 짓기 위해 -->
							<li><a
								href="product.detail?goods_code=<%=allList.get(6).getGoods_code()%>">
									<div class="picture">
										<img
											src="indexpicture/<%=allList.get(6).getGoods_category()%>/<%=allList.get(6).getGoods_code()%>.png">
									</div>
									<div class="name"><%=allList.get(6).getGoods_name()%></div>
							</a>
								<div class="price">
									<fmt:formatNumber value="<%=allList.get(6).getGoods_price()%>"
										pattern="#,###" />
									원
								</div></li>
							<li><a
								href="product.detail?goods_code=<%=allList.get(7).getGoods_code()%>">
									<div class="picture">
										<img
											src="indexpicture/<%=allList.get(7).getGoods_category()%>/<%=allList.get(7).getGoods_code()%>.png">
									</div>
									<div class="name"><%=allList.get(7).getGoods_name()%></div>
							</a>
								<div class="price">
									<fmt:formatNumber value="<%=allList.get(7).getGoods_price()%>"
										pattern="#,###" />
									원
								</div></li>
							<li><a
								href="product.detail?goods_code=<%=allList.get(8).getGoods_code()%>">
									<div class="picture">
										<img
											src="indexpicture/<%=allList.get(8).getGoods_category()%>/<%=allList.get(8).getGoods_code()%>.png">
									</div>
									<div class="name"><%=allList.get(8).getGoods_name()%></div>
							</a>
								<div class="price">
									<fmt:formatNumber value="<%=allList.get(8).getGoods_price()%>"
										pattern="#,###" />
									원
								</div></li>
						</ul>
						<ul>
							<!-- 3개 상품씩 짝을 짓기 위해 -->
							<li><a
								href="product.detail?goods_code=<%=allList.get(9).getGoods_code()%>">
									<div class="picture">
										<img
											src="indexpicture/<%=allList.get(9).getGoods_category()%>/<%=allList.get(9).getGoods_code()%>.png">
									</div>
									<div class="name"><%=allList.get(9).getGoods_name()%></div>
							</a>
								<div class="price">
									<fmt:formatNumber value="<%=allList.get(9).getGoods_price()%>"
										pattern="#,###" />
									원
								</div></li>
							<li><a
								href="product.detail?goods_code=<%=allList.get(10).getGoods_code()%>">
									<div class="picture">
										<img
											src="indexpicture/<%=allList.get(10).getGoods_category()%>/<%=allList.get(10).getGoods_code()%>.png">
									</div>
									<div class="name"><%=allList.get(10).getGoods_name()%></div>
							</a>
								<div class="price">
									<fmt:formatNumber
										value="<%=allList.get(10).getGoods_price()%>" pattern="#,###" />
									원
								</div></li>
							<li><a
								href="product.detail?goods_code=<%=allList.get(11).getGoods_code()%>">
									<div class="picture">
										<img
											src="indexpicture/<%=allList.get(11).getGoods_category()%>/<%=allList.get(11).getGoods_code()%>.png">
									</div>
									<div class="name"><%=allList.get(11).getGoods_name()%></div>
							</a>
								<div class="price">
									<fmt:formatNumber
										value="<%=allList.get(11).getGoods_price()%>" pattern="#,###" />
									원
								</div></li>
						</ul>
					</div>

				</div>
			</div>

			<script>
				$(document).ready(function() {
					$('.slider').bxSlider({
						auto : true,
						speed : 400,
					});
				});
			</script>
		</section>
		<section class="rankingTagsec">
			<div class="displayflex">
				<div class="categoryleftsec">
					<div class="categoryleft1sec">
						<a href="#a"><div class="categoryleft1titlesec">면류</div></a> <a
							href="#a"><div class="categoryleft1listsec">전체보기</div></a>
					</div>
					<div class="categoryleft2sec">
						<div class="categoryleft2titlesec">HOT키워드</div>
						<div class="categoryleft2keywordsec">
							<ul>
								<a href="#a"><li>#일본라면</li></a>
								<a href="#a"><li>#야키소바</li></a>
								<a href="#a"><li>#야식</li></a>
								<a href="#a"><li>#우동</li></a>
							</ul>
						</div>
					</div>
				</div>
				<%
					goods_category = 2;
					List<ProductDTO> allList1 = indexGoodsDAO.allGoodsSelect(goods_category);
				%>
				<div class="categorycentersec">
					<div class="categorycenterpicsec">
						<a
							href="prodcut.detail?goods_code=<%=allList1.get(4).getGoods_code()%>"><div>
								<img
									src="indexpicture/<%=allList1.get(4).getGoods_category()%>/<%=allList1.get(4).getGoods_code()%>_index.png">
							</div>
							<div class="categorycentercaptionsec">
								<p>일본에서 가장 유명한 라면</p>
								<p>NIPPONSIK에서 할인 중!</p>
							</div> </a> <a
							href="prodcut.detail?goods_code=<%=allList1.get(6).getGoods_code()%>"><div>
								<img
									src="indexpicture/<%=allList1.get(6).getGoods_category()%>/<%=allList1.get(6).getGoods_code()%>_index.png">
							</div>
							<div class="categorycentercaptionsec">
								<p>일본 정통 라면</p>
								<p>최고의 야식이</p>
							</div> </a>
					</div>
				</div>
				<script type="text/javascript">
					$('.categorycenterpicsec').slick({
						dots : true,
						infinite : true,
						speed : 400,
						fade : true,
						cssEase : 'linear',
						autoplay : true

					});
				</script>
				<div class="slidersec">
					<div class="categoryrightsec">
						<ul>
							<!-- 3개 상품씩 짝을 짓기 위해 -->
							<li><a
								href="product.detail?goods_code=<%=allList1.get(0).getGoods_code()%>">
									<div class="picture">
										<img
											src="indexpicture/<%=allList1.get(0).getGoods_category()%>/<%=allList1.get(0).getGoods_code()%>.png">
									</div>
									<div class="name"><%=allList1.get(0).getGoods_name()%></div>
							</a>
								<div class="price">
									<fmt:formatNumber
										value="<%=allList1.get(0).getGoods_price()%>" pattern="#,###" />
									원
								</div></li>
							<li><a
								href="product.detail?goods_code=<%=allList1.get(1).getGoods_code()%>">
									<div class="picture">
										<img
											src="indexpicture/<%=allList1.get(1).getGoods_category()%>/<%=allList1.get(1).getGoods_code()%>.png">
									</div>
									<div class="name"><%=allList1.get(1).getGoods_name()%></div>
							</a>
								<div class="price">
									<fmt:formatNumber
										value="<%=allList1.get(1).getGoods_price()%>" pattern="#,###" />
									원
								</div></li>
							<li><a
								href="product.detail?goods_code=<%=allList1.get(2).getGoods_code()%>">
									<div class="picture">
										<img
											src="indexpicture/<%=allList1.get(2).getGoods_category()%>/<%=allList1.get(2).getGoods_code()%>.png">
									</div>
									<div class="name"><%=allList1.get(2).getGoods_name()%></div>
							</a>
								<div class="price">
									<fmt:formatNumber
										value="<%=allList1.get(2).getGoods_price()%>" pattern="#,###" />
									원
								</div></li>
						</ul>
						<ul>
							<!-- 3개 상품씩 짝을 짓기 위해 -->
							<li><a
								href="product.detail?goods_code=<%=allList1.get(3).getGoods_code()%>">
									<div class="picture">
										<img
											src="indexpicture/<%=allList1.get(3).getGoods_category()%>/<%=allList1.get(3).getGoods_code()%>.png">
									</div>
									<div class="name"><%=allList1.get(3).getGoods_name()%></div>
							</a>
								<div class="price">
									<fmt:formatNumber
										value="<%=allList1.get(3).getGoods_price()%>" pattern="#,###" />
									원
								</div></li>
							<li><a
								href="product.detail?goods_code=<%=allList1.get(4).getGoods_code()%>">
									<div class="picture">
										<img
											src="indexpicture/<%=allList1.get(4).getGoods_category()%>/<%=allList1.get(4).getGoods_code()%>.png">
									</div>
									<div class="name"><%=allList1.get(4).getGoods_name()%></div>
							</a>
								<div class="price">
									<fmt:formatNumber
										value="<%=allList1.get(4).getGoods_price()%>" pattern="#,###" />
									원
								</div></li>
							<li><a
								href="product.detail?goods_code=<%=allList1.get(5).getGoods_code()%>">
									<div class="picture">
										<img
											src="indexpicture/<%=allList1.get(5).getGoods_category()%>/<%=allList1.get(5).getGoods_code()%>.png">
									</div>
									<div class="name"><%=allList1.get(5).getGoods_name()%></div>
							</a>
								<div class="price">
									<fmt:formatNumber
										value="<%=allList1.get(5).getGoods_price()%>" pattern="#,###" />
									원
								</div></li>
						</ul>
					</div>
					<div class="categoryrightsec">
						<ul>
							<!-- 3개 상품씩 짝을 짓기 위해 -->
							<li><a
								href="product.detail?goods_code=<%=allList1.get(6).getGoods_code()%>">
									<div class="picture">
										<img
											src="indexpicture/<%=allList1.get(6).getGoods_category()%>/<%=allList1.get(6).getGoods_code()%>.png">
									</div>
									<div class="name"><%=allList1.get(6).getGoods_name()%></div>
							</a>
								<div class="price">
									<fmt:formatNumber
										value="<%=allList1.get(6).getGoods_price()%>" pattern="#,###" />
									원
								</div></li>
							<li><a
								href="product.detail?goods_code=<%=allList1.get(7).getGoods_code()%>">
									<div class="picture">
										<img
											src="indexpicture/<%=allList1.get(7).getGoods_category()%>/<%=allList1.get(7).getGoods_code()%>.png">
									</div>
									<div class="name"><%=allList1.get(7).getGoods_name()%></div>
							</a>
								<div class="price">
									<fmt:formatNumber
										value="<%=allList1.get(7).getGoods_price()%>" pattern="#,###" />
									원
								</div></li>
							<li><a
								href="product.detail?goods_code=<%=allList1.get(8).getGoods_code()%>">
									<div class="picture">
										<img
											src="indexpicture/<%=allList1.get(8).getGoods_category()%>/<%=allList1.get(8).getGoods_code()%>.png">
									</div>
									<div class="name"><%=allList1.get(8).getGoods_name()%></div>
							</a>
								<div class="price">
									<fmt:formatNumber
										value="<%=allList1.get(8).getGoods_price()%>" pattern="#,###" />
									원
								</div></li>
						</ul>
						<ul>
							<!-- 3개 상품씩 짝을 짓기 위해 -->
							<li><a
								href="product.detail?goods_code=<%=allList1.get(9).getGoods_code()%>">
									<div class="picture">
										<img
											src="indexpicture/<%=allList1.get(9).getGoods_category()%>/<%=allList1.get(9).getGoods_code()%>.png">
									</div>
									<div class="name"><%=allList1.get(9).getGoods_name()%></div>
							</a>
								<div class="price">
									<fmt:formatNumber
										value="<%=allList1.get(9).getGoods_price()%>" pattern="#,###" />
									원
								</div></li>
							<li><a
								href="product.detail?goods_code=<%=allList1.get(10).getGoods_code()%>">
									<div class="picture">
										<img
											src="indexpicture/<%=allList1.get(10).getGoods_category()%>/<%=allList1.get(10).getGoods_code()%>.png">
									</div>
									<div class="name"><%=allList1.get(10).getGoods_name()%></div>
							</a>
								<div class="price">
									<fmt:formatNumber
										value="<%=allList1.get(10).getGoods_price()%>"
										pattern="#,###" />
									원
								</div></li>
							<li><a
								href="product.detail?goods_code=<%=allList1.get(11).getGoods_code()%>">
									<div class="picture">
										<img
											src="indexpicture/<%=allList1.get(11).getGoods_category()%>/<%=allList1.get(11).getGoods_code()%>.png">
									</div>
									<div class="name"><%=allList1.get(11).getGoods_name()%></div>
							</a>
								<div class="price">
									<fmt:formatNumber
										value="<%=allList1.get(11).getGoods_price()%>"
										pattern="#,###" />
									원
								</div></li>
						</ul>
					</div>
				</div>
			</div>

			<script>
				$(document).ready(function() {
					$('.slidersec').bxSlider({
						auto : true,
						speed : 400,
					});
				});
			</script>
		</section>
		<section class="rankingTagthi">
			<div class="displayflex">
				<div class="categoryleftthi">
					<div class="categoryleft1thi">
						<a href="#a"><div class="categoryleft1titlethi">조미료</div></a> <a
							href="#a"><div class="categoryleft1listthi">전체보기</div></a>
					</div>
					<div class="categoryleft2thi">
						<div class="categoryleft2titlethi">HOT키워드</div>
						<div class="categoryleft2keywordthi">
							<ul>
								<a href="#a"><li>#일본소스</li></a>
								<a href="#a"><li>#간장</li></a>
								<a href="#a"><li>#조미료</li></a>
								<a href="#a"><li>#반찬</li></a>
							</ul>
						</div>
					</div>
				</div>
				<%
					goods_category = 5;
					List<ProductDTO> allList2 = indexGoodsDAO.allGoodsSelect(goods_category);
				%>
				<div class="categorycenterthi">
					<div class="categorycenterpicthi">
						<a
							href="product.detail?goods_code=<%=allList2.get(9).getGoods_code()%>"><div>
								<img
									src="indexpicture/<%=allList2.get(9).getGoods_category()%>/<%=allList2.get(9).getGoods_code()%>_index.png">
							</div>
							<div class="categorycentercaptionthi">
								<p>일본 굴 간장</p>
								<p>맛이 좋다는 소문</p>
							</div> </a> <a
							href="product.detail?goods_code=<%=allList2.get(10).getGoods_code()%>"><div>
								<img
									src="indexpicture/<%=allList2.get(10).getGoods_category()%>/<%=allList2.get(10).getGoods_code()%>_index.png">
							</div>
							<div class="categorycentercaptionthi">
								<p>일본 다랑어 육수</p>
								<p>일본식의 맛을 내고 싶다면</p>
							</div> </a>
					</div>
				</div>
				<script type="text/javascript">
					$('.categorycenterpicthi').slick({
						dots : true,
						infinite : true,
						speed : 400,
						fade : true,
						cssEase : 'linear',
						autoplay : true

					});
				</script>
				<div class="sliderthi">
					<div class="categoryrightthi">
						<ul>
							<!-- 3개 상품씩 짝을 짓기 위해 -->
							<li><a
								href="product.detail?goods_code=<%=allList2.get(0).getGoods_code()%>">
									<div class="picture">
										<img
											src="indexpicture/<%=allList2.get(0).getGoods_category()%>/<%=allList2.get(0).getGoods_code()%>.png">
									</div>
									<div class="name"><%=allList2.get(0).getGoods_name()%></div>
							</a>
								<div class="price">
									<fmt:formatNumber
										value="<%=allList2.get(0).getGoods_price()%>" pattern="#,###" />
									원
								</div></li>
							<li><a
								href="product.detail?goods_code=<%=allList2.get(1).getGoods_code()%>">
									<div class="picture">
										<img
											src="indexpicture/<%=allList2.get(1).getGoods_category()%>/<%=allList2.get(1).getGoods_code()%>.png">
									</div>
									<div class="name"><%=allList2.get(1).getGoods_name()%></div>
							</a>
								<div class="price">
									<fmt:formatNumber
										value="<%=allList2.get(1).getGoods_price()%>" pattern="#,###" />
									원
								</div></li>
							<li><a
								href="product.detail?goods_code=<%=allList2.get(2).getGoods_code()%>">
									<div class="picture">
										<img
											src="indexpicture/<%=allList2.get(2).getGoods_category()%>/<%=allList2.get(2).getGoods_code()%>.png">
									</div>
									<div class="name"><%=allList2.get(2).getGoods_name()%></div>
							</a>
								<div class="price">
									<fmt:formatNumber
										value="<%=allList2.get(2).getGoods_price()%>" pattern="#,###" />
									원
								</div></li>
						</ul>
						<ul>
							<!-- 3개 상품씩 짝을 짓기 위해 -->
							<li><a
								href="product.detail?goods_code=<%=allList2.get(3).getGoods_code()%>">
									<div class="picture">
										<img
											src="indexpicture/<%=allList2.get(3).getGoods_category()%>/<%=allList2.get(3).getGoods_code()%>.png">
									</div>
									<div class="name"><%=allList2.get(3).getGoods_name()%></div>
							</a>
								<div class="price">
									<fmt:formatNumber
										value="<%=allList2.get(3).getGoods_price()%>" pattern="#,###" />
									원
								</div></li>
							<li><a
								href="product.detail?goods_code=<%=allList2.get(4).getGoods_code()%>">
									<div class="picture">
										<img
											src="indexpicture/<%=allList2.get(4).getGoods_category()%>/<%=allList2.get(4).getGoods_code()%>.png">
									</div>
									<div class="name"><%=allList2.get(4).getGoods_name()%></div>
							</a>
								<div class="price">
									<fmt:formatNumber
										value="<%=allList2.get(4).getGoods_price()%>" pattern="#,###" />
									원
								</div></li>
							<li><a
								href="product.detail?goods_code=<%=allList2.get(5).getGoods_code()%>">
									<div class="picture">
										<img
											src="indexpicture/<%=allList2.get(5).getGoods_category()%>/<%=allList2.get(5).getGoods_code()%>.png">
									</div>
									<div class="name"><%=allList2.get(5).getGoods_name()%></div>
							</a>
								<div class="price">
									<fmt:formatNumber
										value="<%=allList2.get(5).getGoods_price()%>" pattern="#,###" />
									원
								</div></li>
						</ul>
					</div>
					<div class="categoryrightthi">
						<ul>
							<!-- 3개 상품씩 짝을 짓기 위해 -->
							<li><a
								href="product.detail?goods_code=<%=allList2.get(6).getGoods_code()%>">
									<div class="picture">
										<img
											src="indexpicture/<%=allList2.get(6).getGoods_category()%>/<%=allList2.get(6).getGoods_code()%>.png">
									</div>
									<div class="name"><%=allList2.get(6).getGoods_name()%></div>
							</a>
								<div class="price">
									<fmt:formatNumber
										value="<%=allList2.get(6).getGoods_price()%>" pattern="#,###" />
									원
								</div></li>
							<li><a
								href="product.detail?goods_code=<%=allList2.get(7).getGoods_code()%>">
									<div class="picture">
										<img
											src="indexpicture/<%=allList2.get(7).getGoods_category()%>/<%=allList2.get(7).getGoods_code()%>.png">
									</div>
									<div class="name"><%=allList2.get(7).getGoods_name()%></div>
							</a>
								<div class="price">
									<fmt:formatNumber
										value="<%=allList2.get(7).getGoods_price()%>" pattern="#,###" />
									원
								</div></li>
							<li><a
								href="product.detail?goods_code=<%=allList2.get(8).getGoods_code()%>">
									<div class="picture">
										<img
											src="indexpicture/<%=allList2.get(8).getGoods_category()%>/<%=allList2.get(8).getGoods_code()%>.png">
									</div>
									<div class="name"><%=allList2.get(8).getGoods_name()%></div>
							</a>
								<div class="price">
									<fmt:formatNumber
										value="<%=allList2.get(8).getGoods_price()%>" pattern="#,###" />
									원
								</div></li>
						</ul>
						<ul>
							<!-- 3개 상품씩 짝을 짓기 위해 -->
							<li><a
								href="product.detail?goods_code=<%=allList2.get(9).getGoods_code()%>">
									<div class="picture">
										<img
											src="indexpicture/<%=allList2.get(9).getGoods_category()%>/<%=allList2.get(9).getGoods_code()%>.png">
									</div>
									<div class="name"><%=allList2.get(9).getGoods_name()%></div>
							</a>
								<div class="price">
									<fmt:formatNumber
										value="<%=allList2.get(9).getGoods_price()%>" pattern="#,###" />
									원
								</div></li>
							<li><a
								href="product.detail?goods_code=<%=allList2.get(10).getGoods_code()%>">
									<div class="picture">
										<img
											src="indexpicture/<%=allList2.get(10).getGoods_category()%>/<%=allList2.get(10).getGoods_code()%>.png">
									</div>
									<div class="name"><%=allList2.get(10).getGoods_name()%></div>
							</a>
								<div class="price">
									<fmt:formatNumber
										value="<%=allList2.get(10).getGoods_price()%>"
										pattern="#,###" />
									원
								</div></li>
						</ul>
					</div>
				</div>
			</div>

			<script>
				$(document).ready(function() {
					$('.sliderthi').bxSlider({
						auto : true,
						speed : 400,
					});
				});
			</script>
		</section>
		</section>
		<section class="rankingTagfor">
			<div class="displayflex">
				<div class="categoryleftfor">
					<div class="categoryleft1for">
						<a href="#a"><div class="categoryleft1titlefor">레토르트</div></a> <a
							href="#a"><div class="categoryleft1listfor">전체보기</div></a>
					</div>
					<div class="categoryleft2for">
						<div class="categoryleft2titlefor">HOT키워드</div>
						<div class="categoryleft2keywordfor">
							<ul>
								<a href="#a"><li>#레토르트 식품</li></a>
								<a href="#a"><li>#냉동식품</li></a>
								<a href="#a"><li>#나베요리</li></a>
								<a href="#a"><li>#간편식</li></a>
							</ul>
						</div>
					</div>
				</div>
				<%
					goods_category = 9;
					List<ProductDTO> allList3 = indexGoodsDAO.allGoodsSelect(goods_category);
				%>
				<div class="categorycenterfor">
					<div class="categorycenterpicfor">
						<a
							href="product.detail?goods_code=<%=allList3.get(3).getGoods_code()%>"><div>
								<img
									src="indexpicture/<%=allList3.get(3).getGoods_category()%>/<%=allList3.get(3).getGoods_code()%>_index.png">
							</div>
							<div class="categorycentercaptionfor">
								<p>요시노야 규동</p>
								<p>일본 유명 식당의 맛을 가정에서</p>
							</div> </a> <a
							href="product.detail?goods_code=<%=allList3.get(9).getGoods_code()%>"><div>
								<img
									src="indexpicture/<%=allList3.get(9).getGoods_category()%>/<%=allList3.get(9).getGoods_code()%>_index.png">
							</div>
							<div class="categorycentercaptionfor">
								<p>일본 가장 유명한 프렌차이즈</p>
								<p>마츠야의 소갈비 맛을 보자!</p>
							</div> </a>
					</div>
				</div>
				<script type="text/javascript">
					$('.categorycenterpicfor').slick({
						dots : true,
						infinite : true,
						speed : 400,
						fade : true,
						cssEase : 'linear',
						autoplay : true
					});
				</script>
				<div class="sliderfor">
					<div class="categoryrightfor">
						<ul>
							<!-- 3개 상품씩 짝을 짓기 위해 -->
							<li><a
								href="product.detail?goods_code=<%=allList3.get(0).getGoods_code()%>">
									<div class="picture">
										<img
											src="indexpicture/<%=allList3.get(0).getGoods_category()%>/<%=allList3.get(0).getGoods_code()%>.png">
									</div>
									<div class="name"><%=allList3.get(0).getGoods_name()%></div>
							</a>
								<div class="price">
									<fmt:formatNumber
										value="<%=allList3.get(0).getGoods_price()%>" pattern="#,###" />
									원
								</div></li>
							<li><a
								href="product.detail?goods_code=<%=allList3.get(1).getGoods_code()%>">
									<div class="picture">
										<img
											src="indexpicture/<%=allList3.get(1).getGoods_category()%>/<%=allList3.get(1).getGoods_code()%>.png">
									</div>
									<div class="name"><%=allList3.get(1).getGoods_name()%></div>
							</a>
								<div class="price">
									<fmt:formatNumber
										value="<%=allList3.get(1).getGoods_price()%>" pattern="#,###" />
									원
								</div></li>
							<li><a
								href="product.detail?goods_code=<%=allList3.get(2).getGoods_code()%>">
									<div class="picture">
										<img
											src="indexpicture/<%=allList3.get(2).getGoods_category()%>/<%=allList3.get(2).getGoods_code()%>.png">
									</div>
									<div class="name"><%=allList3.get(2).getGoods_name()%></div>
							</a>
								<div class="price">
									<fmt:formatNumber
										value="<%=allList3.get(2).getGoods_price()%>" pattern="#,###" />
									원
								</div></li>
						</ul>
						<ul>
							<!-- 3개 상품씩 짝을 짓기 위해 -->
							<li><a
								href="product.detail?goods_code=<%=allList3.get(3).getGoods_code()%>">
									<div class="picture">
										<img
											src="indexpicture/<%=allList3.get(3).getGoods_category()%>/<%=allList3.get(3).getGoods_code()%>.png">
									</div>
									<div class="name"><%=allList3.get(3).getGoods_name()%></div>
							</a>
								<div class="price">
									<fmt:formatNumber
										value="<%=allList3.get(3).getGoods_price()%>" pattern="#,###" />
									원
								</div></li>
							<li><a
								href="product.detail?goods_code=<%=allList3.get(4).getGoods_code()%>">
									<div class="picture">
										<img
											src="indexpicture/<%=allList3.get(4).getGoods_category()%>/<%=allList3.get(4).getGoods_code()%>.png">
									</div>
									<div class="name"><%=allList3.get(4).getGoods_name()%></div>
							</a>
								<div class="price">
									<fmt:formatNumber
										value="<%=allList3.get(4).getGoods_price()%>" pattern="#,###" />
									원
								</div></li>
							<li><a
								href="product.detail?goods_code=<%=allList3.get(5).getGoods_code()%>">
									<div class="picture">
										<img
											src="indexpicture/<%=allList3.get(5).getGoods_category()%>/<%=allList3.get(5).getGoods_code()%>.png">
									</div>
									<div class="name"><%=allList3.get(5).getGoods_name()%></div>
							</a>
								<div class="price">
									<fmt:formatNumber
										value="<%=allList3.get(5).getGoods_price()%>" pattern="#,###" />
									원
								</div></li>
						</ul>
					</div>
					<div class="categoryrightfor">
						<ul>
							<!-- 3개 상품씩 짝을 짓기 위해 -->
							<li><a
								href="product.detail?goods_code=<%=allList3.get(6).getGoods_code()%>">
									<div class="picture">
										<img
											src="indexpicture/<%=allList3.get(6).getGoods_category()%>/<%=allList3.get(6).getGoods_code()%>.png">
									</div>
									<div class="name"><%=allList3.get(6).getGoods_name()%></div>
							</a>
								<div class="price">
									<fmt:formatNumber
										value="<%=allList3.get(6).getGoods_price()%>" pattern="#,###" />
									원
								</div></li>
							<li><a
								href="product.detail?goods_code=<%=allList3.get(7).getGoods_code()%>">
									<div class="picture">
										<img
											src="indexpicture/<%=allList3.get(7).getGoods_category()%>/<%=allList3.get(7).getGoods_code()%>.png">
									</div>
									<div class="name"><%=allList3.get(7).getGoods_name()%></div>
							</a>
								<div class="price">
									<fmt:formatNumber
										value="<%=allList3.get(7).getGoods_price()%>" pattern="#,###" />
									원
								</div></li>
							<li><a
								href="product.detail?goods_code=<%=allList3.get(8).getGoods_code()%>">
									<div class="picture">
										<img
											src="indexpicture/<%=allList3.get(8).getGoods_category()%>/<%=allList3.get(8).getGoods_code()%>.png">
									</div>
									<div class="name"><%=allList3.get(8).getGoods_name()%></div>
							</a>
								<div class="price">
									<fmt:formatNumber
										value="<%=allList3.get(8).getGoods_price()%>" pattern="#,###" />
									원
								</div></li>
						</ul>
						<ul>
							<!-- 3개 상품씩 짝을 짓기 위해 -->
							<li><a
								href="product.detail?goods_code=<%=allList3.get(9).getGoods_code()%>">
									<div class="picture">
										<img
											src="indexpicture/<%=allList3.get(9).getGoods_category()%>/<%=allList3.get(9).getGoods_code()%>.png">
									</div>
									<div class="name"><%=allList3.get(9).getGoods_name()%></div>
							</a>
								<div class="price">
									<fmt:formatNumber
										value="<%=allList3.get(9).getGoods_price()%>" pattern="#,###" />
									원
								</div></li>
							<li><a
								href="product.detail?goods_code=<%=allList3.get(10).getGoods_code()%>">
									<div class="picture">
										<img
											src="indexpicture/<%=allList3.get(10).getGoods_category()%>/<%=allList3.get(10).getGoods_code()%>.png">
									</div>
									<div class="name"><%=allList3.get(10).getGoods_name()%></div>
							</a>
								<div class="price">
									<fmt:formatNumber
										value="<%=allList3.get(10).getGoods_price()%>"
										pattern="#,###" />
									원
								</div></li>
							<li><a
								href="product.detail?goods_code=<%=allList3.get(11).getGoods_code()%>">
									<div class="picture">
										<img
											src="indexpicture/<%=allList3.get(11).getGoods_category()%>/<%=allList3.get(11).getGoods_code()%>.png">
									</div>
									<div class="name"><%=allList3.get(11).getGoods_name()%></div>
							</a>
								<div class="price">
									<fmt:formatNumber
										value="<%=allList3.get(11).getGoods_price()%>"
										pattern="#,###" />
									원
								</div></li>
						</ul>
					</div>
				</div>
			</div>

			<script>
				$(document).ready(function() {
					$('.sliderfor').bxSlider({
						auto : true,
						speed : 400,
					});
				});
			</script>
		</section>
		<section class="rankingTagfif">
			<div class="displayflex">
				<div class="categoryleftfif">
					<div class="categoryleft1fif">
						<a href="#a"><div class="categoryleft1titlefif">술</div></a> <a
							href="#a"><div class="categoryleft1listfif">전체보기</div></a>
					</div>
					<div class="categoryleft2fif">
						<div class="categoryleft2titlefif">HOT키워드</div>
						<div class="categoryleft2keywordfif">
							<ul>
								<a href="#a"><li>#일본술</li></a>
								<a href="#a"><li>#고구마소주</li></a>
								<a href="#a"><li>#전통주</li></a>
								<a href="#a"><li>#매실주</li></a>
							</ul>
						</div>
					</div>
				</div>
				<%
					goods_category = 6;
					List<ProductDTO> allList4 = indexGoodsDAO.allGoodsSelect(goods_category);
				%>
				<div class="categorycenterfif">
					<div class="categorycenterpicfif">
						<a
							href="prodcut.detail?goods_code=<%=allList4.get(1).getGoods_code()%>"><div>
								<img
									src="indexpicture/<%=allList4.get(1).getGoods_category()%>/<%=allList4.get(1).getGoods_code()%>_index.png">
							</div>
							<div class="categorycentercaptionfif">
								<p>선물로 가장 좋은</p>
								<p>술을 선물하고 싶다면</p>
							</div> </a> <a
							href="prodcut.detail?goods_code=<%=allList4.get(4).getGoods_code()%>"><div>
								<img
									src="indexpicture/<%=allList4.get(4).getGoods_category()%>/<%=allList4.get(4).getGoods_code()%>_index.png">
							</div>
							<div class="categorycentercaptionfif">
								<p>일본의 정통 소주</p>
								<p>니혼슈 최고 등급</p>
							</div> </a>
					</div>
				</div>
				<script type="text/javascript">
					$('.categorycenterpicfif').slick({
						dots : true,
						infinite : true,
						speed : 400,
						fade : true,
						cssEase : 'linear',
						autoplay : true

					});
				</script>
				<div class="sliderfif">
					<div class="categoryrightfif">
						<ul>
							<li><a
								href="product.detail?goods_code=<%=allList4.get(0).getGoods_code()%>">
									<div class="picture">
										<img
											src="indexpicture/<%=allList4.get(0).getGoods_category()%>/<%=allList4.get(0).getGoods_code()%>.png">
									</div>
									<div class="name"><%=allList4.get(0).getGoods_name()%></div>
							</a>
								<div class="price">
									<fmt:formatNumber
										value="<%=allList4.get(0).getGoods_price()%>" pattern="#,###" />
									원
								</div></li>
							<li><a
								href="product.detail?goods_code=<%=allList4.get(1).getGoods_code()%>">
									<div class="picture">
										<img
											src="indexpicture/<%=allList4.get(1).getGoods_category()%>/<%=allList4.get(1).getGoods_code()%>.png">
									</div>
									<div class="name"><%=allList4.get(1).getGoods_name()%></div>
							</a>
								<div class="price">
									<fmt:formatNumber
										value="<%=allList4.get(1).getGoods_price()%>" pattern="#,###" />
									원
								</div></li>
							<li><a
								href="product.detail?goods_code=<%=allList4.get(2).getGoods_code()%>">
									<div class="picture">
										<img
											src="indexpicture/<%=allList4.get(2).getGoods_category()%>/<%=allList4.get(2).getGoods_code()%>.png">
									</div>
									<div class="name"><%=allList4.get(2).getGoods_name()%></div>
							</a>
								<div class="price">
									<fmt:formatNumber
										value="<%=allList4.get(2).getGoods_price()%>" pattern="#,###" />
									원
								</div></li>
						</ul>
						<ul>
							<!-- 3개 상품씩 짝을 짓기 위해 -->
							<li><a
								href="product.detail?goods_code=<%=allList4.get(3).getGoods_code()%>">
									<div class="picture">
										<img
											src="indexpicture/<%=allList4.get(3).getGoods_category()%>/<%=allList4.get(3).getGoods_code()%>.png">
									</div>
									<div class="name"><%=allList4.get(3).getGoods_name()%></div>
							</a>
								<div class="price">
									<fmt:formatNumber
										value="<%=allList4.get(3).getGoods_price()%>" pattern="#,###" />
									원
								</div></li>
							<li><a
								href="product.detail?goods_code=<%=allList4.get(4).getGoods_code()%>">
									<div class="picture">
										<img
											src="indexpicture/<%=allList4.get(4).getGoods_category()%>/<%=allList4.get(4).getGoods_code()%>.png">
									</div>
									<div class="name"><%=allList4.get(4).getGoods_name()%></div>
							</a>
								<div class="price">
									<fmt:formatNumber
										value="<%=allList4.get(4).getGoods_price()%>" pattern="#,###" />
									원
								</div></li>
							<li><a
								href="product.detail?goods_code=<%=allList4.get(5).getGoods_code()%>">
									<div class="picture">
										<img
											src="indexpicture/<%=allList4.get(5).getGoods_category() %>/<%=allList4.get(5).getGoods_code() %>.png">
									</div>
									<div class="name"><%=allList4.get(5).getGoods_name() %></div>
							</a>
								<div class="price">
									<fmt:formatNumber
										value="<%=allList4.get(5).getGoods_price() %>" pattern="#,###" />
									원
								</div></li>
						</ul>
					</div>
					<div class="categoryrightfif">
						<ul>
							<!-- 3개 상품씩 짝을 짓기 위해 -->
							<li><a
								href="product.detail?goods_code=<%=allList4.get(6).getGoods_code()%>">
									<div class="picture">
										<img
											src="indexpicture/<%=allList4.get(6).getGoods_category() %>/<%=allList4.get(6).getGoods_code() %>.png">
									</div>
									<div class="name"><%=allList4.get(6).getGoods_name() %></div>
							</a>
								<div class="price">
									<fmt:formatNumber
										value="<%=allList4.get(6).getGoods_price() %>" pattern="#,###" />
									원
								</div></li>
							<li><a
								href="product.detail?goods_code=<%=allList4.get(7).getGoods_code()%>">
									<div class="picture">
										<img
											src="indexpicture/<%=allList4.get(7).getGoods_category() %>/<%=allList4.get(7).getGoods_code() %>.png">
									</div>
									<div class="name"><%=allList4.get(7).getGoods_name() %></div>
							</a>
								<div class="price">
									<fmt:formatNumber
										value="<%=allList4.get(7).getGoods_price() %>" pattern="#,###" />
									원
								</div></li>
							<li><a
								href="product.detail?goods_code=<%=allList4.get(8).getGoods_code()%>">
									<div class="picture">
										<img
											src="indexpicture/<%=allList4.get(8).getGoods_category() %>/<%=allList4.get(8).getGoods_code() %>.png">
									</div>
									<div class="name"><%=allList4.get(8).getGoods_name() %></div>
							</a>
								<div class="price">
									<fmt:formatNumber
										value="<%=allList4.get(8).getGoods_price() %>" pattern="#,###" />
									원
								</div></li>
						</ul>
						<ul>
							<!-- 3개 상품씩 짝을 짓기 위해 -->
							<li><a
								href="product.detail?goods_code=<%=allList4.get(9).getGoods_code()%>">
									<div class="picture">
										<img
											src="indexpicture/<%=allList4.get(9).getGoods_category() %>/<%=allList4.get(9).getGoods_code() %>.png">
									</div>
									<div class="name"><%=allList4.get(9).getGoods_name() %></div>
							</a>
								<div class="price">
									<fmt:formatNumber
										value="<%=allList4.get(9).getGoods_price() %>" pattern="#,###" />
									원
								</div></li>
							<li><a
								href="product.detail?goods_code=<%=allList4.get(10).getGoods_code()%>">
									<div class="picture">
										<img
											src="indexpicture/<%=allList4.get(10).getGoods_category() %>/<%=allList4.get(10).getGoods_code() %>.png">
									</div>
									<div class="name"><%=allList4.get(10).getGoods_name() %></div>
							</a>
								<div class="price">
									<fmt:formatNumber
										value="<%=allList4.get(10).getGoods_price() %>"
										pattern="#,###" />
									원
								</div></li>
							<li><a
								href="product.detail?goods_code=<%=allList4.get(11).getGoods_code()%>">
									<div class="picture">
										<img
											src="indexpicture/<%=allList4.get(11).getGoods_category() %>/<%=allList4.get(11).getGoods_code() %>.png">
									</div>
									<div class="name"><%=allList4.get(11).getGoods_name() %></div>
							</a>
								<div class="price">
									<fmt:formatNumber
										value="<%=allList4.get(11).getGoods_price() %>"
										pattern="#,###" />
									원
								</div></li>
						</ul>
					</div>
				</div>
			</div>

			<script>
    $(document).ready(function(){
      $('.sliderfif').bxSlider({
      	auto: true,
      	speed: 400,
      });
    });
  </script>
		</section>
		<div class="tackbae">배송 관련 정보</div>
		
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
	</div>
	</div>

</body>
</html>