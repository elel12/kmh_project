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
		
		int stu_code = Integer.parseInt(request.getParameter("stu_code"));
		out.println(stu_code);
		String stu_name = request.getParameter("stu_name");
		out.println(stu_name);
		int stu_sex = Integer.parseInt(request.getParameter("stu_sex"));
		out.println(stu_sex);
		String stu_address = request.getParameter("stu_address");
		out.println(stu_address);
		String stu_mail = request.getParameter("stu_mail");
		out.println(stu_mail);
		String stu_phone = request.getParameter("stu_phone");
		out.println(stu_phone);
		String stu_pw = request.getParameter("stu_pw");
		out.println(stu_pw);

		String Query = "UPDATE student SET stu_name=?, stu_sex=?, stu_address=?, stu_mail=?, stu_phone=?, stu_pw=? WHERE stu_code=?";
		pstmt = conn.prepareStatement(Query);
		pstmt.setString(1,stu_name);
		pstmt.setInt(2,stu_sex);
		pstmt.setString(3,stu_address);
		pstmt.setString(4,stu_mail);
		pstmt.setString(5,stu_phone);
		pstmt.setString(6,stu_pw);
		pstmt.setInt(7,stu_code);
	
		pstmt.executeUpdate();
	}
	catch (SQLException e) {
		out.print(e);
	
	}
	finally{
		pstmt.close();
		response.sendRedirect("profile.jsp");
	}
%>