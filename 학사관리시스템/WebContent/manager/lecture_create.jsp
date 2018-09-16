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
		<TD ALIGN=CENTER><B>과목코드</B>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<INPUT TYPE=TEXT NAME="lecture_code" SIZE=20></TD>
	</TR>
	<TR>
		<TD ALIGN=CENTER><B>과목이름</B>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<INPUT TYPE=TEXT NAME="lecture_title" SIZE=20></TD>
	</TR>
	<TR>
		<TD ALIGN=CENTER><B>년도</B>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<INPUT TYPE=TEXT NAME="lecture_year" SIZE=20></TD>
	</TR>
	<TR>
		<TD ALIGN=CENTER><B>학기</B>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<INPUT TYPE=TEXT NAME="lecture_semester" SIZE=20></TD>
	</TR>
	<TR>
		<TD ALIGN=CENTER><B>전공</B>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<INPUT TYPE=TEXT NAME="lecture_major" SIZE=20></TD>
	</TR>
	<TR>
		<TD ALIGN=CENTER><B>구분</B>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<INPUT TYPE=TEXT NAME="lecture_classification" SIZE=20 ></TD>
	</TR>
	<TR>
		<TD ALIGN=CENTER><B>시간</B>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<INPUT TYPE=TEXT NAME="lecture_time" SIZE=20></TD>
	</TR>
	<TR>
		<TD ALIGN=CENTER><B>강의실</B>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<INPUT TYPE=TEXT NAME="lecture_room" SIZE=20></TD>
	</TR>
	<TR>
		<TD ALIGN=CENTER><B>학점</B>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<INPUT TYPE=TEXT NAME="lecture_credit" SIZE=20></TD>
	</TR>
	<TR>
		<TD WIDTH=120 ALIGN=CENTER><B>담당교수</B>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<INPUT TYPE=TEXT NAME="professor_pro_code" SIZE=20></TD>
	</TR>
	<TR>
		<TD colspan="2" ALIGN=CENTER>
			<INPUT TYPE=submit value="저장">
		</TD>
	</TR>
</TABLE>

</FORM>

</BODY>
</HTML>