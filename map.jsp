<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ include file="config.jsp" %>
<%

Object user_id = session.getAttribute("user_id");
if (user_id == null) {
	response.sendRedirect("login.jsp");
}

Connection connect = null;
Statement statement = null;

try {
	Class.forName("com.mysql.jdbc.Driver");
	connect =  DriverManager.getConnection("jdbc:mysql://" + mysql_host + "/" + mysql_db + "" +"?user=" + mysql_username + "&password=" + mysql_password);
	statement = connect.createStatement();
	ResultSet user_data = statement.executeQuery("SELECT * FROM `users` WHERE `id` = '" + user_id.toString() + "';");
	if (!user_data.next()) {
		session.removeAttribute("user_id");
		response.sendRedirect("login.jsp");
	}
}  catch (Exception e) {
	out.println(e.getMessage());
	e.printStackTrace();
}
try {
	if (statement != null){
		statement.close();
		connect.close();
	}
} catch (SQLException e) {
}

%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>แผนที่</title>
	<link href="assets/css/bootstrap.min.css" rel="stylesheet">
	<link href="assets/css/offcanvas.css" rel="stylesheet">
	<link href="assets/css/style.css" rel="stylesheet">
	<script defer src="assets/js/all.js"></script>
</head>

<body class="bg-secondary">
	<nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand mb-0 h1" href="#">JSP Final</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item">
						<a class="nav-link" href="home.jsp"><i class="fas fa-home"></i>&nbsp; หน้าหลัก</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="data.jsp"><i class="fas fa-list"></i>&nbsp; รายชื่อผู้ใช้</a>
					</li>
					<li class="nav-item active">
						<a class="nav-link" href="#"><i class="fas fa-map-marked-alt"></i>&nbsp; แผนที่</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="about.jsp"><i class="fas fa-id-card"></i>&nbsp; ผู้จัดทำ</a>
					</li>
				</ul>
				<ul class="navbar-nav ml-auto">
					<li class="nav-item">
						<a class="nav-link" href="logout.jsp"><i class="fas fa-sign-out-alt"></i>&nbsp; ออกจากระบบ</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<main role="main" class="container">
		<h2 class="pt-1 pb-2"><i class="fas fa-map-marked-alt"></i>&nbsp; โรงพยาบาล</h2>
		<div class="bg-white rounded shadow map-container" style="height: 550px">
			<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3961.177867255407!2d101.24673881466579!3d6.869278895035988!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31b3040171811205%3A0x8343160fa8201e78!2sPattani%20Hospital!5e0!3m2!1sen!2sth!4v1568970070948!5m2!1sen!2sth" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen=""></iframe>
	</main>
	<p class="mt-4 small text-muted text-center">&copy; 2019 Likecyber</p>
	<script defer src="assets/js/jquery-3.4.1.min.js"></script>
	<script defer src="assets/js/bootstrap.min.js"></script>
</body>

</html>
