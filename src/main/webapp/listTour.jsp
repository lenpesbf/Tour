<%@page import="model.*"%>
<%@page import="services.*"%>
<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List Tour</title>
<style>
    body {
        font-family: Arial, sans-serif;
    }

    h3 {
        color: #333;
    }

    table {
        width: 100%;
        border-collapse: collapse;
    }

    th, td {
        padding: 10px;
        text-align: center;
        border: 1px solid #ddd;
    }
    th {
        background-color: #f4f4f4;
        color: #333;
    }

    tr:nth-child(even) {
        background-color: #e7f3fe;
    }

    tr:nth-child(odd) {
        background-color: #ccf0e1;
    }

    a {
        color: #1a73e8;
        font-weight: bold;
        text-decoration: none;
    }

    a:hover {
        text-decoration: underline;
    }

    .btn-book {
        background-color: #4CAF50;
        color: white;
        padding: 5px 10px;
        border: none;
        cursor: pointer;
        font-size: 14px;
        border-radius: 5px;
        transition: background-color 0.3s ease;
    }

    .btn-book:hover {
        background-color: #45a049;
    }
</style>
</head>
<body>

    <h3>Các chương trình du lịch</h3>
    <table>
        <tr>
            <th>Chương trình</th>
            <th>Lịch khởi hành</th>
            <th>Giá</th>
            <th>Đặt</th>
        </tr>
        <c:forEach var="t" items="${listTour}">
            <tr>
                <td>
                    <a href="tourDetail?tourId=${t.id}">${t.description}</a><br>
                    ${t.days}
                </td>
                <td>${t.departureSchedule}</td>
                <td>${t.price}</td>
                <td><a href = "bookingTour?tourId=${t.id}"><button type="button" class="btn-book">Đặt tour</button></a></td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
