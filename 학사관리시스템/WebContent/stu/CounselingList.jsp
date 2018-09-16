<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.net.URLEncoder" %>
<% request.setCharacterEncoding("euc-kr"); %>
<%
	String code = (String) session.getAttribute("stu_code");
	int s_code=Integer.parseInt(code);
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs1 = null;
	ResultSet rs2 = null;
	String Query1=" ";
	String Query2=" ";
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/capstone";
		String jdbcId = "manager";
		String jdbcPw = "1q2w3e4r";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl,jdbcId,jdbcPw);
		
		Query1 = "SELECT * FROM counseling where student_stu_code=? ORDER BY counseling_date DESC";
		pstmt = conn.prepareStatement(Query1);
		pstmt.setInt(1,s_code);
		rs1 = pstmt.executeQuery();
%>
<HTML>
<HEAD>
	<META HTTP-EQUIV="CONTENT-TYPE" CONTENT="TEXT/HTML; CHARSET=euc-kr"/>
	<LINK REL="stylesheet" type="text/css" href="../include/style.css"/>	
	<link rel="stylesheet" href="css/style.css">
	<TITLE></TITLE>
</HEAD>

<BODY>

<TABLE WIDTH=380 HEIGHT=40 BORDER=0 CELLSPACING=1 CELLPADDING=1 ALIGN=CENTER>
	<TR>
		<TD ALIGN=CENTER><FONT SIZE=4><B>상담일지 ( 리스트 )</B></FONT></TD>
	</TR>
</TABLE>
 
<TABLE class="type08" width=100%>
    <thead>
	<TR>
		<th scope="cols"><B>상담일시</B></th>
		<th scope="cols"><B>구분</B></th>
		<th scope="cols"><B>교직원</B></th>
	</TR>
	</thead>
	<tbody>
	
<%
	while(rs1.next()){
		String counseling_date = rs1.getString("counseling_date");
		int counseling_division = rs1.getInt("counseling_division");
		String division=" ";
		switch(counseling_division){
		case 1: division="진로상담";break;
		case 2: division="성적상담";break;
		case 3: division="가정상담";break;
		}
		int professor_pro_code = rs1.getInt("professor_pro_code");
		int student_stu_code = rs1.getInt("student_stu_code");
		Query2 = "SELECT * FROM professor where pro_code=?";
		pstmt = conn.prepareStatement(Query2);
		pstmt.setInt(1,professor_pro_code);
		rs2 = pstmt.executeQuery();
		rs2.next();
		String pro_name = rs2.getString("pro_name");
%>
	
	
	
	<TR>
		<TD WIDTH=140 ALIGN=CENTER><A HREF="CounselingContent.jsp?counseling_date=<%=counseling_date %>&professor_pro_code=<%=professor_pro_code %>&student_stu_code=<%=student_stu_code%>"><%=counseling_date%></A></TD>
		<TD WIDTH=100 ALIGN=CENTER><%=division%></TD>
		<TD WIDTH=140 ALIGN=CENTER><%=pro_name%></TD>
	</TR>
	<%} %>
	</tbody>
</TABLE>

<%
	}catch(SQLException e){
		e.printStackTrace();
	}finally{
		rs2.close();
		rs1.close();
		pstmt.close();
		conn.close();
	}
%>
</BODY>
</HTML>