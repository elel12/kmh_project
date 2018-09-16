<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("euc-kr"); %>
<%
	int l_code = Integer.parseInt(request.getParameter("lecture_code"));
	int s_code = Integer.parseInt(request.getParameter("stu_code"));
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs1 = null;
	
	String Query1=" ";
	
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/capstone";
		String jdbcId = "manager";
		String jdbcPw = "1q2w3e4r";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl,jdbcId,jdbcPw);
		
		Query1 = "SELECT * FROM attendee where lecture_lecture_code=? AND student_stu_code=?";
		pstmt = conn.prepareStatement(Query1);
		pstmt.setInt(1,l_code);
		pstmt.setInt(2,s_code);
		
		rs1 = pstmt.executeQuery();
		rs1.next();
		int lecture_lecture_code = rs1.getInt("lecture_lecture_code");
		int student_stu_code = rs1.getInt("student_stu_code");
		String attendee_grade = rs1.getString("attendee_grade");
%>
<HTML>
<HEAD>
	<TITLE></TITLE>
</HEAD>

<BODY>

<FORM NAME="modify" METHOD=POST ACTION="attendee_proc.jsp?lecture_code=<%=lecture_lecture_code%>&stu_code=<%=student_stu_code%>">

<TABLE WIDTH=100%>
	<TR>
		<TD WIDTH=200 ALIGN="left"><B>苞格内靛&nbsp&nbsp&nbsp</B><INPUT TYPE=TEXT NAME="lecture_lecture_code" SIZE=25 style = "text-align:center;" value=<%=lecture_lecture_code %> readonly></TD>
	</TR>
	<TR>
		<TD WIDTH=400 ALIGN="left"><B>&nbsp&nbsp&nbsp切 锅&nbsp&nbsp&nbsp&nbsp&nbsp</B><INPUT TYPE=TEXT NAME="student_stu_code" SIZE=25 style = "text-align:center;" value=<%=student_stu_code %> readonly></TD>
	</TR>
	<TR>
		<TD WIDTH=200 ALIGN="left"><B>&nbsp&nbsp&nbsp己 利&nbsp&nbsp&nbsp&nbsp&nbsp</B><INPUT TYPE=TEXT NAME="attendee_grade" SIZE=25 style = "text-align:center;"></TD>
	</TR>
	<TR>
		<TD colspan="4">
			<INPUT TYPE=submit value="历厘">
		</TD>
	</TR>
</TABLE>

</FORM>
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