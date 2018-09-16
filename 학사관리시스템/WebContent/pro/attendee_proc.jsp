<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*"  %>
<%@ page import="java.net.URLEncoder" %>

<%request.setCharacterEncoding("euc-kr"); %>
<%
	int l_code = Integer.parseInt(request.getParameter("lecture_code"));
	int s_code = Integer.parseInt(request.getParameter("stu_code"));
	String grade = request.getParameter("attendee_grade");
	
	Connection conn = null;
	PreparedStatement pstmt = null;

	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/capstone";
		String jdbcId = "manager";
		String jdbcPw = "1q2w3e4r";
		out.println(l_code);
		out.println(s_code);
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl,jdbcId,jdbcPw);
		String Query = "UPDATE attendee SET attendee_grade=? where lecture_lecture_code=? AND student_stu_code=?";
		pstmt = conn.prepareStatement(Query);
		pstmt.setString(1,grade);
		pstmt.setInt(2,l_code);
		pstmt.setInt(3,s_code);
		pstmt.executeUpdate();
	
			
	}catch(SQLException e){
		out.print(e);
	}finally{
		pstmt.close();
		conn.close();
		response.sendRedirect("attendee.jsp");
	}
%>