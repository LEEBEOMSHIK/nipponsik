<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "userDAO.UserDAO" %>
<%@ page import = "userDTO.UserDTO" %>
<%
	request.setCharacterEncoding("utf-8");

	String custom_id = null;
	if(session.getAttribute("idbox") != null){
		custom_id =(String) session.getAttribute("idbox");
	}

	String emailinput = null;
	if(request.getParameter("change_custom_emailinput") != null){
		emailinput = (String)request.getParameter("change_custom_emailinput");
	} else {
		emailinput = (String)request.getParameter("custom_emailinput");
	}
	
	String mailsearch = null;
	if(request.getParameter("change_custom_mailsearch") != null){
		mailsearch = (String)request.getParameter("change_custom_mailsearch");
	} else{
		mailsearch = (String)request.getParameter("custom_mailsearch");
	}
	
	String custom_name = null;
	if(request.getParameter("change_custom_name") != null){
		custom_name = (String)request.getParameter("change_custom_name");
	} else{
		custom_name = (String)request.getParameter("custom_name");
	}
	
	String custom_nickname = null;
	if(request.getParameter("change_custom_nickname") != null){
		custom_nickname = (String)request.getParameter("change_custom_nickname");
	} else {
		custom_nickname = (String)request.getParameter("custom_nickname");
	}
	
	String custom_phone = null;
	if(request.getParameter("change_custom_phone") != null){
		custom_phone = (String)request.getParameter("change_custom_phone");
	} else {
		custom_phone = (String)request.getParameter("custom_phone");
	}
	
	String custom_pw = null;
	if(request.getParameter("new_custom_password") != null){
		custom_pw = (String)request.getParameter("new_custom_password");
	} else {
		custom_pw = (String)request.getParameter("custom_pw");
	}
	
	if(emailinput == null || mailsearch == null || custom_name == null || custom_nickname == null || custom_phone == null || custom_pw == null){
		%>
		<script>
			alert("미입력된 사항이 있습니다.");
			history.back();
		</script>
		<%
	}
	
	UserDTO userDTO = new UserDTO();
	userDTO.setCustom_emailinput(emailinput);
	userDTO.setCustom_mailsearch(mailsearch);
	userDTO.setCustom_name(custom_name);
	userDTO.setCustom_nickname(custom_nickname);
	userDTO.setCustom_phone(custom_phone);
	userDTO.setCustom_pw(custom_pw);
	userDTO.setCustom_id(custom_id);
	
	UserDAO userDAO = new UserDAO();
	int result = userDAO.updateUser(userDTO);


	if(result == 1){
		%>
		<script>
			alert("회원정보 수정 성공하였습니다.");
			location.href = "mypage.jsp";
		</script>
		<%
	} else {
		%>
		<script>
			alert("회원정보 수정에 실패하였습니다.");
			history.back();
		</script>
		<%
	}
%>
	
%>


