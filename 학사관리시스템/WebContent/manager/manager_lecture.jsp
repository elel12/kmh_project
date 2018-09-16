<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*"  %>
<%@ page import="java.io.*"  %>
<%request.setCharacterEncoding("euc-kr"); %>
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
	
				<h1 id="fh5co-logo"><a href="manager_main.jsp"><img src="images/a.png"></a></h1>
				<nav id="fh5co-main-menu" role="navigation">
					<ul>
						<li><a href="manager_main.jsp">&nbsp;&nbsp;홈&nbsp;&nbsp;</a></li>
						<FONT style="color:black;font-weight: bold;font-size: 1.5em;">계정</FONT>
						<li><a href="manager_stu_profile.jsp">학생계정</a></li>
						<li><a href="manager_pro_profile.jsp">교직원계정</a></li>
						<FONT style="color:black;font-weight: bold;font-size: 1.5em;">강의</FONT>
						<li class="fh5co-active"><a href="manager_lecture.jsp">강의개설</a></li>
					</ul>
				</nav>
	
				<div class="fh5co-footer">
					<p>
						<small>관리자</small> 
						<A HREF="../logout.jsp"></br>로그아웃</A>
					</p>
				</div>
	
			</aside>
	
			<div id="fh5co-main">
	<br><br>
				<iframe width="100%" height="675" src="lecture_list.jsp" name="main_stu" id="main_stu" scrolling="no" frameborder="0">이 브라우저는 iFram을 원합ㅈ멜'</iframe>
				
				
	
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


