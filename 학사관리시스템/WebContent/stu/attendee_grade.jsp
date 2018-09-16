<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.net.URLEncoder" %>
<% request.setCharacterEncoding("euc-kr"); %>
<%
	String code = (String) session.getAttribute("stu_code");
	int stu_code=Integer.parseInt(code);
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs1 = null;
	String Query1=" ";
	ResultSet rs2 = null;
	String Query2=" ";
	
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/capstone";
		String jdbcId = "manager";
		String jdbcPw = "1q2w3e4r";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl,jdbcId,jdbcPw);
		
		Query1 = "SELECT * FROM attendee where student_stu_code=? ORDER BY lecture_lecture_code ASC";
		pstmt = conn.prepareStatement(Query1);
		pstmt.setInt(1,stu_code);
		rs1 = pstmt.executeQuery();
		
%>
<HTML>
<HEAD>	
	<TITLE></TITLE>
	<link rel="stylesheet" href="css/style.css">
</HEAD>

<BODY>
 
<TABLE WIDTH=100% class="type08">
    <thead>
	<TR>
		<th scope="cols"><B>과목코드</B></th>
		<th scope="cols"><B>과목이름</B></th>
		<th scope="cols"><B>전공</B></th>
		<th scope="cols"><B>구분</B></th>
		<th scope="cols"><B>학점</B></th>
		<th scope="cols"><B>점수</B></th>
	</TR>
	</thead>
	<tbody>	
<%
	while(rs1.next()){
		Query2 = "SELECT * FROM lecture where lecture_code=?";
		pstmt = conn.prepareStatement(Query2);
		pstmt.setInt(1,rs1.getInt("lecture_lecture_code"));
		rs2 = pstmt.executeQuery();
		rs2.next();
		String attendee_grade = rs1.getString("attendee_grade");
		int lecture_code = rs2.getInt("lecture_code");
		String lecture_title = rs2.getString("lecture_title");
		int lecture_major = rs2.getInt("lecture_major");
		int lecture_classification = rs2.getInt("lecture_classification");
		String lecture_time = rs2.getString("lecture_time");
		String lecture_room = rs2.getString("lecture_room");
		int lecture_credit = rs2.getInt("lecture_credit");
		int professor_pro_code = rs2.getInt("professor_pro_code");
		String division=" ";
		switch(lecture_classification){
		case 1: division="전공필수";break;
		case 2: division="전공선택";break;
		case 3: division="교양필수";break;
		case 4: division="교양";break;
		}
		Query2 = "SELECT * FROM major where major_code=?";
		pstmt = conn.prepareStatement(Query2);
		pstmt.setInt(1,lecture_major);
		rs2 = pstmt.executeQuery();
		rs2.next();
		String major_name = rs2.getString("major_name");

		
%>	
	<TR>
		<TD ALIGN=CENTER height="40"><%=lecture_code%></TD>
		<TD ALIGN=CENTER height="40"><%=lecture_title%></TD>
		<TD ALIGN=CENTER height="40"><%=major_name%></TD>
		<TD ALIGN=CENTER height="40"><%=division%></TD>
		<TD ALIGN=CENTER height="40"><%=lecture_credit%></TD>
		<TD ALIGN=CENTER height="40"><%=attendee_grade%></TD>
	</TR>
	<%	} %>
	</tbody>
</TABLE>

<%
	}catch(SQLException e){
		e.printStackTrace();
	}finally{
		rs1.close();
		pstmt.close();
		conn.close();
	}
%>
</BODY>
</HTML>