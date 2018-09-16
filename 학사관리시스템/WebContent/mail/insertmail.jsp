<%@ page import="javax.mail.Transport"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*"%>
<%@ page import = "java.text.SimpleDateFormat"%>
<%@ page import = "java.net.URLEncoder"%>
<%@ page import = "java.util.*, java.io.*, javax.mail.*"%>
<% request.setCharacterEncoding("euc-kr"); %>

<%
	int id = Integer.parseInt(request.getParameter("id"));
	String name = request.getParameter("name");
	String mail = request.getParameter("mail");
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	Connection conn = null;
	
	try {
		String jdbcUrl = "jdbc:mysql://localhost:3306/capstone";
		String jdbcId = "manager";
		String jdbcPw = "1q2w3e4r";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, jdbcId, jdbcPw);
	} catch(Exception e) {
		e.printStackTrace();
	}
	
	if(String.valueOf(id).length() >= 6) {
		try {
			String Query = "Select * from capstone.student where stu_code=? and stu_name=?";
			pstmt = conn.prepareStatement(Query);
			pstmt.setInt(1, id);
			pstmt.setString(2, name);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				Query = "Update capstone.student set stu_mail=? where stu_code=?";
				pstmt = conn.prepareStatement(Query);
				pstmt.setString(1, mail);
				pstmt.setInt(2, id);
				pstmt.executeUpdate();
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { pstmt.close(); rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	else if(String.valueOf(id).length() == 4) {
		try {
			String Query = "Select * from capstone.professor where pro_code=? and pro_name=?";
			pstmt = conn.prepareStatement(Query);
			pstmt.setInt(1, id);
			pstmt.setString(2, name);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				Query = "Update capstone.professor set pro_mail=? where pro_code=?";
				pstmt = conn.prepareStatement(Query);
				pstmt.setString(1, mail);
				pstmt.setInt(2, id);
				pstmt.executeUpdate();
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { pstmt.close(); rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
%>
<script>alert('이메일이 정상 등록되었습니다. 비밀번호찾기를 다시 실행해 주세요');close();</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>