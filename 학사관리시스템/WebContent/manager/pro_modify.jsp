<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("euc-kr"); %>
<%
	int p_code = Integer.parseInt(request.getParameter("pro_code"));
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
		
		Query1 = "SELECT * FROM professor where pro_code=?";
		pstmt = conn.prepareStatement(Query1);
		pstmt.setInt(1,p_code);
		
		rs1 = pstmt.executeQuery();
		rs1.next();
		int pro_code = rs1.getInt("pro_code");
		String pro_name = rs1.getString("pro_name");
		int pro_sex = rs1.getInt("pro_sex");
		String pro_adress = rs1.getString("pro_adress");
		String pro_birth = rs1.getString("pro_birth");
		String pro_mail = rs1.getString("pro_mail");
		String pro_phone = rs1.getString("pro_phone");
		String pro_office = rs1.getString("pro_office");
		String pro_pw = rs1.getString("pro_pw");
		int major_major_code = rs1.getInt("major_major_code");
%>
<HTML>
<HEAD>
	<TITLE></TITLE>
</HEAD>

<BODY>

<FORM NAME="professor_modify" METHOD=POST ACTION="pro_modify_proc.jsp">

<TABLE WIDTH=100%>
	<TR>
		<TD colspan="4">
			<INPUT TYPE=submit value="저장">
		</TD>
	</TR>
	<TR></TR><TR></TR><TR></TR><TR></TR><TR></TR>
	<TR>
		<TD ALIGN=LEFT><B>교직원번호&nbsp&nbsp&nbsp<INPUT TYPE=TEXT NAME="pro_code" SIZE=10 style = "text-align:center;" value=<%=pro_code%> readonly></B></TD>
		<TD ALIGN=LEFT><B>이름&nbsp&nbsp&nbsp<INPUT TYPE=TEXT NAME="pro_name" SIZE=10 style = "text-align:center;" value=<%=pro_name%>></B></TD>
		<TD ALIGN=LEFT><B>전공&nbsp&nbsp&nbsp<INPUT TYPE=TEXT NAME="major_major_code" SIZE=10 style = "text-align:center;" value=<%=major_major_code%> readonly></B></TD>
	</TR>
	<TR></TR><TR></TR><TR></TR><TR></TR><TR></TR>
	<TR>
		<TD ALIGN=LEFT><B>생일&nbsp&nbsp&nbsp<INPUT TYPE=TEXT NAME="pro_birth" SIZE=10 style = "text-align:center;" value=<%=pro_birth%> readonly></B></TD>
		<TD ALIGN=LEFT><B>성별&nbsp&nbsp&nbsp<INPUT TYPE=TEXT NAME="pro_sex" SIZE=5 style = "text-align:center;" value=<%=pro_sex%>></B></TD>
		<TD ALIGN=LEFT><B>연구실&nbsp&nbsp&nbsp<INPUT TYPE=TEXT NAME="pro_office" SIZE=10 style = "text-align:center;" value=<%=pro_office%> readonly></B></TD>
	</TR>
	<TR></TR><TR></TR><TR></TR><TR></TR><TR></TR>
	<TR>
		<TD ALIGN=LEFT colspan="2"><B>주소&nbsp&nbsp&nbsp<INPUT TYPE=TEXT NAME="pro_adress" SIZE=40 style = "text-align:center;" value="<%=pro_adress%>"></B></TD>
		<TD ALIGN=LEFT><B>전화&nbsp&nbsp&nbsp<INPUT TYPE=TEXT NAME="pro_phone" SIZE=20 style = "text-align:center;" value=<%=pro_phone%>></B></TD>
	</TR>	
	<TR></TR><TR></TR><TR></TR><TR></TR><TR></TR>
	<TR>
		<TD ALIGN=LEFT colspan="2"><B>메일&nbsp&nbsp&nbsp<INPUT TYPE=TEXT NAME="pro_mail" SIZE=30 style = "text-align:center;" value=<%=pro_mail%>></B></TD>
		<TD ALIGN=LEFT><B>암호&nbsp&nbsp&nbsp<INPUT TYPE=PASSWORD NAME="pro_pw" SIZE=20 style = "text-align:center;" value=<%=pro_pw%>></B></TD>		
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