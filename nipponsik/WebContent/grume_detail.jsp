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
<link rel="stylesheet" type="text/css" href="grume_detail.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="myhome.js"></script>
<link rel="stylesheet"
	href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCq3BPqOpmr2_PtXT-uLQqgaDJ97s3qf9c&callback=initMap&v=weekly"
      async
    ></script>
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
	<!-- 구루메 디테일 페이지 -->
	<section class="grume-detail-box">
		<div class="grume-detail-inner-box">
			<!-- 상단 컨텐츠 부분 -->
			<div class="grume-detail-inner-frame">
				<table>
					<tr>
						<td>
							<div class="grume-detail-title-box">
								<h1>흑초 닭고기</h1>
								<div class="grume-detail-japanese">鳥と野菜の黒酢あん/토리토 야사이노 쿠로즈안</div>
							</div>
						</td>
						<td class="grume-detail-inner-frame-col">
							<div class="grume-detail-share-box">
								<div></div>
								<a href="#">
									<img alt="" src="logo/facebook1.png" width="24" height="24">
								</a>
								<a href="#">
									<img alt="" src="logo/twitter1.png" width="24" height="24">
								</a>
								<a href="#">
									<img alt="" src="logo/insta1.png" width="24" height="24">
								</a>
							</div>
						</td>
					</tr>
					<tr class="grume-table-col">
						<td colspan="2">
							<div class="grume-detail-info-box">
								<span class="detail-info-design">장소</span>
								<a href="#">도쿄</a>
								<span>></span>
								<a href="#">오오토야</a>
								<span class="detail-info-design">주 재료</span>
								<a href="#">닭고기</a>
								<span>,</span>
								<a href="#">흑초</a>
								<span>등</span>
							</div>
						</td>
					</tr>
				</table>
				<div class="grume-detail-navi">
					<ul>
						<li class="tab-on" id="tab1">기본정보</li>
						<li id="tab2">지도</li>
						<li id="tab3">사진</li>
					</ul>
				</div>
				<script type="text/javascript">
				$(function(){
					$(".grume-detail-navi > ul > li").on("click",function(){
						if($(".grume-detail-navi > ul > li").hasClass("tab-on")){
							$(".grume-detail-navi > ul > li").removeClass("tab-on");
						}
						$(this).toggleClass("tab-on");
					});
				});

				</script>
				<div class="grume-detail-box-content">
					<table>
						<tr>
							<td class="grume-detail-content-first-col">
								<table>
									<tr>
										<td>
											<img alt="" src="grumepicture/kurozuan.jpg" width="390" height="290">
											<div class="grume-detail-img-info">닭고기를 흑초에 넣은 요리이다</div>
										</td>
									</tr>
								</table>
							</td>
							<td class="grume-detail-content-col">
								<table>
									<tr>
										<td>
											<div class="grume-detail-content-title">흑초 닭고기</div>
											<div class="grume-detail-content-content">닭고기 쿠로'와 친근감을 담아 고객들에게 평가를 받고 있는 인기 메뉴입니다.닭을 돼지 고기나 흰살 생선으로 바꿔도 즐기실 수 있습니다.</div>
										</td>
									</tr>
									<tr>
										<td class="grume-detail-content-second-col">
											<ul>
												<li>
													<img alt="" src="grumepicture/kurozuan.jpg" width="80" height="60">
												</li>
											</ul>
											<div class="grume-detail-img-more-see">
												<a href="#a">
													사진 더보기
													<i class="xi-angle-right-min"></i>
												</a>
											</div>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<!-- 중간 컨텐츠 부분 -->
			<div class="grume-basic-info-box">
				<div class="grume-menu-box">
					<div class="grume-menu-title">
						<i class="xi-check-circle"></i>
						주 메뉴
					</div>
					<table class="grume-menu-table">
						<tr class="grume-menu-table-col fontWeight" >
							<td width="400">메뉴명</td>
							<td width="400">일본어명</td>
							<td>가격</td>
						</tr>
						<tr class="grume-menu-table-col">
							<td>흑초 닭고기(단품)</td>
							<td>鳥と野菜の黒酢あん</td>
							<td>1,300엔</td>
						</tr>
					</table>
				</div>
				<div class="grume-foods-character">
					<div class="grume-foods-title">만드는 법</div>
					<div class="grume-foods-small-title">집에서 만들어 먹는 법</div>
					<table>
						<tr>
							<td class="grume-foods-character-col vertitop">
								<div class="grume-foods-content">
									<ol>
										<li>닭다리살은 한입에 8조각으로 썰어 볼에 담고 A모양을 넣어 10분 정도 둔다.흑초 양념장을 섞어 놓는다.</li>
										<li>감자는 껍질을 벗겨 4등분으로, 연근은 7~8mm 두께의 둥글게 썰어서 살짝 물에 담가, 물기를 닦는다.</li>
										<li>당근은 3~4cm의 난도로 썬다.가지는 껍질을 필러로 줄무늬를 향해 세로 반으로 자른 후 마구 썬다.</li>
										<li>5분 정도 물에 쐬어 물기를 닦다.양파, 피망은 2센티미터 정도로 어슷썬다.</li>
										<li>팬에 튀김기름을 2cm 정도 붓고 감자, 당근을 넣어 중불에 올려놓는다.</li>
										<li>3분 정도 튀겼다가 거품이 생기면 위아래를 돌려주고 붙지 않게 가끔 돌려준다.</li>
										<li>당근은 4분, 감자는 67분, 대나무 꼬챙이가 살짝 지나갈 때까지 튀겨 기름을 뺀다.</li>
										<li>기름 온도를 180도로 하고 연근, 가지는 1분, 양파는 30초, 피망은 살짝 튀겨 기름을 뺀다.</li>
										<li>기름 온도를 170도로 하고 ①의 닭고기에 녹말가루를 살짝 묻혀 넣는다.가끔 뒤집으면서 4분, 센 불로 올려 1분 정도 튀겨 기름을 뺀다.</li>
										<li>프라이팬을 중불로 달구어 ③의 감자, 당근, ④의 연근, 가지, 양파, 피망, 닭고기를 넣고 검은 식초 양념장을 넣는다.</li>
										<li>재빠르게 혼합하여 그릇에 보기 좋게 담는다.</li>
									</ol>
								</div>
							</td>
							<td class="grume-foods-character-col" width="360">
								<img alt="" src="grumepicture/kurozuan2.jpg">
								<div class="grume-detail-img-info">완성된 요리 모습</div>
							</td>
						</tr>
					</table>
				</div>
				<div class="grume-foods-character">
					<div class="grume-foods-title">만드는 요령</div>
					<div class="grume-foods-small-title">레시피 작은 팁</div>
					<table>
						<tr>
							<td class="grume-foods-character-col" width="200">
								<img alt="" src="grumepicture/kurozuan3.png" class="img-change">
								<div class="grume-detail-img-info">판매중인 소스를 넣기만 하면 완성된다.</div>
							</td>
							<td class="grume-foods-character-col vertitop">
								<div class="grume-foods-content pad-left">
									튀긴 닭고기와 야채와 관련된 비법 특제 흑초 소스가 포인트입니다.가게의 흑초 소스는 여러 종류의 식초를 사용하여 소스를 만들고 있습니다만, 집에서는 시판되는 흑초에 사과 식초를 추가하여 재현해 봅시다.
									<div class="inner-content-box">
										<div class="inner-content-title">이 요리법의 성장 과정</div>
										<div class="inner-content">오토야 부동의 인기 No.1 메뉴.최초로 흑초를 사용한 상품이 등장한 것은 2003년. 지금은 흑초를 상비하고 있는 가정도 증가했습니다만, 재빨리 그 건강 효과에 주목해 메뉴에 도입했습니다.</div>
									</div>
								</div>
							</td>
						</tr>
					</table>
				</div>
				<div class="grume-foods-character" id="map-box">
					<div class="grume-foods-title">찾아가는 길</div>
					<div class="grume-foods-small-title">여기로 가주세요.</div>
					<div id="map"></div>
				</div>
			</div>
		</div>
	</section>
	<script type="text/javascript">
	function initMap() {
		
		  var ootoya = [
			  ['오오토야 신주쿠역 서쪽출구점',35.693809295684126,139.69885090026565],
			  ['오오토야 중앙도오리점',35.69123935684838,139.7029781124394],
			  ['오오토야 요요기역앞점',35.68352979212694,139.7016021364706],
			  ['오오토야 신주쿠센터빌점',35.692580175704244,139.6957210538218],
			  ['오오토야 아이랜드타워점',35.6937253638838,139.69324459085576]
		  ]
		  var map = new google.maps.Map(document.getElementById("map"), {
		    zoom: 15,
		    center: {lat:35.69123935684838,lng:139.7029781124394},
		  });
		  
		  var marker, i;  //다음에 사용하기 위해 상위로 빼냄
		  for( i =0; i < ootoya.length; i++){
		    marker = new google.maps.Marker({
		    position : new google.maps.LatLng(ootoya[i][1], ootoya[i][2]),  //마커 위치
		    map : map,  //어디에 찍을 건지
		    title : "주소",
		  });
		    
		    var infowindow = new google.maps.InfoWindow();  //나중에 입력을 위해 미리 객체 생성해둠
			var content = "<h1 id='mapContent'>"+ootoya[i][0]+"</h1>"
		    google.maps.event.addListener(marker,"click",(function(map,marker,content){
			    return function(){
			    	infowindow.setContent(content)
			    	infowindow.open(map,marker);
			    }
		    })(map,marker,content));
		}
	}
	
	var windowScroll = $(document).scrollTop();
	var tab1Scroll = $(".grume-detail-inner-frame").offset();
	var tab2Scroll = $("#map-box").offset();
	var tabScroll = $(".grume-detail-navi").offset();
	console.log(tabScroll.top);
	
	$("#tab1").on("click",function(){
		$("html").animate({scrollTop:tab1Scroll.top},400);  //html로 잡아야 기능이 돌아감
	});
	
	$("#tab2").on("click",function(){
		$("html").animate({scrollTop:tab2Scroll.top},400);  //html로 잡아야 기능이 돌아감
	});
	
	$(window).on("scroll",function(){
		var windowScroll = $(document).scrollTop();
		var tabScroll = $(".grume-detail-navi ul").offset();
		
		if(windowScroll > tab1Scroll.top){
			$("#tab1").addClass("tab-on");
			$("#tab2").removeClass("tab-on");
			$("#tab3").removeClass("tab-on");
		}
		if(windowScroll > tab2Scroll.top){
			$("#tab2").addClass("tab-on");
			$("#tab1").removeClass("tab-on");
			$("#tab3").removeClass("tab-on");
		}
		
		if(windowScroll > 302){  // 처음엔 무조건 숫자를 잡아줘야 깜빡임이 없어짐
			$(".grume-detail-navi ul").css({
				"position":"fixed",
				"top":"0",
				"z-index":"100",
				"width":"1078px"
			});
		} else {
			$(".grume-detail-navi ul").css({
				"position":"absolute",
				"width":"100%",
				"top":""
				
			});
		}
		
	});
	</script>

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