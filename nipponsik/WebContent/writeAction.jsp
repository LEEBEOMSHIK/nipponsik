<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbsDAO.BbsDAO" %>
<%@ page import="bbsDTO.BbsDTO" %>
<% request.setCharacterEncoding("utf-8");%>
<%
   String id = null;
   String cookgenre = null;
   String bbstitle = request.getParameter("bbstitle");
   String bbscontent = request.getParameter("bbscontent");
   String bbs_cookinggenre = request.getParameter("bbs_cookinggenre");
   BbsDTO bbsDTO = new BbsDTO();
   
   if(bbs_cookinggenre.equals("찜")){
	   cookgenre = "찜";
   } else if(bbs_cookinggenre.equals("전골")){
	   cookgenre = "전골";
   } else if(bbs_cookinggenre.equals("구이")){
	   cookgenre = "구이";
   } else if(bbs_cookinggenre.equals("찌게")){
	   cookgenre = "찌게";
   }
   
   if(session.getAttribute("idbox") != null){    //세션에 저장된 아이디가 있다면 id에 해당 아이디값 저장
	   id = (String) session.getAttribute("idbox");
       bbsDTO.setCust_id(id);
   }
   if(id == null){    // 세션에 저장된 아이디가 없으면 로그인페이지로 보냄
	   %>
	   <script>
	     alert("로그인이 필요한 서비스 입니다.");
	     location.href = "loginpage.jsp";
	   </script>
	   <%
   } else {   // 로그인이 된 상황에서 글제목,글내용,요리 장르가 입력되지 않았으면
	   if(bbstitle == "" || bbscontent == "" || cookgenre == null){
		   %>
		   <script>
		     alert("글 제목, 글 내용, 요리 장르를 정확히 입력해주세요.");
		     history.back();
		   </script>
		   <%
	   } else{  // 로그인되고 모든 정보가 입력이 되었다면 
		   
		   bbsDTO.setBbstitle(bbstitle);
		   bbsDTO.setBbscontent(bbscontent);
		   bbsDTO.setBbs_cookinggenre(cookgenre);
		   BbsDAO bbsDAO = new BbsDAO();
		   String nickname = bbsDAO.getNickname(id);
		   out.println(nickname);
		   bbsDTO.setCust_nickname(nickname);
	       int result = bbsDAO.insertbbs(bbsDTO);
	       if(result == -1){
	    	   %>
	    	   <script>
	    	       alert("글쓰기 실패했습니다.");
	    	       history.back();
	    	   </script>
	    	   <%
	       } else{
	    	   %>
	    	     <script>
	    	       alert("글쓰기 성공했습니다.");
	    	       location.href = "bbs.jsp";
	    	   </script>
	    	   <%
	       }
	   } 
   }
   %>
%>