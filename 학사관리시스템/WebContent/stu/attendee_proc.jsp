<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*"  %>
<%@ page import="java.net.URLEncoder" %>

<%request.setCharacterEncoding("euc-kr"); %>
<%
	int l_code = Integer.parseInt(request.getParameter("lecture_code"));
	String code = (String) session.getAttribute("stu_code");
	int stu_code=Integer.parseInt(code);
	Connection conn = null;
	PreparedStatement pstmt = null;

	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/capstone";
		String jdbcId = "manager";
		String jdbcPw = "1q2w3e4r";
		out.println(l_code);
		out.println(stu_code);
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl,jdbcId,jdbcPw);
		String Query = "DELETE FROM attendee where lecture_lecture_code=? AND student_stu_code=?";
		pstmt = conn.prepareStatement(Query);
		pstmt.setInt(1,l_code);
		pstmt.setInt(2,stu_code);
		pstmt.executeUpdate();
	
			
	}catch(SQLException e){
		out.print(e);
	}finally{
		pstmt.close();
		conn.close();
		response.sendRedirect("attendee.jsp");
	}
%>