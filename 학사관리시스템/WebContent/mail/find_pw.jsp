<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="euc_kr">
<title>Insert title here</title>
</head>
<body>
	<div style="text-align:center">
		<h1>��й�ȣã��</h1>
		<form action="sendMail.jsp" method="post">
			<TABLE width=370 ALIGN=CENTER>
				<tr><td>�й�/��������ȣ</td><td><input type="text" name="id" /></td></tr>
				<tr><td>�̸�</td><td><input type="text" name="name" /></td></tr>
				<tr><td>�������</td><td><input type="text" name="birth" /></td></tr>
				<tr><td colspan="2" style="text-align:center;"><input type="submit" value="ã��"/></td></tr>
			</table>
		</form>
	</div>
</body>
</html>