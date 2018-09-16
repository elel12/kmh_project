<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.net.URLEncoder" %>
<% request.setCharacterEncoding("euc-kr"); %>
<%
	int year;
	try{
		year = Integer.parseInt(request.getParameter("year"));
	}catch(NumberFormatException e){
		year=0;
	}	
	
	Connection conn = null;
	PreparedStatement pstmt = null;

	ResultSet rs = null;
	String Query=" ";
	ResultSet rs1 = null;
	String Query1=" ";
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/capstone";
		String jdbcId = "manager";
		String jdbcPw = "1q2w3e4r";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl,jdbcId,jdbcPw);
		
		Query = "SELECT DISTINCT lecture_year FROM lecture";
		pstmt = conn.prepareStatement(Query);
		rs = pstmt.executeQuery(Query);
		
		Query1 = "SELECT * FROM lecture where lecture_year=? ORDER BY lecture_code ASC";
		pstmt = conn.prepareStatement(Query1);
		pstmt.setInt(1,year);
		rs1 = pstmt.executeQuery();
		
%>
<HTML>
<HEAD>	
	<TITLE>과목 테이블</TITLE>
	<script type="text/javascript">
		function search(value){
			location.href="lecture_list.jsp?year="+value;
		}
	</script>
	<link rel="stylesheet" href="css/style.css">
</HEAD>

<BODY>

<select name="lecture" onChange="search(this.value)">
<option>--검색--</option>
  <%
  	while(rs.next()){
  %>
  		<option value=<%=rs.getInt("lecture_year") %>><%=rs.getString("lecture_year") %></option>
  <%
  	}
  %>
</select>
 
<TABLE WIDTH=100% class="type08">
    <thead>
	<TR>
		<th scope="cols"><B>과목코드</B></th>
		<th scope="cols"><B>과목이름</B></th>
		<th scope="cols"><B>년도</B></th>
		<th scope="cols"><B>학기</B></th>
		<th scope="cols"><B>전공</B></th>
		<th scope="cols"><B>구분</B></th>
		<th scope="cols"><B>시간</B></th>
		<th scope="cols"><B>강의실</B></th>
		<th scope="cols"><B>학점</B></th>
		<th scope="cols"><B>담당교수</B></th>
		<th scope="cols"><B>수정</B></th>
		<th scope="cols"><B>삭제</B></th>
	</TR>
	</thead>
	<tbody>
<%
	while(rs1.next()){
		int lecture_code = rs1.getInt("lecture_code");
		String lecture_title = rs1.getString("lecture_title");
		int lecture_year = rs1.getInt("lecture_year");
		int lecture_semester = rs1.getInt("lecture_semester");
		int lecture_major = rs1.getInt("lecture_major");
		int lecture_classification = rs1.getInt("lecture_classification");
		String lecture_time = rs1.getString("lecture_time");
		String lecture_room = rs1.getString("lecture_room");
		int lecture_credit = rs1.getInt("lecture_credit");
		int professor_pro_code = rs1.getInt("professor_pro_code");

		
%>	
	<TR>
		<TD HEIGHT=20 ALIGN=CENTER><%=lecture_code%></TD>
		<TD HEIGHT=20 ALIGN=CENTER><%=lecture_title%></TD>
		<TD HEIGHT=20 ALIGN=CENTER><%=lecture_year%></TD>
		<TD HEIGHT=20 ALIGN=CENTER><%=lecture_semester%></TD>
		<TD HEIGHT=20 ALIGN=CENTER><%=lecture_major%></TD>
		<TD HEIGHT=20 ALIGN=CENTER><%=lecture_classification%></TD>
		<TD HEIGHT=20 ALIGN=CENTER><%=lecture_time%></TD>
		<TD HEIGHT=20 ALIGN=CENTER><%=lecture_room%></TD>
		<TD HEIGHT=20 ALIGN=CENTER><%=lecture_credit%></TD>
		<TD HEIGHT=20 ALIGN=CENTER><%=professor_pro_code%></TD>
		<TD HEIGHT=20 ALIGN=CENTER><a href="lecture_modify.jsp?lecture_code=<%=lecture_code%>">수정</a></TD>
		<TD HEIGHT=20 ALIGN=CENTER><a href="lecture_delete.jsp?lecture_code=<%=lecture_code%>">삭제</a></TD>
	</TR>
	<%	} %>
	<TR>
		<td HEIGHT=30 colspan="12" ALIGN=CENTER><a href="lecture_create.jsp">추가</a></td>
	</TR>
	<TR>
		<td HEIGHT=30 colspan="12" ALIGN=CENTER><a href="lecture_semester.jsp">학기종료</a></td>
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