<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "java.net.URLEncoder"%>
<%@ page import = "java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*"  %>
<%@ page import="java.io.*"  %>
<%
	request.setCharacterEncoding("euc-kr");

	String code = (String)session.getAttribute("stu_code");
	
	int stu_code = Integer.parseInt(code);
	PreparedStatement pstmt = null;
	ResultSet rs1 = null;
	ResultSet rs2 = null;
	ResultSet rs3 = null;
	Connection conn = null;
	char al = 'a';
	int alpha = (char)al;
	String[][] tr_value1 = new String[10][5];
	String[][] tr_room1 = new String[10][5];
	String[][] tr_value2 = new String[10][5];
	String[][] tr_room2 = new String[10][5];
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>시간표</title>
<script src = "http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type = "text/javascript">
$(function() {
	for(var i = 0; i < 7; i++) {
		$("#sch").rowspan(i);
		}
	});
    $.fn.rowspan = function(index) {
    	var that;
    	$('tr', this).each(function(row) {
    		$('td:eq(' + index + ')', this).each(function(col) {
    			if($(this).html() == $(that).html()) {
    				if($(this)[0].className.length < 1) {
    					that = this;
    				} else {
    					rowspan = $(that).attr("rowSpan");
    					
    					if(rowspan == undefined) {
    						$(that).attr("rowSpan",1);
    						rowspan = $(that).attr("rowSpan");
    					}
    					rowspan = Number(rowspan) + 1;
    					$(that).attr("rowSpan",rowspan);
    					$(this).hide();
                    }
    			} else {
    				that = this;
    			}
    		});
    	});
    };
</script>
</head>
<body>
<%
try {
	String jdbcUrl = "jdbc:mysql://localhost:3306/capstone";
	String jdbcId = "manager";
	String jdbcPw = "1q2w3e4r";
	
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(jdbcUrl,jdbcId,jdbcPw);
	
	String Query = "Select lecture_time, lecture_title, lecture_room from attendee LEFT JOIN lecture ON lecture_lecture_code = lecture_code where student_stu_code=?";
	pstmt = conn.prepareStatement(Query);
	pstmt.setInt(1, stu_code);
	rs1 = pstmt.executeQuery();

	while(rs1.next()) {
		String[] lectime = rs1.getString("lecture_time").split(",");
		
		for(int i = 1; i < 10; i++) {
			for(int j = 0; j < 5; j++) {
				String cltime1 = i + "A";
				String cltime1a = (char)(alpha+j) + cltime1;
				
				for(int k = 0; k < lectime.length; k++) {
					if(cltime1a.equals(lectime[k])) {
						tr_value1[i][j] = rs1.getString("lecture_title");
						tr_room1[i][j] = rs1.getString("lecture_room");
					}
				}
				if(tr_value1[i][j] == null) {
					tr_value1[i][j] = "";
					tr_room1[i][j] = "";
				}
			}
		}
		for(int i = 1; i < 10; i++) {
			for(int j = 0; j < 5; j++) {
				String cltime2 = i + "B";
				String cltime2a = (char)(alpha+j) + cltime2;
				
				for(int k = 0; k < lectime.length; k++) {
					if(cltime2a.equals(lectime[k])) {
						tr_value2[i][j] = rs1.getString("lecture_title");
						tr_room2[i][j] = rs1.getString("lecture_room");
					}
				}
				if(tr_value2[i][j] == null) {
					tr_value2[i][j] = "";
					tr_room2[i][j] = "";
				}
			}
		}
	}
	String Query1 = "Select * from student where stu_code=?";
	pstmt = conn.prepareStatement(Query1);
	pstmt.setInt(1, stu_code);
	rs3 = pstmt.executeQuery();
	rs3.next();%>
	
	[개인시간표조회]&nbsp;&nbsp;<%=stu_code%>&nbsp;<%=rs3.getString("stu_name")%>&nbsp;&nbsp;&nbsp;<input type="button" value="Print" onclick="window.print()"/><br>
	<table width = "760" border = "1" cellpadding = "0" cellspacing = "0" id ="sch">
	<tr height = "35" align = "center">
		<td width = "55">시간</td>
		<td width = "55">교시</td>
		<td width = "130">월</td>
		<td width = "130">화</td>
		<td width = "130">수</td>
		<td width = "130">목</td>
		<td width = "130">금</td>
	</tr>
	<%for(int i = 1; i < 10; i++) {%>
	<tr height = "30" align = "center">
		<td width = "55"><%=i+8%>:00</td>
		<td width = "55"><%=i%>A</td>
		<%for(int j = 0; j < 5; j++) {%>
		<td width = "130" class= "<%=tr_value1[i][j]%>">
		<%=tr_value1[i][j] + "<br>" + tr_room1[i][j]%></td><%
		}%></tr>
	<tr height = "30" align = "center">
		<td width = "55"><%=i+8%>:30</td>
		<td width = "55"><%=i%>B</td>
		<%for(int j = 0; j < 5; j++) {%>
		<td width = "130" class= "<%=tr_value2[i][j]%>">
		<%=tr_value2[i][j] + "<br>" + tr_room2[i][j]%></td><%
		}%></tr>
	<%}%></table><%
} catch(Exception e) {
	e.printStackTrace();
}
%>
</body>
</html>