<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.net.URLEncoder" %>

<HTML>
<HEAD>
	<TITLE></TITLE>
</HEAD>

<BODY>

<FORM NAME="lecture_create" METHOD=POST ACTION="lectureCreateProc.jsp">

<TABLE WIDTH=100% ALIGN=CENTER>

	<TR>
		<TD ALIGN=CENTER><B>�����ڵ�</B>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<INPUT TYPE=TEXT NAME="lecture_code" SIZE=20></TD>
	</TR>
	<TR>
		<TD ALIGN=CENTER><B>�����̸�</B>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<INPUT TYPE=TEXT NAME="lecture_title" SIZE=20></TD>
	</TR>
	<TR>
		<TD ALIGN=CENTER><B>�⵵</B>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<INPUT TYPE=TEXT NAME="lecture_year" SIZE=20></TD>
	</TR>
	<TR>
		<TD ALIGN=CENTER><B>�б�</B>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<INPUT TYPE=TEXT NAME="lecture_semester" SIZE=20></TD>
	</TR>
	<TR>
		<TD ALIGN=CENTER><B>����</B>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<INPUT TYPE=TEXT NAME="lecture_major" SIZE=20></TD>
	</TR>
	<TR>
		<TD ALIGN=CENTER><B>����</B>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<INPUT TYPE=TEXT NAME="lecture_classification" SIZE=20 ></TD>
	</TR>
	<TR>
		<TD ALIGN=CENTER><B>�ð�</B>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<INPUT TYPE=TEXT NAME="lecture_time" SIZE=20></TD>
	</TR>
	<TR>
		<TD ALIGN=CENTER><B>���ǽ�</B>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<INPUT TYPE=TEXT NAME="lecture_room" SIZE=20></TD>
	</TR>
	<TR>
		<TD ALIGN=CENTER><B>����</B>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<INPUT TYPE=TEXT NAME="lecture_credit" SIZE=20></TD>
	</TR>
	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>��米��</B>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<INPUT TYPE=TEXT NAME="professor_pro_code" SIZE=20></TD>
	</TR>
	<TR>
		<TD colspan="2" ALIGN=CENTER>
			<INPUT TYPE=submit value="����">
		</TD>
	</TR>
</TABLE>

</FORM>

</BODY>
</HTML>