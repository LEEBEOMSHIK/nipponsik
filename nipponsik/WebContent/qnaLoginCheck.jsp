<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String cust_id = null;
	if(session.getAttribute("idbox") != null){
		%>
		<script>
			location.href="qna_board_write.jsp";
		</script>
		<%
	} else {
		%>
		<script>
			alert("로그인이 필요한 서비스 입니다.");
			location.href="loginpage.jsp";
		</script>
		<%
	}
%>