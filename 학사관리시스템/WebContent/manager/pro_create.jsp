<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.net.URLEncoder" %>

<HTML>
<HEAD>
	<TITLE></TITLE>
</HEAD>

<BODY>

<FORM NAME="professor_create" METHOD=POST ACTION="pro_create_proc.jsp">

<TABLE WIDTH=100%>
	<TR>
		<TD colspan="4">
			<INPUT TYPE=submit value="����">
		</TD>
	</TR>
	<TR></TR><TR></TR><TR></TR><TR></TR><TR></TR>
	<TR>
		<TD ALIGN=LEFT><B>��������ȣ&nbsp&nbsp&nbsp<INPUT TYPE=TEXT NAME="pro_code" SIZE=10 style = "text-align:center;"></B></TD>
		<TD ALIGN=LEFT><B>�̸�&nbsp&nbsp&nbsp<INPUT TYPE=TEXT NAME="pro_name" SIZE=10 style = "text-align:center;"></B></TD>
		<TD ALIGN=LEFT><B>����&nbsp&nbsp&nbsp<INPUT TYPE=TEXT NAME="major_major_code" SIZE=10 style = "text-align:center;"></B></TD>
	</TR>
	<TR></TR><TR></TR><TR></TR><TR></TR><TR></TR>
	<TR>
		<TD ALIGN=LEFT><B>����&nbsp&nbsp&nbsp<INPUT TYPE=TEXT NAME="pro_birth" SIZE=10 style = "text-align:center;"></B></TD>
		<TD ALIGN=LEFT><B>����&nbsp&nbsp&nbsp<INPUT TYPE=TEXT NAME="pro_sex" SIZE=5 style = "text-align:center;"></B></TD>
		<TD ALIGN=LEFT><B>������&nbsp&nbsp&nbsp<INPUT TYPE=TEXT NAME="pro_office" SIZE=10 style = "text-align:center;"></B></TD>
	</TR>
	<TR></TR><TR></TR><TR></TR><TR></TR><TR></TR>
	<TR>
		<TD ALIGN=LEFT colspan="2"><B>�ּ�&nbsp&nbsp&nbsp<INPUT TYPE=TEXT NAME="pro_adress" SIZE=40 style = "text-align:center;""></B></TD>
		<TD ALIGN=LEFT><B>��ȭ&nbsp&nbsp&nbsp<INPUT TYPE=TEXT NAME="pro_phone" SIZE=20 style = "text-align:center;"></B></TD>
	</TR>	
	<TR></TR><TR></TR><TR></TR><TR></TR><TR></TR>
	<TR>
		<TD ALIGN=LEFT colspan="2"><B>����&nbsp&nbsp&nbsp<INPUT TYPE=TEXT NAME="pro_mail" SIZE=30 style = "text-align:center;"></B></TD>
		<TD ALIGN=LEFT><B>��ȣ&nbsp&nbsp&nbsp<INPUT TYPE=PASSWORD NAME="pro_pw" SIZE=20 style = "text-align:center;"></B></TD>		
	</TR>
</TABLE>

</FORM>

</BODY>
</HTML>