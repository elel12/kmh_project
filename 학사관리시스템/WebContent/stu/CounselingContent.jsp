<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.net.URLEncoder" %>

<%
String counseling_date = request.getParameter("counseling_date");
int professor_pro_code = Integer.parseInt(request.getParameter("professor_pro_code"));
int student_stu_code = Integer.parseInt(request.getParameter("student_stu_code"));
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs1 = null;
ResultSet rs2 = null;
ResultSet rs3 = null;
String Query1=" ";
String Query2=" ";
String Query3=" ";
try{
	String jdbcUrl = "jdbc:mysql://localhost:3306/capstone";
	String jdbcId = "manager";
	String jdbcPw = "1q2w3e4r";
	
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(jdbcUrl,jdbcId,jdbcPw);
	
	Query1 = "SELECT * FROM counseling where counseling_date=? AND professor_pro_code=? AND student_stu_code=?";
	pstmt = conn.prepareStatement(Query1);
	pstmt.setString(1,counseling_date);
	pstmt.setInt(2,professor_pro_code);
	pstmt.setInt(3,student_stu_code);
	rs1 = pstmt.executeQuery();
%>


<HTML>
<HEAD>
   <META HTTP-EQUIV="CONTENT-TYPE" CONTENT="TEXT/HTML; CHARSET=euc-kr"/>
   <LINK REL="stylesheet" type="text/css" href="../include/style.css"/>      
   <TITLE>게시글 출력</TITLE>
</HEAD>

<BODY>

<TABLE WIDTH=620 HEIGHT=40 BORDER=0 CELLSPACING=1 CELLPADDING=1 ALIGN=CENTER>
   <TR>
      <TD ALIGN=CENTER><FONT SIZE=4><B>상담일지</B></FONT></TD>
   </TR>
</TABLE>
<%
	while(rs1.next()){
		counseling_date = rs1.getString("counseling_date");
		int counseling_division = rs1.getInt("counseling_division");
		String division=" ";
		switch(counseling_division){
		case 1: division="진로상담";break;
		case 2: division="성적상담";break;
		case 3: division="가정상담";break;
		}
		String counseling_text = rs1.getString("counseling_text");
		professor_pro_code = rs1.getInt("professor_pro_code");
		student_stu_code = rs1.getInt("student_stu_code");
		Query2 = "SELECT * FROM professor where pro_code=?";
		pstmt = conn.prepareStatement(Query2);
		pstmt.setInt(1,professor_pro_code);
		rs2 = pstmt.executeQuery();
		rs2.next();
		String pro_name = rs2.getString("pro_name");
		Query3 = "SELECT * FROM student where stu_code=?";
		pstmt = conn.prepareStatement(Query3);
		pstmt.setInt(1,student_stu_code);
		rs3 = pstmt.executeQuery();
		rs3.next();
		String stu_name = rs3.getString("stu_name");
%>
<BODY>

<TABLE WIDTH=620 BORDER=1 CELLSPACING=0 CELLPADDING=1 ALIGN=CENTER>

   <TR>
      <TD WIDTH=120 ALIGN=CENTER><B>상담일시</B></TD>
      <TD WIDTH=500 ALIGN=CENTER><%=counseling_date%></TD>
   </TR>
   
   <TR>
      <TD WIDTH=120 ALIGN=CENTER><B>구분</B></TD>
      <TD WIDTH=500 ALIGN=CENTER><%=division%></TD>
   </TR>
   
      <TR>
      <TD WIDTH=120 ALIGN=CENTER><B>교직원이름</B></TD>
      <TD WIDTH=500 ALIGN=CENTER><%=pro_name%></TD>
   </TR>
   <TR>
      <TD WIDTH=120 ALIGN=CENTER><B>학생이름</B></TD>
      <TD WIDTH=500 ALIGN=CENTER><%=stu_name%></TD>
   </TR>
   
   <TR>
      <TD WIDTH=120 ALIGN=CENTER><B>내용</B></TD>
      <TD WIDTH=500><%=counseling_text%></TD>
   </TR>
   <%} %>
    
</TABLE>

<%
}catch (SQLException e)
{
   e.printStackTrace();
   
}
finally
{
   rs1.close();
   pstmt.close();
   conn.close();
}
%>
</BODY>
</HTML>
