package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.User;
import beans.commonBeans;
import conn.DBConnection;
import servletsUser.commonServlets;
import utils.userUtils;

/**
 * Servlet implementation class SignUp
 */
@WebServlet(name = "/SignUp", urlPatterns = { "/SignUp" })
public class SignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SignUp() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String error = null;
		User user = null;
		boolean hasError = false;
		String tenDangNhap = request.getParameter("Username");
		String matKhau = request.getParameter("Password");

		String hoTen;
		java.sql.Date NgaySinh;
		String diaChi;
// check name
		if (request.getParameter("Name") == null) {
			hoTen = "";
		} else {
			hoTen = new String(request.getParameter("Name").getBytes("ISO-8859-1"), "UTF-8");
		}
// check birthday
		if (request.getParameter("Birthday") == null) {
			NgaySinh = null;
		} else {
			NgaySinh = commonBeans.ConvertStringToSQLDate(request.getParameter("Birthday"));
		}
// check address
		if (request.getParameter("Address") == null) {
			diaChi = "";
		} else {
			diaChi = new String(request.getParameter("Address").getBytes("ISO-8859-1"), "UTF-8");
		}

		try {
			user = new User(tenDangNhap, tenDangNhap, matKhau, hoTen, NgaySinh, diaChi, "001");
		} catch (ParseException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		Connection conn = null;
		try {
			conn = DBConnection.getConnection();
		} catch (SQLException e1) {
			e1.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			userUtils.insertUser(conn, user);

		} catch (SQLException e) {
			hasError = true;
			error = commonServlets.filterErrorFromDatabase(e.getMessage());

		}
		if (!hasError) {
			error = "Tạo tài khoản thành công";
		}
		request.setAttribute("notification", error);
		RequestDispatcher dispatcher = request.getServletContext()
				.getRequestDispatcher("/WEB-INF/views/allUser/pages/login.jsp");
		dispatcher.forward(request, response);

	}

}
