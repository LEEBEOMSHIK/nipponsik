<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<%
    String id = request.getParameter("id");  

    if(id == null)
    	throw new Exception("데이터를 입력하십시오.");

    Connection conn = null;
    Statement stmt = null;
    int idcheck = 0;
    if(id == ""){
    	idcheck = -2;
    }

    try{
    	Class.forName("com.mysql.jdbc.Driver");
    	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/nipponsik","root","0000");

    	if(conn == null)
	       throw new Exception("데이터 베이스에 연결할 수 없습니다.");

	    stmt=conn.createStatement();
	    String sql = String.format("select custom_id from custom_data where custom_id = '%s';",id); //mysql에서는 잘 나옴
	    ResultSet rs = stmt.executeQuery(sql);
	    if(rs.next()){
            idcheck = 1; //이미 존재하는 회원
        } else{
            idcheck = -1; // 사용할 수 있는 아이디 
        }
	    out.print(idcheck);  //ajax는 태그 내 값과 출력 값만 가지고 간다!! 출력이 제대로 되고 있지 않은지??
    } finally{
    	try{ 
         stmt.close();
     }
     catch(Exception ignored){
     }
     try{
            conn.close();
         }
         catch(Exception ignored){
         }
     }
%>