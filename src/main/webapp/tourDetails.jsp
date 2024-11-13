<%@page import="model.*"%>
<%@page import="services.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Detail Of Tour</title>
<style>
    body {
        font-family: Arial, sans-serif;
    }

    h3 {
        color: #1a73e8;
        font-size: 24px;
        font-weight: bold;
    }

    h4 {
        font-size: 18px;
        color: #333;
    }

    h4 span {
        font-weight: normal;
    }

    h2 {
        font-size: 20px;
        color: #333;
        margin-top: 20px;
    }

    .tour-details {
        margin-bottom: 15px;
    }

    .program-details {
        margin-top: 10px;
        line-height: 1.6;
    }

    .btn-book {
        background-color: #4CAF50;
        color: white;
        padding: 8px 16px;
        border: none;
        cursor: pointer;
        font-size: 14px;
        border-radius: 5px;
        transition: background-color 0.3s ease;
        text-align: center;
        margin-top: 10px;
        display: inline-block;
        text-decoration: none;
    }

    .btn-book:hover {
        background-color: #45a049;
    }

    .tour-link {
        color: #1a73e8;
        font-weight: bold;
        text-decoration: none;
        margin-left: 10px;
    }

    .tour-link:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>
    <%
        String tourIdParam = request.getParameter("tourId");
        Long itemId = Long.parseLong(tourIdParam);

        Tour tour = TourDatabase.getInstance().getTourById(itemId);
        request.setAttribute("tour", tour);
    %>

    <h3>${tour.description}</h3>
    <h4 class="tour-details">
        Số ngày: <span>${tour.days}</span>, 
        Phương tiện: <span>${tour.transportation}</span>, 
        Lịch khởi hành: <span>${tour.departureSchedule}</span>
    </h4>

    <h2>Chương trình chi tiết: </h2>
    <div class="program-details">
        ${tour.details}
    </div>
    
    <a href = "bookingTour.jsp?tourId=${tour.id}"><button type="button" class="btn-book">Đặt tour</button></a> 
    <a href="listTour.jsp" class="tour-link">CHƯƠNG TRÌNH TOUR</a>
</body>
</html>
