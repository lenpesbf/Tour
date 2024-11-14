<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Confirm Booking</title>
</head>
<body>

	<h2>Xác nhận đặt tour</h2>

	<h3>Thông tin khách hàng</h3>
	<p>Họ tên: ${customer.name}</p>
	<p>Địa chỉ: ${customer.address}</p>
	<p>Email: ${customer.email}</p>
	<p>Điện thoại: ${customer.phone}</p>

	<h3>Thông tin chuyến đi</h3>
	<p>Tour: ${booking.tour.description}</p>
	<p>Ngày khởi hành: ${booking.departureDate}</p>
	<p>Số người lớn: ${booking.noAdults}</p>
	<p>Số trẻ em: ${booking.noChildren}</p>

	<form action="confirmBooking" method="POST">
		<button type="submit">Xác nhận</button>
	</form>

	<a href = "listTour"><button type="submit">Quay lại danh sách tours</button></a>


</body>
</html>
