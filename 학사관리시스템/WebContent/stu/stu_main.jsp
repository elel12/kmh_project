<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*"  %>
<%@ page import="java.io.*"  %>
<%request.setCharacterEncoding("euc-kr"); %>
<%
	String code = (String) session.getAttribute("stu_code");
	if(code!=null){
		int stu_code=Integer.parseInt(code);
		Statement stmt= null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		
		try{
			String jdbcUrl = "jdbc:mysql://localhost:3306/capstone";
			String jdbcId = "manager";
			String jdbcPw = "1q2w3e4r";
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(jdbcUrl,jdbcId,jdbcPw);
			
			
			String Query,Query2;
			
			Query = "SELECT * FROM student where stu_code=?";
			pstmt = conn.prepareStatement(Query);
			pstmt.setInt(1,stu_code);
				
			rs = pstmt.executeQuery();
			rs.next();
			Query = "SELECT * FROM major where major_code=?";
			pstmt = conn.prepareStatement(Query);
			pstmt.setInt(1,rs.getInt("professor_major_major_code"));
				
			rs2 = pstmt.executeQuery();
			rs2.next();
		}
		catch (SQLException e) {
			out.print(e);
		}
	%>
	<!DOCTYPE html>
	<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
	<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
	<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
	<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
		<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>종합정보시스템</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="Free HTML5 Website Template by FreeHTML5.co" />
		<meta name="keywords" content="free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
		<meta name="author" content="FreeHTML5.co" />
	
	  <!-- 
		//////////////////////////////////////////////////////
	
		FREE HTML5 TEMPLATE 
		DESIGNED & DEVELOPED by FreeHTML5.co
			
		Website: 		http://freehtml5.co/
		Email: 			info@freehtml5.co
		Twitter: 		http://twitter.com/fh5co
		Facebook: 		https://www.facebook.com/fh5co
	
		//////////////////////////////////////////////////////
		 -->
	
	  	<!-- Facebook and Twitter integration -->
		<meta property="og:title" content=""/>
		<meta property="og:image" content=""/>
		<meta property="og:url" content=""/>
		<meta property="og:site_name" content=""/>
		<meta property="og:description" content=""/>
		<meta name="twitter:title" content="" />
		<meta name="twitter:image" content="" />
		<meta name="twitter:url" content="" />
		<meta name="twitter:card" content="" />
	
		<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
		<link rel="shortcut icon" href="favicon.ico">
	
		<link href='https://fonts.googleapis.com/css?family=Roboto:400,300,600,400italic,700' rel='stylesheet' type='text/css'>
		<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
		
		<!-- Animate.css -->
		<link rel="stylesheet" href="css/animate.css">
		<!-- Icomoon Icon Fonts-->
		<link rel="stylesheet" href="css/icomoon.css">
		<!-- Bootstrap  -->
		<link rel="stylesheet" href="css/bootstrap.css">
		<!-- Owl Carousel -->
		<link rel="stylesheet" href="css/owl.carousel.min.css">
		<link rel="stylesheet" href="css/owl.theme.default.min.css">
		<!-- Theme style  -->
		<link rel="stylesheet" href="css/style.css">
	
		<!-- Modernizr JS -->
		<script src="js/modernizr-2.6.2.min.js"></script>
		<!-- FOR IE9 below -->
		<!--[if lt IE 9]>
		<script src="js/respond.min.js"></script>
		<![endif]-->
	
		</head>
		<body>
		<div id="fh5co-page">
			<a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle"><i></i></a>
			<aside id="fh5co-aside" role="complementary" class="border js-fullheight">
	
				<h1 id="fh5co-logo"><a href="stu_main.jsp"><img src="images/a.png"></a></h1>
				<nav id="fh5co-main-menu" role="navigation">
					<ul>
						<li class="fh5co-active"><a href="stu_main.jsp">&nbsp;&nbsp;홈&nbsp;&nbsp;</a></li>
						<FONT style="color:black;font-weight: bold;font-size: 1.5em;">학적</FONT>
						<li><a href="stu_profile.jsp">신상정보</a></li>
						<li><a href="stu_counseling.jsp">상담이력조회</a></li>
						<li><a href="stu_grade.jsp">성적조회</a></li>
						<FONT style="color:black;font-weight: bold;font-size: 1.5em;">수업</FONT>
						<li><a href="stu_lecture.jsp">강좌현황</a></li>
						<li><a href="stu_attendee.jsp">수강신청</a></li>
						<li><a href="stu_attendee_grade.jsp">당해학기성적조회</a></li>
					</ul>
				</nav>
	
				<div class="fh5co-footer">
					<p>
						<small>이름 : <%=rs.getString("stu_name") %></span> 
						<span>학과 : <%=rs2.getString("major_name") %></span> 
						<span>학년 : <%=rs.getInt("stu_level") %>학년</span></small>
						<A HREF="../logout.jsp">로그아웃</A>
					</p>
				</div>
	
			</aside>
	
			<div id="fh5co-main">
	<br><br>
				<iframe width="100%" height="675" src="../url.jsp" name="main_stu" id="main_stu" scrolling="no" frameborder="0">이 브라우저는 iFram을 원합ㅈ멜'</iframe>
				
				
	
			</div>
		</div>
	
		<!-- jQuery -->
		<script src="js/jquery.min.js"></script>
		<!-- jQuery Easing -->
		<script src="js/jquery.easing.1.3.js"></script>
		<!-- Bootstrap -->
		<script src="js/bootstrap.min.js"></script>
		<!-- Carousel -->
		<script src="js/owl.carousel.min.js"></script>
		<!-- Stellar -->
		<script src="js/jquery.stellar.min.js"></script>
		<!-- Waypoints -->
		<script src="js/jquery.waypoints.min.js"></script>
		<!-- Counters -->
		<script src="js/jquery.countTo.js"></script>
		
		
		<!-- MAIN JS -->
		<script src="js/main.js"></script>
	
		</body>
	</html>
<%}else{
	out.println("<script>location.href=\"../login.jsp\"</script>");
}
	%>

