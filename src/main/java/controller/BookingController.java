package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Booking;
import model.Customer;
import model.Tour;
import services.TourDatabase;
import services.TourService;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Servlet implementation class booking
 */
@WebServlet("/booking")
public class BookingController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public BookingController() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");

			// Xử lý khi người dùng nhấn "Gửi"
			String fullname = request.getParameter("username");
			String address = request.getParameter("address");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String dayString = request.getParameter("day");
			int adult = Integer.parseInt(request.getParameter("adult"));
			int child = Integer.parseInt(request.getParameter("child") != null ? request.getParameter("child") : "0");

			SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
			Date departureDate = null;
			try {
				departureDate = sdf.parse(dayString);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// Tạo đối tượng Customer và Booking
			Customer customer = new Customer(fullname, address, email, phone);
			HttpSession session = request.getSession();
			Tour tour = (Tour) session.getAttribute("tourBooking");
			Booking booking = new Booking(customer, departureDate, adult, child, tour);

			// Lưu booking vào cơ sở dữ liệu
			TourDatabase.getInstance().addBooking(booking);
			TourDatabase.getInstance().printBooking();
			// Chuyển tiếp đến trang xác nhận
			session.setAttribute("customer", customer);
			session.setAttribute("booking", booking);
			request.getRequestDispatcher("confirm.jsp").forward(request, response);
		
	}
}
