<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%
    	session.invalidate();
    	out.println("<script>location.href=\"login.jsp\"</script>");
    %>