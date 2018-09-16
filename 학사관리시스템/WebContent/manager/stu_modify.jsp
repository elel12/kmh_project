<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("euc-kr"); %>
<%
	int s_code=Integer.parseInt(request.getParameter("stu_code"));
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
		
		Query1 = "SELECT * FROM student where stu_code=?";
		pstmt = conn.prepareStatement(Query1);
		pstmt.setInt(1,s_code);
		
		rs1 = pstmt.executeQuery();
		rs1.next();
		int stu_code = rs1.getInt("stu_code");
		String stu_name = rs1.getString("stu_name");
		int stu_sex = rs1.getInt("stu_sex");
		String stu_address = rs1.getString("stu_address");
		String stu_birth = rs1.getString("stu_birth");
		String stu_mail = rs1.getString("stu_mail");
		String stu_phone = rs1.getString("stu_phone");
		int stu_level = rs1.getInt("stu_level");
		int stu_condition = rs1.getInt("stu_condition");
		String stu_pw = rs1.getString("stu_pw");
		int professor_pro_code = rs1.getInt("professor_pro_code");
		int major_major_code = rs1.getInt("professor_major_major_code");
%>
<HTML>
<HEAD>
	<TITLE></TITLE>
</HEAD>

<BODY>

<FORM NAME="modify" METHOD=POST ACTION="stu_modify_proc.jsp">

<TABLE WIDTH=100%>
	<TR>
		<TD colspan="4">
			<INPUT TYPE=submit value="저장">
		</TD>
	</TR>
	<TR></TR><TR></TR><TR></TR><TR></TR><TR></TR>
	<TR>
		<TD ALIGN=LEFT><B>학번&nbsp&nbsp&nbsp<INPUT TYPE=TEXT NAME="stu_code" SIZE=10 style = "text-align:center;" value=<%=stu_code%>></B></TD>
		<TD ALIGN=LEFT><B>이름&nbsp&nbsp&nbsp<INPUT TYPE=TEXT NAME="stu_name" SIZE=10 style = "text-align:center;" value=<%=stu_name%>></B></TD>
		<TD ALIGN=LEFT><B>전공&nbsp&nbsp&nbsp<INPUT TYPE=TEXT NAME="major_major_code" SIZE=10 style = "text-align:center;" value=<%=major_major_code%>></B></TD>
		<TD ALIGN=LEFT><B>지도교수&nbsp&nbsp&nbsp<INPUT TYPE=TEXT NAME="professor_pro_code" SIZE=10 style = "text-align:center;" value=<%=professor_pro_code%>></B></TD>
	</TR>
	<TR></TR><TR></TR><TR></TR><TR></TR><TR></TR>
	<TR>
		<TD ALIGN=LEFT><B>생일&nbsp&nbsp&nbsp<INPUT TYPE=TEXT NAME="stu_birth" SIZE=10 style = "text-align:center;" value=<%=stu_birth%>></B></TD>
		<TD ALIGN=LEFT><B>성별&nbsp&nbsp&nbsp<INPUT TYPE=TEXT NAME="stu_sex" SIZE=5 style = "text-align:center;" value=<%=stu_sex%>></B></TD>
		<TD ALIGN=LEFT><B>상태&nbsp&nbsp&nbsp<INPUT TYPE=TEXT NAME="stu_condition" SIZE=5 style = "text-align:center;" value=<%=stu_condition%>></B></TD>
		<TD ALIGN=LEFT><B>학년&nbsp&nbsp&nbsp<INPUT TYPE=TEXT NAME="stu_level" SIZE=5 style = "text-align:center;" value=<%=stu_level%>></B></TD>
	</TR>
	<TR></TR><TR></TR><TR></TR><TR></TR><TR></TR>
	<TR>
		<TD ALIGN=LEFT colspan="2"><B>주소&nbsp&nbsp&nbsp<INPUT TYPE=TEXT NAME="stu_address" SIZE=40 style = "text-align:center;" value="<%=stu_address%>"></B></TD>
		<TD ALIGN=LEFT><B>전화&nbsp&nbsp&nbsp<INPUT TYPE=TEXT NAME="stu_phone" SIZE=20 style = "text-align:center;" value=<%=stu_phone%>></B></TD>
	</TR>	
	<TR></TR><TR></TR><TR></TR><TR></TR><TR></TR>
	<TR>
		<TD ALIGN=LEFT colspan="2"><B>메일&nbsp&nbsp&nbsp<INPUT TYPE=TEXT NAME="stu_mail" SIZE=30 style = "text-align:center;" value=<%=stu_mail%>></B></TD>
		<TD ALIGN=LEFT><B>암호&nbsp&nbsp&nbsp<INPUT TYPE=PASSWORD NAME="stu_pw" SIZE=20 style = "text-align:center;" value=<%=stu_pw%>></B></TD>		
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