<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*"  %>
<%@ page import="java.net.URLEncoder" %>

<%request.setCharacterEncoding("euc-kr"); %>
<%
	int p_code = Integer.parseInt(request.getParameter("pro_code"));
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/capstone";
		String jdbcId = "manager";
		String jdbcPw = "1q2w3e4r";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl,jdbcId,jdbcPw);
		
		String Query = "DELETE FROM professor WHERE pro_code="+p_code;
		pstmt = conn.prepareStatement(Query);
		pstmt.executeUpdate(Query);
		
		pstmt.close();
		conn.close();
			
	}catch(SQLException e){
		out.print(e);
	}finally{
		response.sendRedirect("pro_list.jsp");
	}
%>