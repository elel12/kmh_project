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
	ResultSet rs1 = null;
	ResultSet rs2 = null;
	ResultSet rs3 = null;
	Boolean check = false;
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/capstone";
		String jdbcId = "manager";
		String jdbcPw = "1q2w3e4r";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl,jdbcId,jdbcPw);
		String Query = "select * FROM attendee WHERE student_stu_code=? AND lecture_lecture_code=?";
		pstmt = conn.prepareStatement(Query);
		pstmt.setInt(1,l_code);
		pstmt.setInt(2,stu_code);
		rs1 = pstmt.executeQuery();
		if(!rs1.next()){
			check=true;
			Query = "select lecture_lecture_code FROM attendee WHERE student_stu_code="+stu_code;
			pstmt = conn.prepareStatement(Query);
			rs1 = pstmt.executeQuery();
			while(rs1.next() && check){
				String Query2 = "select lecture_time FROM lecture WHERE lecture_code="+rs1.getString("lecture_lecture_code");
				pstmt = conn.prepareStatement(Query2);
				rs2 = pstmt.executeQuery();
				rs2.next();
				String[] time1 = rs2.getString("lecture_time").split(",");
				
				String Query3 = "select lecture_time FROM lecture WHERE lecture_code="+l_code;
				pstmt = conn.prepareStatement(Query3);
				rs3 = pstmt.executeQuery();
				rs3.next();
				String[] time2 = rs3.getString("lecture_time").split(",");
				for(int i=0;i<time1.length;i++){
					for(int j=0;j<time2.length;j++){
						if(time1[i].equals(time2[j])){
							check=false;
						}
					}
				}
			}
		}
		
		if(check){
			String attendee_grade=" ";
			Query = "INSERT INTO attendee VALUES (?,?,?)";
			pstmt = conn.prepareStatement(Query);
			pstmt.setString(1,attendee_grade);
			pstmt.setInt(2,l_code);
			pstmt.setInt(3,stu_code);
			pstmt.executeUpdate();
		}
	
			
	}catch(SQLException e){
		out.print(e);
	}finally{
		pstmt.close();
		conn.close();
		response.sendRedirect("attendee.jsp");
	}
%>