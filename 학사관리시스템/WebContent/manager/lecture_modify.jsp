<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("euc-kr"); %>
<%
	int l_code = Integer.parseInt(request.getParameter("lecture_code"));
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
		
		Query1 = "SELECT * FROM lecture where lecture_code=?";
		pstmt = conn.prepareStatement(Query1);
		pstmt.setInt(1,l_code);
		
		rs1 = pstmt.executeQuery();
		rs1.next();
		int lecture_code = rs1.getInt("lecture_code");
		String lecture_title = rs1.getString("lecture_title");
		int lecture_year = rs1.getInt("lecture_year");
		int lecture_semester = rs1.getInt("lecture_semester");
		int lecture_major = rs1.getInt("lecture_major");
		int lecture_classification = rs1.getInt("lecture_classification");
		String lecture_time = rs1.getString("lecture_time");
		String lecture_room = rs1.getString("lecture_room");
		int lecture_credit = rs1.getInt("lecture_credit");
		int professor_pro_code = rs1.getInt("professor_pro_code");
%>
<HTML>
<HEAD>
	<TITLE></TITLE>
</HEAD>

<BODY>

<FORM NAME="lecture_modify" METHOD=POST ACTION="lectureModifyProc.jsp">

<TABLE WIDTH=100% ALIGN=CENTER>

	<TR>
		<TD ALIGN=CENTER><B>과목코드</B>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<INPUT TYPE=TEXT NAME="lecture_code" SIZE=20 value=<%=lecture_code%>></TD>
	</TR>
	<TR>
		<TD ALIGN=CENTER><B>과목이름</B>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<INPUT TYPE=TEXT NAME="lecture_title" SIZE=20 value=<%=lecture_title%>></TD>
	</TR>
	<TR>
		<TD ALIGN=CENTER><B>년도</B>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<INPUT TYPE=TEXT NAME="lecture_year" SIZE=20 value=<%=lecture_year%>></TD>
	</TR>
	<TR>
		<TD ALIGN=CENTER><B>학기</B>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<INPUT TYPE=TEXT NAME="lecture_semester" SIZE=20 value=<%=lecture_semester%>></TD>
	</TR>
	<TR>
		<TD ALIGN=CENTER><B>전공</B>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<INPUT TYPE=TEXT NAME="lecture_major" SIZE=20 value=<%=lecture_major%>></TD>
	</TR>
	<TR>
		<TD ALIGN=CENTER><B>구분</B>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<INPUT TYPE=TEXT NAME="lecture_classification" SIZE=20 value=<%=lecture_classification%>></TD>
	</TR>
	<TR>
		<TD ALIGN=CENTER><B>시간</B>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<INPUT TYPE=TEXT NAME="lecture_time" SIZE=20 value=<%=lecture_time%>></TD>
	</TR>
	<TR>
		<TD ALIGN=CENTER><B>강의실</B>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<INPUT TYPE=TEXT NAME="lecture_room" SIZE=20 value=<%=lecture_room%>></TD>
	</TR>
	<TR>
		<TD ALIGN=CENTER><B>학점</B>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<INPUT TYPE=TEXT NAME="lecture_credit" SIZE=20 value=<%=lecture_credit%>></TD>
	</TR>
	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>담당교수</B>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<INPUT TYPE=TEXT NAME="professor_pro_code" SIZE=20 value=<%=professor_pro_code%>></TD>
	</TR>
	<TR>
		<TD colspan="2" ALIGN=CENTER>
			<INPUT TYPE=submit value="저장">
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