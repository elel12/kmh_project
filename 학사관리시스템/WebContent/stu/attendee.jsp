<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.net.URLEncoder" %>
<% request.setCharacterEncoding("euc-kr"); %>
<%
	String code = (String) session.getAttribute("stu_code");
	int stu_code=Integer.parseInt(code);
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs1 = null;
	ResultSet rs2 = null;
	ResultSet rs3 = null;
	ResultSet rs4 = null;
	String Query1=" ";
	String Query2=" ";
	String Query3=" ";
	String Query4=" ";
	
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/capstone";
		String jdbcId = "manager";
		String jdbcPw = "1q2w3e4r";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl,jdbcId,jdbcPw);
		
		Query1 = "SELECT * FROM lecture ORDER BY lecture_code ASC";

		pstmt = conn.prepareStatement(Query1);
		rs1 = pstmt.executeQuery();
		
%>
<HTML>
<HEAD>	
	<TITLE></TITLE>
	<link rel="stylesheet" href="css/style.css">
	<script type="text/javascript">
		function popupOpen(){
			var popUrl = "schedule.jsp";
			var popOption = "width=1070, height=650, toolbar=no, menubar=no, location=no, directories=no, status=no, scrollbars=no, resizable=no, left=100, top=50;";
			window.open(popUrl,"",popOption);
		}
	</script>

<style type="text/css">
.ClassName {
	text-decoration:none;
	font-family:Arial;
	box-shadow:inset #ffffff 0px 5px 8px -1px,#d6d6d6 1px 3px 2px;
	o-box-shadow:inset #ffffff 0px 5px 8px -1px,#d6d6d6 1px 3px 2px;
	-moz-box-shadow:inset #ffffff 0px 5px 8px -1px,#d6d6d6 1px 3px 2px;
	-webkit-box-shadow:inset #ffffff 0px 5px 8px -1px,#d6d6d6 1px 3px 2px;
	background:#ded2c6;
	background:-o-linear-gradient(90deg, #ded2c6, #a69f9f);
	background:-moz-linear-gradient( center top, #ded2c6 5%, #a69f9f 100% );
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #ded2c6), color-stop(1, #a69f9f) );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ded2c6', endColorstr='#a69f9f');
	background:-webkit-linear-gradient(#ded2c6, #a69f9f);
	background:-ms-linear-gradient(#ded2c6, #a69f9f);
	background:linear-gradient(#ded2c6, #a69f9f);
	text-indent:0px;
	line-height:9px;
	-moz-border-radius:25px;
	-webkit-border-radius:25px;
	border-radius:25px;
	text-align:center;
	vertical-align:middle;
	display:inline-block;
	font-size:12px;
	color:#ffffff;
	width:41px;
	height:9px;
	padding:13px;
	text-shadow:#ab9993 0px 1px 0px;
	border-color:#85837e;
	border-width:2px;
	border-style:solid;
}

.ClassName:active {
	box-shadow:inset #ffffff 0px 5px 8px -1px,#d6d6d6 1px 0 2px;
	o-box-shadow:inset #ffffff 0px 5px 8px -1px,#d6d6d6 1px 0 2px;
	-moz-box-shadow:inset #ffffff 0px 5px 8px -1px,#d6d6d6 1px 0 2px;
	-webkit-box-shadow:inset #ffffff 0px 5px 8px -1px,#d6d6d6 1px 0 2px;
	position:relative;
	top:3px
}

.ClassName:hover {
	background:#a69f9f;
	background:-o-linear-gradient(90deg, #a69f9f, #ded2c6);
	background:-moz-linear-gradient( center top, #a69f9f 5%, #ded2c6 100% );
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #a69f9f), color-stop(1, #ded2c6) );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#a69f9f', endColorstr='#ded2c6');
	background:-webkit-linear-gradient(#a69f9f, #ded2c6);
	background:-ms-linear-gradient(#a69f9f, #ded2c6);
	background:linear-gradient(#a69f9f, #ded2c6);
}
</style>
</style>
</HEAD>

<BODY>
</TABLE>
<TABLE WIDTH=380 HEIGHT=40 BORDER=0 CELLSPACING=1 CELLPADDING=1 ALIGN=CENTER>
	<TR>
		<TD ALIGN=CENTER><FONT SIZE=4><B>강의리스트</B></FONT></TD>
	</TR>
</TABLE>
 
<TABLE WIDTH=100% class="type08">
    <thead>

	<TR>
		<th scope="cols"><B>과목코드</B></th>
		<th scope="cols"><B>과목이름</B></th>
		<th scope="cols"><B>전공</B></th>
		<th scope="cols"><B>구분</B></th>
		<th scope="cols"><B>학점</B></th>
		<th scope="cols"><B>시간</B></th>
		<th scope="cols"><B>강의실</B></th>
		<th scope="cols"><B>수강신청</B></th>

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
		case 1: division="전공필수";break;
		case 2: division="전공선택";break;
		case 3: division="교양필수";break;
		case 4: division="교양";break;
		}
		Query2 = "SELECT * FROM major where major_code=?";
		pstmt = conn.prepareStatement(Query2);
		pstmt.setInt(1,lecture_major);
		rs2 = pstmt.executeQuery();
		rs2.next();
		String major_name = rs2.getString("major_name");

		
%>	
	<TR>
		<TD ALIGN=CENTER height="40"><%=lecture_code%></TD>
		<TD ALIGN=CENTER height="40"><%=lecture_title%></TD>
		<TD ALIGN=CENTER height="40"><%=major_name%></TD>
		<TD ALIGN=CENTER height="40"><%=division%></TD>
		<TD ALIGN=CENTER height="40"><%=lecture_credit%></TD>
		<TD ALIGN=CENTER height="40"><%=lecture_time%></TD>
		<TD ALIGN=CENTER height="40"><%=lecture_room%></TD>
		<TD ALIGN=CENTER height="40"><a href="attendeeproc.jsp?lecture_code=<%=lecture_code%>">수강</a></TD>
	</TR>
	<%	} %>
	</tbody>
</TABLE>
<TABLE WIDTH=800 HEIGHT=40 BORDER=0 CELLSPACING=1 CELLPADDING=1 ALIGN=CENTER>
	<TR>
		<TD ALIGN=CENTER><FONT SIZE=4><B>수강신청리스트</B></FONT></TD>
	</TR>
	<TR>
		<TD ALIGN=RIGHT><a href='javascript:popupOpen();' class="ClassName">시간표</a></TD>
	</TR>
</TABLE>
<TABLE WIDTH=100% class="type08">
    <thead>

	<TR>
		<th scope="cols"><B>과목코드</B></th>
		<th scope="cols"><B>과목이름</B></th>
		<th scope="cols"><B>전공</B></th>
		<th scope="cols"><B>구분</B></th>
		<th scope="cols"><B>학점</B></th>
		<th scope="cols"><B>시간</B></th>
		<th scope="cols"><B>담당교수</B></th>
		<th scope="cols"><B>수강철회</B></th>
	</TR>
	<tbody>
<%

Query3 = "SELECT * FROM attendee where student_stu_code=? ORDER BY lecture_lecture_code ASC";
pstmt = conn.prepareStatement(Query3);
pstmt.setInt(1,stu_code);
rs3 = pstmt.executeQuery();

	while(rs3.next()){
		Query4 = "SELECT * FROM lecture where lecture_code=?";
		pstmt = conn.prepareStatement(Query4);
		pstmt.setInt(1,rs3.getInt("lecture_lecture_code"));
		rs4 = pstmt.executeQuery();
		rs4.next();
		String attendee_grade = rs3.getString("attendee_grade");
		int lecture_code = rs4.getInt("lecture_code");
		String lecture_title = rs4.getString("lecture_title");
		int lecture_major = rs4.getInt("lecture_major");
		int lecture_classification = rs4.getInt("lecture_classification");
		String lecture_time = rs4.getString("lecture_time");
		String lecture_room = rs4.getString("lecture_room");
		int lecture_credit = rs4.getInt("lecture_credit");
		int professor_pro_code = rs4.getInt("professor_pro_code");
		String division=" ";
		switch(lecture_classification){
		case 1: division="전공필수";break;
		case 2: division="전공선택";break;
		case 3: division="교양필수";break;
		case 4: division="교양";break;
		}
		Query2 = "SELECT * FROM major where major_code=?";
		pstmt = conn.prepareStatement(Query2);
		pstmt.setInt(1,lecture_major);
		rs2 = pstmt.executeQuery();
		rs2.next();
		String major_name = rs2.getString("major_name");
		Query2 = "SELECT * FROM professor where pro_code=?";
		pstmt = conn.prepareStatement(Query2);
		pstmt.setInt(1,professor_pro_code);
		rs2 = pstmt.executeQuery();
		rs2.next();
		String pro_name = rs2.getString("pro_name");
%>	
	<TR>
		<TD ALIGN=CENTER height="40"><%=lecture_code%></TD>
		<TD ALIGN=CENTER height="40"><%=lecture_title%></TD>
		<TD ALIGN=CENTER height="40"><%=major_name%></TD>
		<TD ALIGN=CENTER height="40"><%=division%></TD>
		<TD ALIGN=CENTER height="40"><%=lecture_credit%></TD>
		<TD ALIGN=CENTER height="40"><%=lecture_time%></TD>
		<TD ALIGN=CENTER height="40"><%=pro_name%></TD>
		<TD ALIGN=CENTER height="40"><a href="attendee_proc.jsp?lecture_code=<%=lecture_code%>">철회</a></TD>
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