<%@ page import="javax.mail.Transport"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*"%>
<%@ page import = "java.text.SimpleDateFormat"%>
<%@ page import = "java.net.URLEncoder"%>
<%@ page import = "java.util.*, java.io.*, javax.mail.*"%>
<% request.setCharacterEncoding("euc-kr"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<center>
			<form action = "insertmail.jsp" method = "post">
			<table width = "400" border = "1" cellpadding = "0" cellspacing = "0">
				<tr height = "30">
					<td width = "150">���̵�</td>
					<td width = "250">
						<input type = "text" name = "id" placeholder = "�л�  : �й� / ������  : ��������ȣ">
					</td>
				</tr>
			
				<tr height = "30">
					<td width = "150">�̸�</td>
					<td width = "250">
						<input type = "text" name = "name">
					</td>
				</tr>
				
				<tr height = "30">
					<td width = "100">�̸��� �Է�</td>
					<td width = "300">
						<input type = "email" name = "mail">
					</td>
				</tr>
				
				<tr height = "30">
					<td colspan = "2" align = "center">
					<input type = "submit" name = "mailadd" value = "�Է�">
				</td>
			</table>
			</form>
	</center>
</body>
</html>