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
	int credit=0;
	double result=0;
	
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/capstone";
		String jdbcId = "manager";
		String jdbcPw = "1q2w3e4r";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl,jdbcId,jdbcPw);
		
		Query1 = "SELECT * FROM grade where student_stu_code=? ORDER BY lecture_lecture_code ASC";
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
		<th scope="cols"><B>취득학점</B></th>
		<th scope="cols"><B>평점평균</B></th>
	</TR>
	</thead>
	<tbody>
<%
	while(rs1.next()){
		String grade_result = rs1.getString("grade_result");
		Query2 = "SELECT * FROM lecture where lecture_code=?";
		pstmt = conn.prepareStatement(Query2);
		pstmt.setInt(1,rs1.getInt("lecture_lecture_code"));
		rs2 = pstmt.executeQuery();
		rs2.next();
		credit+=rs2.getInt("lecture_credit");
		
		if(rs1.getString("grade_result").equals("A+")){
			result+=(4.5*rs2.getInt("lecture_credit"));
		}else if(rs1.getString("grade_result").equals("A0")){
			result+=(4.0*rs2.getInt("lecture_credit"));
		}else if(rs1.getString("grade_result").equals("B+")){
			result+=(3.5*rs2.getInt("lecture_credit"));
		}else if(rs1.getString("grade_result").equals("B0")){
			result+=(3.0*rs2.getInt("lecture_credit"));
		}else if(rs1.getString("grade_result").equals("C+")){
			result+=(2.5*rs2.getInt("lecture_credit"));
		}else if(rs1.getString("grade_result").equals("C0")){
			result+=(2.0*rs2.getInt("lecture_credit"));
		}
	}
	result=(Math.round(result/credit*100))/100.00;
	
%>
	<TR>
		<TD WIDTH=150 ALIGN=CENTER><%=credit%></TD>
		<TD WIDTH=150 ALIGN=CENTER><%=result%></TD>
	</TR>
	</tbody>
</TABLE>
<br><br>
 
<TABLE WIDTH=100% class="type08">
    <thead>
	<TR>
		<th scope="cols"><B>과목코드</B></th>
		<th scope="cols"><B>과목이름</B></th>
		<th scope="cols"><B>개설년도</B></th>
		<th scope="cols"><B>학기</B></th>
		<th scope="cols"><B>전공</B></th>
		<th scope="cols"><B>구분</B></th>
		<th scope="cols"><B>담당교수</B></th>
		<th scope="cols"><B>학점</B></th>
		<th scope="cols"><B>성적</B></th>

	</TR>
	</thead>
	<tbody>
<%
rs1.first();
rs1.previous();
	while(rs1.next()){
		String grade_result = rs1.getString("grade_result");
		Query2 = "SELECT * FROM lecture where lecture_code=?";
		pstmt = conn.prepareStatement(Query2);
		pstmt.setInt(1,rs1.getInt("lecture_lecture_code"));
		rs2 = pstmt.executeQuery();
		rs2.next();
		int lecture_code = rs2.getInt("lecture_code");
		int lecture_year = rs2.getInt("lecture_year");
		int lecture_semester = rs2.getInt("lecture_semester");
		String lecture_title = rs2.getString("lecture_title");
		int lecture_major = rs2.getInt("lecture_major");
		int lecture_classification = rs2.getInt("lecture_classification");
		String lecture_time = rs2.getString("lecture_time");
		String lecture_room = rs2.getString("lecture_room");
		int lecture_credit = rs2.getInt("lecture_credit");
		int professor_pro_code = rs2.getInt("professor_pro_code");
%>	
	<TR>
		<TD ALIGN=CENTER height="40"><%=lecture_code%></TD>
		<TD ALIGN=CENTER height="40"><%=lecture_title%></TD>
		<TD ALIGN=CENTER height="40"><%=lecture_year%></TD>
		<TD ALIGN=CENTER height="40"><%=lecture_semester%></TD>
		<TD ALIGN=CENTER height="40"><%=lecture_major%></TD>
		<TD ALIGN=CENTER height="40"><%=lecture_classification%></TD>
		<TD ALIGN=CENTER height="40"><%=professor_pro_code%></TD>
		<TD ALIGN=CENTER height="40"><%=lecture_credit%></TD>
		<TD ALIGN=CENTER height="40"><%=grade_result%></TD>
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