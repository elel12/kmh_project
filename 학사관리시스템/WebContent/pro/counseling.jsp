<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.net.URLEncoder" %>
<% request.setCharacterEncoding("euc-kr"); %>
<%
	String code = (String) session.getAttribute("pro_code");
	int p_code=Integer.parseInt(code);
	 java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yy.MM.dd_HH:mm");
	 String now = formatter.format(new java.util.Date());
%>
<HTML>
<HEAD>	
	<TITLE></TITLE>
</HEAD>

<BODY>
<FORM NAME="counseling" METHOD=POST ACTION="counselingProc.jsp">

<TABLE WIDTH=620 BORDER=1 CELLSPACING=0 CELLPADDING=2 ALIGN=CENTER>
	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>��㳯¥</B></TD>
		<TD WIDTH=500>
			<INPUT TYPE=TEXT NAME="counseling_date" SIZE=25 style = "text-align:center;" value=<%=now %> readonly>
		</TD>
	</TR>
	
	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>����</B></TD>
		<TD WIDTH=500>
			<select name="counseling_division">
  				<option value=1>����</option>
  				<option value=2>����</option>
  				<option value=3>����</option>
			</select>
		</TD>
	</TR>
	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>������</B></TD>
		<TD WIDTH=500>
			<INPUT TYPE=TEXT NAME="professor_pro_code" SIZE=70 value=<%=p_code%> readonly>
		</TD>
	</TR>
	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>�л�</B></TD>
		<TD WIDTH=500>
			<INPUT TYPE=TEXT NAME="student_stu_code" SIZE=70>
		</TD>
	</TR>
	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>����</B></TD>
		<TD WIDTH=500>
			<TEXTAREA NAME="counseling_text" COLS=70 ROWS=8></TEXTAREA>
		</TD>
	</TR>
	<TR>	
		<TD WIDTH=120 ALIGN=CENTER colspan="2"><INPUT TYPE=SUBMIT VALUE="����"><INPUT TYPE=RESET VALUE="���"></textarea></TD>
	</TR>
</TABLE>

</FORM>
</FORM>

</BODY>
</HTML>