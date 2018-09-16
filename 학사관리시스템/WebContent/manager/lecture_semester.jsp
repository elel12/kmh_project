<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*"  %>
<%@ page import="java.net.URLEncoder" %>

<%request.setCharacterEncoding("euc-kr"); %>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/capstone";
		String jdbcId = "manager";
		String jdbcPw = "1q2w3e4r";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl,jdbcId,jdbcPw);

		String Query = "select * from attendee";
		pstmt = conn.prepareStatement(Query);
		rs = pstmt.executeQuery(Query);
		while(rs.next()){
			String attendee_grade = rs.getString("attendee_grade");
			int lecture_code = rs.getInt("lecture_lecture_code");
			int stu_code = rs.getInt("student_stu_code");
			Query = "INSERT INTO grade VALUES (?,?,?)";
			pstmt = conn.prepareStatement(Query);
			pstmt.setString(1,attendee_grade);
			pstmt.setInt(2,stu_code);
			pstmt.setInt(3,lecture_code);
			pstmt.executeUpdate();
		}
		
		Query = "DELETE FROM attendee";
		pstmt = conn.prepareStatement(Query);
		pstmt.executeUpdate(Query);
		
		pstmt.close();
		conn.close();
			
	}catch(SQLException e){
		out.print(e);
	}finally{
		response.sendRedirect("lecture_list.jsp");
	}
%>