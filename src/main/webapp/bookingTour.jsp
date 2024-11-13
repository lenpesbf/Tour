<%@page import="services.*"%>
<%@page import="model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Booking</title>
<style>
body {
	font-family: Arial, sans-serif;
}

h2 {
	font-size: 22px;
	font-weight: bold;
	color: #333;
	text-align: center;
}

h3 {
	font-size: 18px;
	font-weight: bold;
	color: #333;
	margin-top: 20px;
}

form {
	max-width: 500px;
	margin: 0 auto;
	padding: 20px;
	border: 1px solid #ddd;
	border-radius: 5px;
	background-color: #f9f9f9;
}

.form-group {
	display: flex;
	align-items: center;
	margin-bottom: 10px;
}

.form-group label {
	width: 150px;
	font-weight: bold;
	font-size: 14px;
	color: #333;
}

.form-group input[type="text"], .form-group input[type="number"],
	.form-group input[type="date"] {
	width: calc(100% - 160px);
	padding: 5px;
	border: 1px solid #ccc;
	border-radius: 3px;
	font-size: 14px;
}

.note {
	font-size: 12px;
	color: #666;
	margin-left: 5px;
}

.buttons {
	text-align: center;
	margin-top: 20px;
}

.buttons button {
	width: 80px;
	padding: 8px;
	font-size: 14px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	margin: 0 10px;
}

.buttons button[type="submit"] {
	background-color: #4CAF50;
	color: white;
}

.buttons button[type="reset"] {
	background-color: #f44336;
	color: white;
}
</style>
</head>
<body>
	<%
	String tourIdParam = request.getParameter("tourId");
	Long itemId = Long.parseLong(tourIdParam);

	Tour tour = TourDatabase.getInstance().getTourById(itemId);
	session.setAttribute("tourBooking", tour);
	%>
	<h2>
		Đặt tour: <span style="font-weight: bold;">${tourBooking.description}</span>
		${tourBooking.days}
	</h2>
	<form action="booking" method="POST">
		<h3>Thông tin khách hàng</h3>
		<div class="form-group">
			<label for="username">Họ Tên: (*)</label> <input type="text"
				required="required" name="username" id="username">
		</div>
		<div class="form-group">
			<label for="address">Địa chỉ:</label> <input type="text"
				name="address" id="address">
		</div>
		<div class="form-group">
			<label for="email">Email: (*)</label> <input type="text"
				required="required" name="email" id="email">
		</div>
		<div class="form-group">
			<label for="phone">Điện thoại:</label> <input type="number"
				name="phone" id="phone">
		</div>

		<h3>Thông tin chuyến đi:</h3>
		<div class="form-group">
			<label for="day">Ngày khởi hành: (*)</label> <input type="text"
				required="required" name="day" id="day" placeholder="dd/mm/yyyy">
			<span class="note">dd/mm/yyyy</span>
		</div>
		<div class="form-group">
			<label for="adult">Số người lớn: (*)</label> <input type="number"
				required="required" name="adult" id="adult">
		</div>
		<div class="form-group">
			<label for="child">Số trẻ em:</label> <input type="number"
				name="child" id="child">
		</div>
		<div class="buttons">
			<button type="submit" name="action" value="submit">Gửi</button>
			<button type="submit" name="action" value="back">Hủy</button>
		</div>
	</form>

	
</body>
</html>
