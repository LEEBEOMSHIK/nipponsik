<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "userDAO.UserDAO" %>
<%
	request.setCharacterEncoding("utf-8");

	String custom_id = null;
	if(session.getAttribute("idbox") != null){
		custom_id = (String) session.getAttribute("idbox");
	}
	
	UserDAO userDAO = new UserDAO();
	int result = userDAO.deleteUser(custom_id);
	
	if(result == 1){
		%>
		<script>
			alert("회원탈퇴 성공하였습니다.");
			location.href = "indexpage.jsp";
		</script>
		<%
	} else {
		%>
		<script>
			alert("회원탈퇴에 실패하였습니다.");
			history.back();
		</script>
		<%
	}
%>