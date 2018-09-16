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
		
		int id = Integer.parseInt(request.getParameter("id"));
		out.println(id);
		String pw = request.getParameter("pw");
		String Query;
		
		if(id!=0){
			Query = "SELECT * FROM student where stu_code=?";
			pstmt = conn.prepareStatement(Query);
			pstmt.setInt(1,id);
			
			rs = pstmt.executeQuery();
		}else{
			Query = "SELECT * FROM manager where ID=0";
			pstmt = conn.prepareStatement(Query);
			rs = pstmt.executeQuery();
			rs.next();
			if(pw.equals(rs.getString("PW"))){
				response.sendRedirect("manager/manager_main.jsp");
			}else{
				out.println("<script>alert('관리자계정암호가 틀립니다.');history.go(-1);</script>");
			}
		}

		if(rs.next()){
			if(pw.equals(rs.getString("stu_pw"))){
				session.setAttribute("stu_code",String.valueOf(id));
				session.setMaxInactiveInterval(0) ;
				response.sendRedirect("stu/stu_main.jsp");
			}else{
				out.println("<script>alert('비밀번호가 일치하지 않습니다.');history.go(-1);</script>");
			}
		}else{
			Query = "SELECT * FROM professor where pro_code=?";
			pstmt = conn.prepareStatement(Query);
			pstmt.setInt(1,id);
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				if(pw.equals(rs.getString("pro_pw"))){
					session.setAttribute("pro_code",String.valueOf(id));
					session.setMaxInactiveInterval(0) ;
					response.sendRedirect("pro/pro_main.jsp");
				}else{
					out.println("<script>alert('비밀번호가 일치하지 않습니다.');history.go(-1);</script>");
				}
			}else{
				out.println("<script>alert('존재하지 않는 계정입니다.');history.go(-1);</script>");
			}
		}
	}
	catch (SQLException e) {
		out.print(e);
	}
	finally{
		pstmt.close();
	}
%>