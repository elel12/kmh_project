<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<HTML>
<HEAD>
<META http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<TITLE>Insert title here</TITLE>
</HEAD>

 <BODY>
 <%

 Connection conn = null;

 try {

 Class.forName("com.mysql.jdbc.Driver"); 
 String jdbcUrl = "jdbc:mysql://localhost:3306/capstone";
 String jdbcId = "manager";
 String jdbcPw = "1q2w3e4r";

 conn = DriverManager.getConnection(jdbcUrl, jdbcId, jdbcPw); 
 out.println("�����ͺ��̽� ���� ����");
 
 } catch(SQLException e){

 out.println("�����ͺ��̽� ���� ����");
 e.printStackTrace();

 }finally {
 conn.close();
 }

 %>
 </BODY>

 </HTML>