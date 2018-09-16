<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.sql.*" %>
	<%@ page import="java.util.*"  %>
	<%@ page import="java.io.*"  %>
    <%request.setCharacterEncoding("euc-kr"); %>

<%
	Statement stmt= null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/capstone";
		String jdbcId = "manager";
		String jdbcPw = "1q2w3e4r";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(jdbcUrl,jdbcId,jdbcPw);
		
		String counseling_date = request.getParameter("counseling_date");
		int counseling_division = Integer.parseInt(request.getParameter("counseling_division"));
		String counseling_text = request.getParameter("counseling_text");
		int student_stu_code = Integer.parseInt(request.getParameter("student_stu_code"));
		int professor_pro_code = Integer.parseInt(request.getParameter("professor_pro_code"));
		
		String Query1 = "select * from student where stu_code="+student_stu_code+"";
		pstmt = conn.prepareStatement(Query1);
		rs=pstmt.executeQuery();
		rs.next();
		int stu_major=rs.getInt("professor_major_major_code");
		
		Query1 = "select * from professor where pro_code="+professor_pro_code+"";
		pstmt = conn.prepareStatement(Query1);
		rs=pstmt.executeQuery();
		rs.next();
		int pro_major=rs.getInt("major_major_code");
		
		if(counseling_division==2){
			if(stu_major==pro_major){
				String Query2 = "INSERT INTO counseling VALUES (?,?,?,?,?)";
				pstmt = conn.prepareStatement(Query2);
				pstmt.setString(1,counseling_date);
				pstmt.setInt(2,counseling_division);
				pstmt.setString(3,counseling_text);
				pstmt.setInt(4,student_stu_code);
				pstmt.setInt(5,professor_pro_code);
				
				pstmt.executeUpdate();
				response.sendRedirect("counseling.jsp");
			}else{
				out.println("<script>alert('성적상담은 같은 학과 교수만 가능합니다.');history.go(-1);</script>");
			}
		}else{
			String Query2 = "INSERT INTO counseling VALUES (?,?,?,?,?)";
			pstmt = conn.prepareStatement(Query2);
			pstmt.setString(1,counseling_date);
			pstmt.setInt(2,counseling_division);
			pstmt.setString(3,counseling_text);
			pstmt.setInt(4,student_stu_code);
			pstmt.setInt(5,professor_pro_code);
			
			pstmt.executeUpdate();
			response.sendRedirect("counseling.jsp");
		}
		
		
	}
	catch (SQLException e) {
		out.print(e);
	
	}
	finally{
		pstmt.close();
	}
%>