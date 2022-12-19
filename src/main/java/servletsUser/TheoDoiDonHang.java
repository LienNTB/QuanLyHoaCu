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

import beans.HoaDon;
import beans.LoaiSanPham;
import beans.commons;
import conn.DBConnection;
import utils.HoaDonUtils;
import utils.LoaiSanPhamUtils;

/**
 * Servlet implementation class TheoDoiDonHang
 */
@WebServlet("/TheoDoiDonHang")
public class TheoDoiDonHang extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TheoDoiDonHang() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (!servletsUser.common.preCheckLogin(request,response))
			return;
		Connection conn=null;
		try {
			conn = DBConnection.getConnection();
		}
		catch (SQLException | ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		List <HoaDon> list = null;;
		String mode=request.getParameter("mode");
		if (mode==null)
		{
			mode="tatca";
		}
		try
		{
			list = HoaDonUtils.getHoaDonByIdMaKH(conn, commons.mainUser.getMaNguoiDung());
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		request.setAttribute("mode",mode);
		request.setAttribute("hoadonList", list);
		response.setContentType("text/html;charset=UTF-8");
		servletsUser.common.setUpForHeader(conn,request,response);
        RequestDispatcher dispatcher = request.getServletContext()
                .getRequestDispatcher("/WEB-INF/views/allUser/pages/theodoidonhang.jsp");
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
