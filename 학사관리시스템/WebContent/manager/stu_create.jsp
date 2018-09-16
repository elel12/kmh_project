<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.net.URLEncoder" %>

<HTML>
<HEAD>
	<TITLE></TITLE>
</HEAD>

<BODY>

<FORM NAME="modify" METHOD=POST ACTION="stu_create_proc.jsp">

<TABLE WIDTH=100%>
	<TR>
		<TD colspan="4">
			<INPUT TYPE=submit value="저장">
		</TD>
	</TR>
	<TR></TR><TR></TR><TR></TR><TR></TR><TR></TR>
	<TR>
		<TD ALIGN=LEFT><B>학번&nbsp&nbsp&nbsp<INPUT TYPE=TEXT NAME="stu_code" SIZE=10 style = "text-align:center;"></B></TD>
		<TD ALIGN=LEFT><B>이름&nbsp&nbsp&nbsp<INPUT TYPE=TEXT NAME="stu_name" SIZE=10 style = "text-align:center;"></B></TD>
		<TD ALIGN=LEFT><B>전공&nbsp&nbsp&nbsp<INPUT TYPE=TEXT NAME="major_major_code" SIZE=10 style = "text-align:center;"></B></TD>
		<TD ALIGN=LEFT><B>지도교수&nbsp&nbsp&nbsp<INPUT TYPE=TEXT NAME="professor_pro_code" SIZE=10 style = "text-align:center;"></B></TD>
	</TR>
	<TR></TR><TR></TR><TR></TR><TR></TR><TR></TR>
	<TR>
		<TD ALIGN=LEFT><B>생일&nbsp&nbsp&nbsp<INPUT TYPE=TEXT NAME="stu_birth" SIZE=10 style = "text-align:center;"></B></TD>
		<TD ALIGN=LEFT><B>성별&nbsp&nbsp&nbsp<INPUT TYPE=TEXT NAME="stu_sex" SIZE=5 style = "text-align:center;"></B></TD>
		<TD ALIGN=LEFT><B>상태&nbsp&nbsp&nbsp<INPUT TYPE=TEXT NAME="stu_condition" SIZE=5 style = "text-align:center;"></B></TD>
		<TD ALIGN=LEFT><B>학년&nbsp&nbsp&nbsp<INPUT TYPE=TEXT NAME="stu_level" SIZE=5 style = "text-align:center;"></B></TD>
	</TR>
	<TR></TR><TR></TR><TR></TR><TR></TR><TR></TR>
	<TR>
		<TD ALIGN=LEFT colspan="2"><B>주소&nbsp&nbsp&nbsp<INPUT TYPE=TEXT NAME="stu_address" SIZE=40 style = "text-align:center;"></B></TD>
		<TD ALIGN=LEFT><B>전화&nbsp&nbsp&nbsp<INPUT TYPE=TEXT NAME="stu_phone" SIZE=20 style = "text-align:center;"></B></TD>
	</TR>	
	<TR></TR><TR></TR><TR></TR><TR></TR><TR></TR>
	<TR>
		<TD ALIGN=LEFT colspan="2"><B>메일&nbsp&nbsp&nbsp<INPUT TYPE=TEXT NAME="stu_mail" SIZE=30 style = "text-align:center;"></B></TD>
		<TD ALIGN=LEFT><B>암호&nbsp&nbsp&nbsp<INPUT TYPE=PASSWORD NAME="stu_pw" SIZE=20 style = "text-align:center;"></B></TD>		
	</TR>
</TABLE>

</FORM>
</BODY>
</HTML>