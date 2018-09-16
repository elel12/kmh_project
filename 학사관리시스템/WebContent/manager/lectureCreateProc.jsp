<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.sql.*" %>
	<%@ page import="java.util.*"  %>
	<%@ page import="java.io.*"  %>
    <%request.setCharacterEncoding("euc-kr"); %>

<%
	Statement stmt= null;
	PreparedStatement pstmt = null;
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/capstone";
		String jdbcId = "manager";
		String jdbcPw = "1q2w3e4r";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(jdbcUrl,jdbcId,jdbcPw);
		
		int lecture_code = Integer.parseInt(request.getParameter("lecture_code"));
		String lecture_title = request.getParameter("lecture_title");
		int lecture_year = Integer.parseInt(request.getParameter("lecture_year"));
		int lecture_semester = Integer.parseInt(request.getParameter("lecture_semester"));
		int lecture_major = Integer.parseInt(request.getParameter("lecture_major"));
		int lecture_classification = Integer.parseInt(request.getParameter("lecture_classification"));
		String lecture_time = request.getParameter("lecture_time");
		String lecture_room = request.getParameter("lecture_room");
		int lecture_credit = Integer.parseInt(request.getParameter("lecture_credit"));
		int professor_pro_code = Integer.parseInt(request.getParameter("professor_pro_code"));
		
		
		String Query2 = "INSERT INTO lecture VALUES (?,?,?,?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(Query2);
		pstmt.setInt(1,lecture_code);
		pstmt.setString(2,lecture_title);
		pstmt.setInt(3,lecture_year);
		pstmt.setInt(4,lecture_semester);
		pstmt.setInt(5,lecture_major);
		pstmt.setInt(6,lecture_classification);
		pstmt.setString(7,lecture_time);
		pstmt.setString(8,lecture_room);
		pstmt.setInt(9,lecture_credit);
		pstmt.setInt(10,professor_pro_code);
		
		pstmt.executeUpdate();
	}
	catch (SQLException e) {
		out.print(e);
	
	}
	finally{
		pstmt.close();
		response.sendRedirect("lecture_list.jsp");
	}
%>