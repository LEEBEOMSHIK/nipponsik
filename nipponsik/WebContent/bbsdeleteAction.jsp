<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbsDAO.BbsDAO" %>
<% request.setCharacterEncoding("utf-8");%>
<%
   int bbsno = 0;
   if(request.getParameter("bbsno") != null){
	   bbsno = Integer.parseInt(request.getParameter("bbsno"));
   }
   if(bbsno == 0){
	   %>
	   <script>
	     alert("유효하지 않은 글입니다.");
	     history.back();
	   </script>
	   <%
   }
   
   BbsDAO bbsDAO = new BbsDAO();
   int result = bbsDAO.bbsDelete(bbsno);
   if(result == 1){
	   %>
	   <script>
	      alert("글 삭제에 성공하였습니다.");
	      location.href="bbs.jsp";
	   </script>
	   <%
   } else{
	   %>
	   <script>
	      alert("글 삭제에 실패하였습니다.");
	      history.back();
	   </script>
	   <%
   }
%>