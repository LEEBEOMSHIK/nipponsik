<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="userDTO.UserDTO" %>
<%@ page import="userDAO.UserDAO" %>
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
	<title>회원가입</title>
	<meta charset="utf-8">
	<link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
	<link rel="stylesheet" type="text/css" href="gaip.css">
	<script type="text/javascript" src="gaipsujung.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<script type="text/javascript">
	function chkform(){
        var id = document.querySelector("#id").value;
        var pw = document.querySelector("#pw").value;
        var pw1 = document.querySelector("#pwck").value;
        var name = document.querySelector("#name").value;
        var nick = document.querySelector("#nick").value;
        var phno = document.querySelector("#phno").value;
        var email1 = document.querySelector("#email1").value;
        var email2 = document.querySelector("#emailinput2").value;
        var adress1 = document.querySelector("#sample4_postcode").value;
        var adress2 = document.querySelector("#sample4_roadAddress").value;
        var adress3 = document.querySelector("#sample4_jibunAddress").value;
        var adress4 = document.querySelector("#sample4_detailAddress").value;
        var adress5 = document.querySelector("#sample4_extraAddress").value;
        var susin = document.querySelectorAll(".susin");
		var birth = document.querySelector("#birth").value;
		var male = document.querySelector("#gender1").value;
		var female = document.querySelector("#gender2").value;
		var birthck = myform.birth.value;
		var agree = document.querySelectorAll(".agree");

		//var pwCheck = ^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-](?=.*[0-9].{8,25}$;
        //var numControl = /^[0-9]+/g;  //나중에 완성 전 한꺼번에 입력할 예정

		if(id == "" || id.length < 8){
			alert("숫자 포함한 영문자 8자 이상으로 아이디를 만들어주세요");
			$("#id").focus();
			return false; // 그 후에 진행을 하지마라!
	    }
	    else if (pw == "" || pw.length < 8) {
			alert("숫자 포함한 영문자 8자 이상으로 비밀번호를 만들어주세요");
			$("#pw").focus();
			return false;
		}
		else if (id == pw) {
			alert("ID와 패스워드가 같습니다");
			return false;
		}
		else if (pw != pw1) {
			alert("비밀번호가 맞지 않습니다!");
			return false;
		}
		else if(name == ""){
			alert("이름을 입력하세요");
			$("#name").focus();
			return false;
		}
		else if(nick == ""){
			alert("닉이름을 입력하세요");
			$("#nick").focus();
			return false;
		}
		else if(birthck == ""){ 
			alert("생년월일을 입력하세요");
			$("#birth").focus();
			return false;
		}
		else if(phno == ""){
			alert("전화번호를 입력해주세요");
			$("#phno").focus();
			return false;
		}
		else if(email1 == "" || email2 == ""){
			alert("이메일을 입력해주세요");
			$("#email1").focus();
			$("emaildetail").css({"display":"block"});
			return false;
		}
		else if(adress1 == "" || adress2 == "" || adress3 == ""){
            alert("주소를 정확히 입력해주세요");
            $("#sample4_postcode").focus();
            return false;
		}
		else if(susin[0].checked != true && susin[1].checked != true){
            alert("정보 수신 방법을 체크해주세요");
            $("#susin").focus();
            return false;
		}
		else if(agree[0].checked != true || agree[1].checked != true || agree[2].checked != true || agree[3].checked != true){
            alert("이용약관을 정확히 체크해주세요");
            $("allagree").focus();
            return false;
		} else{
			$("#gaipbtn1").attr("readonly",false);
		}
		
		//else if(!agree1.checked || !agree2.checked || //이렇게 사용을 했을 때 적용이 되지 않음!agree3.checked || !agree4.checked ||)
            //alert("이용약관을 체크해주세요");
            //agree1.focus();
            //return false;
	}
	function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }

</script>

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
	<div class="gaiptop">
	<p class="main">기본정보</p>
	<hr class="line1">
	<hr class="line2">
</div>
	<form name="myform" action="gaipinfoprocess.jsp" method="post" onsubmit="return chkform();">
            <div class="gaipsection">
            	<div class="gaipmiddle">
            	<div class="idbox" id="idbox"> <!--------------아이디 ------------>
			<div class="inputbox" id="idinput"><input type="text" name="id" size="25" maxlength="15" class="textbox" id="id">
				<div class="changedetailid">아이디 입력</div>
			</div>
			<div><input id="id2" type="button" name="id2" value="중복 확인"></div></div>
			<div class="iddetail"></div>
			
			<div class="pwbox"> <!---------------비밀번호 ------------>
				<div class="inputbox" id="pwinput">
					<input type="password" name="pw" size="25" maxlength="15" class="textbox" id="pw">
					<div class="changedetailpw">비밀번호 입력</div></div>
			</div>
			<div class="pwdetail"></div>

            <div class="pwbox1"> <!---------------비밀번호 확인 ------------>
			<div class="inputbox" id="pwinput2"><input type="password" name="pw1" size="25" maxlength="15" class="textbox" id="pwck">
				<div class="changedetailpw2">비밀번호 확인</div>
			</div></div>
			<div class="pwdetail2"></div>

			<div class="namebox"> <!---------------이름 ------------>
			<div class="inputbox" id="nameinput"><input type="text" name="name" size="25" maxlength="15" class="textbox" id="name">
				<div class="changedetailname">이름 입력</div>
			</div></div>

			<div class="nickbox"> <!---------------닉네임 ------------>
			<div class="inputbox" id="nickinput"><input type="text" name="nick" size="25" maxlength="15" class="textbox" id="nick">
				<div class="changedetailnick">닉네임 입력</div>
			</div></div>

			<div class="birthbox"> <!---------------생년월일 ------------>
			<div class="inputbox" id="birthinput"><input type="month" name="birth" id="birth">
				<div class="changedetailbirth">생년월일 선택</div>
			</div></div>

			<div class="gendertitle">성별 선택</div><!---------성별 ------->
				<div class="genderbox"> 
					<input class="gender_input" type="radio" name="gender" checked="on" value="남자" id="gender1">
					<label class="gender_label" for="gender1">남자</label>
    	      <input class="gender_input" type="radio" name="gender" value="여자" id="gender2">
    	      <label class="gender_label" for="gender2">여자</label>
    	  </div>

    	  <div class="phbox"> <!---------------전화번호 ---------------->
			<div class="inputbox" id="phinput"><input type="text" name="phno" class="textbox" id="phno">
				<div class="changedetailph">전화번호 입력</div>
			</div></div>
			<div class="phdetail">'-'을 제외하고 입력해주세요 ex) 01012345678</div>

			<div class="emailbox"> <!---------------이메일 ---------------->
			<div class="emailinputbox" id="emailinput"><input type="text" name="email1" class="textbox" id="email1">
				<div class="changeemaildetail">이메일 입력</div>
			</div>
			<div id="golbang">@</div>
			<select name="email2" class="textbox" id="emailinput2">
				<option>메일주소선택</option>
				<option>naver.com</option>
				<option>gmail.com</option>
				<option>hanmail.net</option>
				<option>yahoo.co.kr</option>
				<option>직접입력</option>
			</select>
		</div>
			<div class="emaildetail">이메일이 제대로 입력되지 않았습니다.</div>
            
            <div class="adrtul"> <!---------------주소---------------->
			<div class="adrtitle">주소 찾기</div>
			<div class="adrbox">
			<input class="textbox" name="adress1" type="text" id="sample4_postcode" placeholder="우편번호">
            <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
            <input class="textbox" name="adress2" type="text" id="sample4_roadAddress" placeholder="도로명주소">
            <input class="textbox" name="adress3" type="text" id="sample4_jibunAddress" placeholder="지번주소">
            <span id="guide" style="color:#999;display:none"></span>
            <input class="textbox" name="adress4" type="text" id="sample4_detailAddress" placeholder="상세주소">
            <input class="textbox" name="adress5" type="text" id="sample4_extraAddress" placeholder="참고항목">
           </div></div>

            <div class="susintitle">정보수신 방법</div> <!---------------정보수신 방법---------------->
            <div class="susinbox">
            	<div class="chboxtul">
				<input type="checkbox" name="susin1" class="susin" value="Email" id="susin" class="chkgongtong">
				<label for="susin">Email</label>
				<img src="indexpicture/checkmark.png" style="position: relative; width: 19px; left: -59px;" class="checkmark1">
			   </div>
				<div class="chboxtul">
				<input type="checkbox" name="susin2" class="susin" value="SMS" id="susin2">
				<label for="susin2">SMS</label>
				<img src="indexpicture/checkmark.png" style="position: absolute; width: 19px;" class="checkmark2">
			   </div>
			</div>
    <div class="yakuanbox"> <!---------------서비스 동의 ---------------->
    <div class="servicetitle">서비스 약관에 동의해주세요.</div>
    <div class="service">
    	<input type="checkbox" name="totalagree" value="동의" id="allagree"><label for="allagree">모두 동의 합니다.</label>
    </div>
    <div class="detailservice">
    	<ul>
    		<li>
    			<input type="checkbox" name="agree" value="14세 이상" id="agree1" class="agree">
    			<label for="agree1">[필수] 만 14세 이상입니다</label><img src="indexpicture/checkmark.png" style="position: relative; width: 19px; left: -209px; top: 3px; " class="checkmark1">
    		</li>
    		<li>
    			<input type="checkbox" name="agree" value="이용약관 동의" id="agree2" class="agree">
    			<label for="agree2">[필수] 서비스 이용약관 동의</label><img src="indexpicture/checkmark.png" style="position: relative; width: 19px; left: -223px; top: 3px; " class="checkmark1">
    		</li>
    		<li>
    			<input type="checkbox" name="agree" value="전자금융거래 이용약관 동의" id="agree3" class="agree">
    			<label for="agree3">[필수] 전자금융거래 이용약관 동의</label><img src="indexpicture/checkmark.png" style="position: relative; width: 19px; left: -271px; top: 3px; " class="checkmark1">
    		</li>
    		<li>
    			<input type="checkbox" name="agree" value="개인정보 수집 및 이용 동의" id="agree4" class="agree">
    			<label for="agree4">[필수] 개인정보 수집 및 이용 동의</label>
    			<img src="indexpicture/checkmark.png" style="position: relative; width: 19px; left: -272px; top: 3px; " class="checkmark1">
    		</li>
    		<li>
    			<input type="checkbox" name="agree" value="마케팅 및 이벤트 목적의 개인정보 수집 및 이용 동의" id="agree5">
    			<label for="agree5">[선택] 마케팅 및 이벤트 목적의 개인정보 수집 및 이용 동의</label><img src="indexpicture/checkmark.png" style="position: relative; width: 19px; left: -54px; top: -20px; " class="checkmark1">
    		</li>
    	</ul>

    </div> <!---------------회원가입 버튼---------------->
    <div class="gaipbtn"><input type="submit" name="gaipbtn" value="회원가입"  class="btn1" id="gaipbtn1" readonly="true"></div>
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
</form>
</body>
</html>