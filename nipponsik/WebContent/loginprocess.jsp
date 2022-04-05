<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>

<% request.setCharacterEncoding("utf-8"); %>
<%
  String id = request.getParameter("idbox");
  String pw = request.getParameter("pwbox");
  session.setAttribute("idbox",id);
  session.setAttribute("pwbox",pw);

  Connection conn = null;
  Statement stmt = null;
  ResultSet rs = null;
  
  try{
  Class.forName("com.mysql.jdbc.Driver");
  conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/nipponsik","root","0000");

  String sql = String.format("select custom_id, custom_pw, custom_name from custom_data where custom_id='%s'",id);

  stmt=conn.createStatement();
  rs=stmt.executeQuery(sql);

  if(rs.next()){
  	if(pw.equals(rs.getString("custom_pw"))){
  		session.setAttribute("name",rs.getString("custom_name"));
  		RequestDispatcher dispatcher = request.getRequestDispatcher("list.order");
  		dispatcher.forward(request,response);
  	} else { %>
  	    <script>
  	    	alert("비밀번호가 맞지 않습니다");
  	    	history.back();
  	    </script>
  	    <%
  	}
  } else {
  %><script>
  	alert("회원등록이 되어있지 않습니다.");
  	history.back();
  </script>
  <%
  }
} finally{
	try{
		conn.close();
	} catch(Exception ignored){

	} try{
		stmt.close();
	} catch(Exception ignored){

	}
}
%>