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
			<INPUT TYPE=submit value="����">
		</TD>
	</TR>
	<TR></TR><TR></TR><TR></TR><TR></TR><TR></TR>
	<TR>
		<TD ALIGN=LEFT><B>�й�&nbsp&nbsp&nbsp<INPUT TYPE=TEXT NAME="stu_code" SIZE=10 style = "text-align:center;"></B></TD>
		<TD ALIGN=LEFT><B>�̸�&nbsp&nbsp&nbsp<INPUT TYPE=TEXT NAME="stu_name" SIZE=10 style = "text-align:center;"></B></TD>
		<TD ALIGN=LEFT><B>����&nbsp&nbsp&nbsp<INPUT TYPE=TEXT NAME="major_major_code" SIZE=10 style = "text-align:center;"></B></TD>
		<TD ALIGN=LEFT><B>��������&nbsp&nbsp&nbsp<INPUT TYPE=TEXT NAME="professor_pro_code" SIZE=10 style = "text-align:center;"></B></TD>
	</TR>
	<TR></TR><TR></TR><TR></TR><TR></TR><TR></TR>
	<TR>
		<TD ALIGN=LEFT><B>����&nbsp&nbsp&nbsp<INPUT TYPE=TEXT NAME="stu_birth" SIZE=10 style = "text-align:center;"></B></TD>
		<TD ALIGN=LEFT><B>����&nbsp&nbsp&nbsp<INPUT TYPE=TEXT NAME="stu_sex" SIZE=5 style = "text-align:center;"></B></TD>
		<TD ALIGN=LEFT><B>����&nbsp&nbsp&nbsp<INPUT TYPE=TEXT NAME="stu_condition" SIZE=5 style = "text-align:center;"></B></TD>
		<TD ALIGN=LEFT><B>�г�&nbsp&nbsp&nbsp<INPUT TYPE=TEXT NAME="stu_level" SIZE=5 style = "text-align:center;"></B></TD>
	</TR>
	<TR></TR><TR></TR><TR></TR><TR></TR><TR></TR>
	<TR>
		<TD ALIGN=LEFT colspan="2"><B>�ּ�&nbsp&nbsp&nbsp<INPUT TYPE=TEXT NAME="stu_address" SIZE=40 style = "text-align:center;"></B></TD>
		<TD ALIGN=LEFT><B>��ȭ&nbsp&nbsp&nbsp<INPUT TYPE=TEXT NAME="stu_phone" SIZE=20 style = "text-align:center;"></B></TD>
	</TR>	
	<TR></TR><TR></TR><TR></TR><TR></TR><TR></TR>
	<TR>
		<TD ALIGN=LEFT colspan="2"><B>����&nbsp&nbsp&nbsp<INPUT TYPE=TEXT NAME="stu_mail" SIZE=30 style = "text-align:center;"></B></TD>
		<TD ALIGN=LEFT><B>��ȣ&nbsp&nbsp&nbsp<INPUT TYPE=PASSWORD NAME="stu_pw" SIZE=20 style = "text-align:center;"></B></TD>		
	</TR>
</TABLE>

</FORM>
</BODY>
</HTML>