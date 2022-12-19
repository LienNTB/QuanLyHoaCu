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
		if (!commons.isLogin())
		{
			System.out.print("Không ổn nữa rồi Đại vương");
			response.sendRedirect(request.getContextPath()+"/Login");
			return;
		}
			
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
		servletsUser.common.setUpForHeader(conn, request, response);
		
		HoaDon hd = new HoaDon();
		try {
			hd = HoaDonUtils.getHoaDonById(conn, maHD);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String hoten = hd.getHoten();
		String diachi = hd.getDiaChiGiaoHang();
		String sdt = hd.getSoDienThoai();
		int tongtien = hd.getTongThanhToan();
		// set attribute
		request.setAttribute("chitiethoadonList", list);
		request.setAttribute("hoten",hoten);
		request.setAttribute("diachi",diachi);
		request.setAttribute("sdt",sdt);
		request.setAttribute("tongtien",tongtien);
		response.setContentType("text/html;charset=UTF-8");
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
