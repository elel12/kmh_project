<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.net.URLEncoder" %>
<% request.setCharacterEncoding("euc-kr"); %>
<%
	String code = (String) session.getAttribute("pro_code");
	int pro_code=Integer.parseInt(code);
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs1 = null;
	String Query1=" ";
	ResultSet rs2 = null;
	String Query2=" ";
	ResultSet rs3 = null;
	String Query3=" ";
	
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/capstone";
		String jdbcId = "manager";
		String jdbcPw = "1q2w3e4r";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl,jdbcId,jdbcPw);
		
		Query1 = "SELECT * FROM lecture where professor_pro_code=? ORDER BY lecture_code ASC";
		pstmt = conn.prepareStatement(Query1);
		pstmt.setInt(1,pro_code);
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
		<th scope="cols"><B>학점</B></th>
		<th scope="cols"><B>학번</B></th>
		<th scope="cols"><B>성적</B></th>
		<th scope="cols"><B>성적입력</B></th>

	</TR>
	</thead>
	<tbody>
<%
	while(rs1.next()){
		Query2 = "SELECT * FROM attendee where lecture_lecture_code=?";
		pstmt = conn.prepareStatement(Query2);
		pstmt.setInt(1,rs1.getInt("lecture_code"));
		rs2 = pstmt.executeQuery();
		while(rs2.next()){
			int lecture_code = rs1.getInt("lecture_code");
			String lecture_title = rs1.getString("lecture_title");
			int lecture_credit = rs1.getInt("lecture_credit");
			int student_stu_code = rs2.getInt("student_stu_code");
			String attendee_grade = rs2.getString("attendee_grade");
	%>	
		<TR>
			<TD ALIGN=CENTER height="40"><%=lecture_code%></TD>
			<TD ALIGN=CENTER height="40"><%=lecture_title%></TD>
			<TD ALIGN=CENTER height="40"><%=lecture_credit%></TD>
			<TD ALIGN=CENTER height="40"><%=student_stu_code%></TD>
			<TD ALIGN=CENTER height="40"><%=attendee_grade%></TD>
			<TD ALIGN=CENTER height="40"><a href="attendee_form.jsp?lecture_code=<%=lecture_code%>&stu_code=<%=student_stu_code%>">입력</a></TD>
		</TR>
		<%	} 
		}
%>		
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