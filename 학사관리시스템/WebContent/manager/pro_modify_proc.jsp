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
		
		int pro_code = Integer.parseInt(request.getParameter("pro_code"));
		String pro_name = request.getParameter("pro_name");
		int pro_sex = Integer.parseInt(request.getParameter("pro_sex"));
		String pro_adress = request.getParameter("pro_adress");
		int pro_birth = Integer.parseInt(request.getParameter("pro_birth"));
		String pro_mail = request.getParameter("pro_mail");
		String pro_phone = request.getParameter("pro_phone");
		String pro_office = request.getParameter("pro_office");
		String pro_pw = request.getParameter("pro_pw");
		int major_major_code = Integer.parseInt(request.getParameter("major_major_code"));

		String Query = "UPDATE professor SET pro_name=?, pro_sex=?, pro_adress=?, pro_birth=?, pro_mail=?, pro_phone=?, pro_office=?, pro_pw=?, major_major_code=? WHERE pro_code=?";
		pstmt = conn.prepareStatement(Query);
		
		pstmt.setString(1,pro_name);
		pstmt.setInt(2,pro_sex);
		pstmt.setString(3,pro_adress);
		pstmt.setInt(4,pro_birth);
		pstmt.setString(5,pro_mail);
		pstmt.setString(6,pro_phone);
		pstmt.setString(7,pro_office);
		pstmt.setString(8,pro_pw);
		pstmt.setInt(9,major_major_code);
		pstmt.setInt(10,pro_code);

		
		pstmt.executeUpdate();
	}
	catch (SQLException e) {
		out.print(e);
	
	}
	finally{
		pstmt.close();
		response.sendRedirect("pro_list.jsp");
	}
%>