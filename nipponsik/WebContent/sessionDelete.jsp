<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	
	session.removeAttribute("idbox");
	if(session.getAttribute("idbox") == null){
		%>
		<script>
			location.href="indexpage.jsp";
		</script>
		<%
	} else {
		%>
		<script>
			alert("세션 값이 있습니다.");
		</script>
		<%
	}
	
%>