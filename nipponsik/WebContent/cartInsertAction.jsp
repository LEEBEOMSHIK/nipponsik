<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("utf-8");

	
	String custom_id = null;
	if(session.getAttribute("idbox") != null){
		custom_id = (String) session.getAttribute("idbox");
	}
	
	int goods_code = 0;
	
	if(request.getParameter("goods_code") != null){
		goods_code = Integer.parseInt(request.getParameter("goods_code"));
	}
	
	int amount = 0;
	
	if(request.getParameter("amount") != null){
		amount = Integer.parseInt(request.getParameter("amount"));
	}
	
	if(custom_id == null){
		%>
		<script>
			alert("로그인이 필요한 서비스입니다");
			location.href="loginpage.jsp";
		</script>
		<%
	} else {
		%>
		<script>
			location.href="cartAdd.co?goods_code=<%=goods_code%>&amount=<%=amount%>";
		</script>
		<%
	}
%>