package servletsUser;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.ChiTietHoaDon;
import beans.HoaDon;
import beans.commons;
import conn.DBConnection;
import utils.ChiTietHoaDonUtils;
import utils.HoaDonUtils;

/**
 * Servlet implementation class ChiTietDonHang
 */
@WebServlet("/ChiTietDonHang")
public class ChiTietDonHang extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChiTietDonHang() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (!servletsUser.common.preCheckLogin(request,response))
			return;
			
		Connection conn = null;
		try {
			conn = DBConnection.getConnection();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}	
		String maHD = request.getParameter("id");
		List<ChiTietHoaDon> list = null;
		try {
			// list = ChiTietHoaDonUtils.getChiTietHoaDonFromCart(conn);
			list=ChiTietHoaDonUtils.getChiTietHoaDonByMaHD(conn, maHD);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		
		HoaDon hd = new HoaDon();
		try {
			hd = HoaDonUtils.getHoaDonById(conn, maHD);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		servletsUser.common.setUpForHeader(conn, request, response);
		response.setContentType("text/html;charset=UTF-8");
		request.setAttribute("hoaDonMain",hd);
		request.setAttribute("chitiethoadonListMain", list);
        RequestDispatcher dispatcher = request.getServletContext()
                .getRequestDispatcher("/WEB-INF/views/allUser/pages/chitietdonhang.jsp");
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
