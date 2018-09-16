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
		
		Query1 = "SELECT * FROM student where professor_major_major_code="+major;

		pstmt = conn.prepareStatement(Query1);
		rs1 = pstmt.executeQuery();
		
		Query2 = "SELECT * FROM major";
		pstmt = conn.prepareStatement(Query2);
		rs2 = pstmt.executeQuery(Query2);
		
%>
<HTML>
<HEAD>	
	<script type="text/javascript">
		function search(value){
			location.href="stu_list.jsp?major="+value;
		}
	</script>
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
 
<TABLE WIDTH=100% class="type08">
    <thead>
	<TR>
		<th scope="cols"><B>학번</B></th>
		<th scope="cols"><B>이름</B></th>
		<th scope="cols"><B>성별</B></th>
		<th scope="cols"><B>주소</B></th>
		<th scope="cols"><B>생일</B></th>
		<th scope="cols"><B>메일</B></th>
		<th scope="cols"><B>전화</B></th>
		<th scope="cols"><B>학년</B></th>
		<th scope="cols"><B>상태</B></th>
		<th scope="cols"><B>암호</B></th>
		<th scope="cols"><B>지도교수</B></th>
		<th scope="cols"><B>전공</B></th>
		<th scope="cols"><B>수정</B></th>
		<th scope="cols"><B>삭제</B></th>
	</TR>
	</thead>
	<tbody>
	
<%
	while(rs1.next()){
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
	<TR>
		<TD HEIGHT=20 ALIGN=CENTER><%=stu_code%></TD>
		<TD HEIGHT=20 ALIGN=CENTER><%=stu_name%></TD>
		<TD HEIGHT=20 ALIGN=CENTER><%=stu_sex%></TD>
		<TD HEIGHT=20 ALIGN=CENTER><%=stu_address%></TD>
		<TD HEIGHT=20 ALIGN=CENTER><%=stu_birth%></TD>
		<TD HEIGHT=20 ALIGN=CENTER><%=stu_mail%></TD>
		<TD HEIGHT=20 ALIGN=CENTER><%=stu_phone%></TD>
		<TD HEIGHT=20 ALIGN=CENTER><%=stu_level%></TD>
		<TD HEIGHT=20 ALIGN=CENTER><%=stu_condition%></TD>
		<TD HEIGHT=20 ALIGN=CENTER><%=stu_pw%></TD>
		<TD HEIGHT=20 ALIGN=CENTER><%=professor_pro_code%></TD>
		<TD HEIGHT=20 ALIGN=CENTER><%=major_major_code%></TD>
		<TD HEIGHT=20 ALIGN=CENTER><a href="stu_modify.jsp?stu_code=<%=stu_code%>">수정</a></TD>
		<TD HEIGHT=20 ALIGN=CENTER><a href="stu_delete.jsp?stu_code=<%=stu_code%>">삭제</a></TD>
	</TR>
	<%	} %>
	<TR>
		<td HEIGHT=30 colspan="14" ALIGN=CENTER><a href="stu_create.jsp">추가</a></td>
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