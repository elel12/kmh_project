<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.net.URLEncoder" %>
<% request.setCharacterEncoding("euc-kr"); %>
<%
	int major;
	try{
		major = Integer.parseInt(request.getParameter("major"));
	}catch(NumberFormatException e){
		major=0;
	}	
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs1 = null;
	ResultSet rs2 = null;
	String Query1=" ";
	String Query2=" ";
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/capstone";
		String jdbcId = "manager";
		String jdbcPw = "1q2w3e4r";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl,jdbcId,jdbcPw);
		
		Query1 = "SELECT * FROM professor where major_major_code="+major;
		pstmt = conn.prepareStatement(Query1);
		rs1 = pstmt.executeQuery(Query1);
		
		Query2 = "SELECT * FROM major";
		pstmt = conn.prepareStatement(Query2);
		rs2 = pstmt.executeQuery(Query2);
%>
<HTML>
<HEAD>	
	<script type="text/javascript">
		function search(value){
			location.href="pro_list.jsp?major="+value;
		}
	</script>
	<LINK REL="stylesheet" type="text/css" href="../include/style.css"/>
	<link rel="stylesheet" href="css/style.css">
</HEAD>
<BODY>
<select name="major" onChange="search(this.value)">
<option>--검색--</option>
  <%
  	while(rs2.next()){
  %>
  		<option value=<%=rs2.getInt("major_code") %>><%=rs2.getString("major_name") %></option>
  <%
  	}
  %>
</select>
 
<TABLE class="type08" width=100%>
    <thead>
	<TR>
		<th scope="cols"><B>교직원번호</B></th>
		<th scope="cols"><B>이름</B></th>
		<th scope="cols"><B>성별</B></th>
		<th scope="cols"><B>주소</B></th>
		<th scope="cols"><B>생일</B></th>
		<th scope="cols"><B>메일</B></th>
		<th scope="cols"><B>전화</B></th>
		<th scope="cols"><B>사무실</B></th>
		<th scope="cols"><B>암호</B></th>
		<th scope="cols"><B>전공</B></th>
		<th scope="cols"><B>수정</B></th>
		<th scope="cols"><B>삭제</B></th>
	</TR>
	</thead>
	<tbody>
	
<%
	while(rs1.next()){
		int pro_code = rs1.getInt("pro_code");
		String pro_name = rs1.getString("pro_name");
		int pro_sex = rs1.getInt("pro_sex");
		String pro_address = rs1.getString("pro_adress");
		String pro_birth = rs1.getString("pro_birth");
		String pro_mail = rs1.getString("pro_mail");
		String pro_phone = rs1.getString("pro_phone");
		String pro_office = rs1.getString("pro_office");
		String pro_pw = rs1.getString("pro_pw");
		int major_major_code = rs1.getInt("major_major_code");

		
%>	
	<TR>
		<TD HEIGHT=20 ALIGN=CENTER><%=pro_code%></TD>
		<TD HEIGHT=20 ALIGN=CENTER><%=pro_name%></TD>
		<TD HEIGHT=20 ALIGN=CENTER><%=pro_sex%></TD>
		<TD HEIGHT=20 ALIGN=CENTER><%=pro_address%></TD>
		<TD HEIGHT=20 ALIGN=CENTER><%=pro_birth%></TD>
		<TD HEIGHT=20 ALIGN=CENTER><%=pro_mail%></TD>
		<TD HEIGHT=20 ALIGN=CENTER><%=pro_phone%></TD>
		<TD HEIGHT=20 ALIGN=CENTER><%=pro_office%></TD>
		<TD HEIGHT=20 ALIGN=CENTER><%=pro_pw%></TD>
		<TD HEIGHT=20 ALIGN=CENTER><%=major_major_code%></TD>
		<TD WIDTH=20 ALIGN=CENTER><a href="pro_modify.jsp?pro_code=<%=pro_code%>">수정</a></TD>
		<TD WIDTH=20 ALIGN=CENTER><a href="pro_delete.jsp?pro_code=<%=pro_code%>">삭제</a></TD>
	</TR>
	<%	} %>
	
	<TR>
		<td HEIGHT=30 colspan="14" ALIGN=CENTER><a href="pro_create.jsp">추가</a></td>
	</TR>
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