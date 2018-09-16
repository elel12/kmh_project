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
		String stu_name = request.getParameter("stu_name");
		int stu_sex = Integer.parseInt(request.getParameter("stu_sex"));
		String stu_address = request.getParameter("stu_address");
		String stu_birth = request.getParameter("stu_birth");
		String stu_mail = request.getParameter("stu_mail");
		String stu_phone = request.getParameter("stu_phone");
		int stu_level = Integer.parseInt(request.getParameter("stu_level"));
		int stu_condition = Integer.parseInt(request.getParameter("stu_condition"));
		String stu_pw = request.getParameter("stu_pw");
		int professor_pro_code = Integer.parseInt(request.getParameter("professor_pro_code"));
		int major_major_code = Integer.parseInt(request.getParameter("major_major_code"));

		String Query = "UPDATE student SET stu_name=?, stu_sex=?, stu_address=?, stu_birth=?, stu_mail=?, stu_phone=?, stu_level=?, stu_condition=?, stu_pw=?, professor_pro_code=?, professor_major_major_code=? WHERE stu_code=?";
		pstmt = conn.prepareStatement(Query);
		
		
		pstmt.setString(1,stu_name);
		pstmt.setInt(2,stu_sex);
		pstmt.setString(3,stu_address);
		pstmt.setString(4,stu_birth);
		pstmt.setString(5,stu_mail);
		pstmt.setString(6,stu_phone);
		pstmt.setInt(7,stu_level);
		pstmt.setInt(8,stu_condition);
		pstmt.setString(9,stu_pw);
		pstmt.setInt(10,professor_pro_code);
		pstmt.setInt(11,major_major_code);
		pstmt.setInt(12,stu_code);

		
		pstmt.executeUpdate();
	}
	catch (SQLException e) {
		out.print(e);
	
	}
	finally{
		pstmt.close();
		response.sendRedirect("stu_list.jsp");
	}
%>