package servletsAdmin;
import java.io.*;
import java.util.*;
import javax.servlet.*;
import java.text.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.User;
import beans.commons;
import conn.DBConnection;
import utils.HoaDonUtils;
import utils.SanPhamUtils;

/**
 * Servlet implementation class Admin_HomePage
 */
@WebServlet("/Admin_HomePage")
public class Admin_HomePage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admin_HomePage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn=null;
		try{
			conn=DBConnection.getConnection();
		}
		catch (SQLException | ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		response.setContentType("text/html;charset=UTF-8");
		if (!commons.checkAdmin()) 
		{
			response.sendRedirect(request.getContextPath()+"/NotAllow");
			return;
		}
		var today = new Date();
		var dateMonth = today.getMonth();
		var date = new Date(System.currentTimeMillis());
		System.out.print(date);
		request.setAttribute("dateTimeNow", date);
		request.setAttribute("month", dateMonth);
		
		int tongHoaDon = 0;
		int tongSanPham = 0;
		int tongDoanhThu = 0;
		try {
			tongHoaDon = HoaDonUtils.getTongSoHoaDon(conn);
			tongSanPham = SanPhamUtils.getTongSoSanPham(conn);
			tongDoanhThu = HoaDonUtils.getTongDoanhThu(conn);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("tongHoaDon",tongHoaDon);
		request.setAttribute("tongSanPham",tongSanPham);
		request.setAttribute("tongDoanhThu",tongDoanhThu);
	        RequestDispatcher dispatcher = request.getServletContext()
	                .getRequestDispatcher("/WEB-INF/views/admin/pages/homepage.jsp");
	        dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
