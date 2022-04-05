<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbsDTO.BbsDTO" %>
<%@ page import="bbsDAO.BbsDAO" %>
<% request.setCharacterEncoding("utf-8");%>
<% 
   int bbsno = 0;
   String bbstitle = request.getParameter("bbstitle");
   String cooking_genre = request.getParameter("cooking_genre");
   String bbscontent = request.getParameter("bbscontent");

   if(request.getParameter("bbsno") != null){
	  bbsno = Integer.parseInt(request.getParameter("bbsno"));
   }
 
   if(bbsno == 0 || bbstitle == null || cooking_genre == null || bbscontent == null ){
	   %>
	   <script>
	     alert("유효하지 않은 글입니다.");
	     history.back();
	   </script>
	   <%
   }
   
   BbsDTO bbsDTO = new BbsDTO();
   bbsDTO.setBbsno(bbsno);
   bbsDTO.setBbstitle(bbstitle);
   bbsDTO.setBbs_cookinggenre(cooking_genre);
   bbsDTO.setBbscontent(bbscontent);
   BbsDAO bbsDAO = new BbsDAO();
   int result = bbsDAO.bbsUpdate(bbsDTO);
   
   if(result == 0){
	   %>
	   <script>
	     alert("글 수정에 실패했습니다.");
	     history.back();
	   </script>
	   <%
   } else{
	   %>
	   <script>
	     alert("글 수정에 성공했습니다.");
	     location.href="bbs.jsp";
	   </script>
	   <%
   }

%>