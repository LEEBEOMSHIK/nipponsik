<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="userDTO.UserDTO" %>
<%@ page import="userDAO.UserDAO" %>
<%
  request.setCharacterEncoding("utf-8");
  String id = request.getParameter("id");
  String pw = request.getParameter("pw");
  String name = request.getParameter("name");
  String nick = request.getParameter("nick");
  String birth = request.getParameter("birth");
  String gender = request.getParameter("gender");
  String phno = request.getParameter("phno");
  String email1 = request.getParameter("email1");
  String email2 = request.getParameter("email2");
  String address1 = request.getParameter("adress1");
  String address2 = request.getParameter("adress2");
  String address3 = request.getParameter("adress3");
  String address4 = request.getParameter("adress4");
  String address5 = request.getParameter("adress5");
  String susin1 = request.getParameter("susin1");
  String susin2 = request.getParameter("susin2");
  
  String totalsusin = null;
  if(susin1 != null && susin2 != null){
     totalsusin = susin1 + " " + susin2;
  } else if(susin1 != null && susin2 == null){
     totalsusin = susin1;
  } else{
      totalsusin = susin2;
  }

  if(id == null || pw == null || name == null || nick == null || gender == null || phno == null || email1 == null || email2 == null || address1 == null || address2 == null || address3 == null || address4 == null || address5 == null){
%>
	  <script>
	     alert("잘못 입력된 사항이 있습니다");
	     history.back();
	  </script>
	  <%
  }
  UserDTO userDTO = new UserDTO();  // 기존의 jsp에서 db처리를 mvc 형태로 바꿈
  userDTO.setCustom_id(id);
  userDTO.setCustom_pw(pw);
  userDTO.setCustom_name(name);
  userDTO.setCustom_nickname(nick);
  userDTO.setCustom_birth(birth);
  userDTO.setCustom_gender(gender);
  userDTO.setCustom_phone(phno);
  userDTO.setCustom_emailinput(email1);
  userDTO.setCustom_mailsearch(email2);
  userDTO.setCustom_address1(address1);
  userDTO.setCustom_address2(address2);
  userDTO.setCustom_address3(address3);
  userDTO.setCustom_address4(address4);
  userDTO.setCustom_address5(address5);
  userDTO.setCustom_susin(totalsusin);  //null값은 아님(확인됨)
  
  	
  UserDAO userDAO = new UserDAO();
  int result=userDAO.gaip(userDTO); //입력된 인스턴스를 insert 메소드로 보냄
  
  if(result == -1){    // 계속 회원가입 실패라는 문구가 나옴 insert 메소드에서 문제가 생긴 듯
	  %>
	  <script>
	     alert("회원가입 실패");
	     history.back();
	  </script>
	  <%
  } else{   
	  %>
	  <script>
	     alert("회원가입 성공");
	     location.href="gaipinfoconfirm.jsp?custom_id=<%=userDTO.getCustom_id()%>";
	  </script>
	  <%
  }
  %>

