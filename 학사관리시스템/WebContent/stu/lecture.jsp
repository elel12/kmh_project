<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.net.URLEncoder" %>
<% request.setCharacterEncoding("euc-kr"); %>
<%
int classification;
try{
	classification = Integer.parseInt(request.getParameter("classification"));
}catch(NumberFormatException e){
	classification=0;
}
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs1 = null;
	ResultSet rs2 = null;
	ResultSet rs3 = null;
	String Query1=" ";
	String Query2=" ";
	String Query3=" ";
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/capstone";
		String jdbcId = "manager";
		String jdbcPw = "1q2w3e4r";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl,jdbcId,jdbcPw);
		
		Query1 = "SELECT * FROM lecture where lecture_classification=? ORDER BY lecture_code ASC";
		pstmt = conn.prepareStatement(Query1);
		pstmt.setInt(1,classification);
		rs1 = pstmt.executeQuery();
		
%>
<HTML>
<HEAD>	
	<TITLE>���� ���̺�</TITLE>
	<link rel="stylesheet" href="css/style.css">
	<script type="text/javascript">
		function search(value){
			location.href="lecture.jsp?classification="+value;
		}
	</script>
</HEAD>

<BODY>

<select name="lecture" onChange="search(this.value)">
	<option>--�˻�--</option>
  	<option value=1>�����ʼ�</option>
  	<option value=2>��������</option>
  	<option value=3>�����ʼ�</option>
  	<option value=4>����</option>
</select>
 
<TABLE WIDTH=100% class="type08">
    <thead>
	<TR>
		<th scope="cols"><B>�����ڵ�</B></th>
		<th scope="cols"><B>�����̸�</B></th>
		<th scope="cols"><B>����</B></th>
		<th scope="cols"><B>����</B></th>
		<th scope="cols"><B>�ð�</B></th>
		<th scope="cols"><B>���ǽ�</B></th>
		<th scope="cols"><B>����</B></th>
		<th scope="cols"><B>��米��</B></th>
	</TR>
	</thead>
	<tbody>
	
<%
	while(rs1.next()){
		int lecture_code = rs1.getInt("lecture_code");
		String lecture_title = rs1.getString("lecture_title");
		int lecture_major = rs1.getInt("lecture_major");
		int lecture_classification = rs1.getInt("lecture_classification");
		String lecture_time = rs1.getString("lecture_time");
		String lecture_room = rs1.getString("lecture_room");
		int lecture_credit = rs1.getInt("lecture_credit");
		int professor_pro_code = rs1.getInt("professor_pro_code");
		String division=" ";
		switch(lecture_classification){
		case 1: division="�����ʼ�";break;
		case 2: division="��������";break;
		case 3: division="�����ʼ�";break;
		case 4: division="����";break;
		}
		Query2 = "SELECT * FROM professor where pro_code=?";
		pstmt = conn.prepareStatement(Query2);
		pstmt.setInt(1,professor_pro_code);
		rs2 = pstmt.executeQuery();
		rs2.next();
		String pro_name = rs2.getString("pro_name");
		Query3 = "SELECT * FROM major where major_code=?";
		pstmt = conn.prepareStatement(Query3);
		pstmt.setInt(1,lecture_major);
		rs3 = pstmt.executeQuery();
		rs3.next();
		String major_name = rs3.getString("major_name");

		
%>	
	<TR>
		<TD ALIGN=CENTER height="40"><%=lecture_code%></TD>
		<TD ALIGN=CENTER height="40"><%=lecture_title%></TD>
		<TD ALIGN=CENTER height="40"><%=major_name%></TD>
		<TD ALIGN=CENTER height="40"><%=division%></TD>
		<TD ALIGN=CENTER height="40"><%=lecture_time%></TD>
		<TD ALIGN=CENTER height="40"><%=lecture_room%></TD>
		<TD ALIGN=CENTER height="40"><%=lecture_credit%></TD>
		<TD ALIGN=CENTER height="40"><%=pro_name%></TD>
	</TR>
	<%	} %>
	</tbody>
</TABLE>

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