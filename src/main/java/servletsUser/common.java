package servletsUser;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.ChiTietHoaDon;
import beans.HoaDon;
import beans.LoaiSanPham;
import beans.commons;
import conn.DBConnection;
import utils.ChiTietHoaDonUtils;
import utils.HoaDonUtils;
import utils.LoaiSanPhamUtils;

/**
 * Servlet implementation class common
 */
public class common extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public common() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	public static void setUpForHeader(Connection conn, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<LoaiSanPham> lsp=null;
		List<ChiTietHoaDon> cart=new ArrayList<ChiTietHoaDon>();
		List<HoaDon> order=new ArrayList<HoaDon>();
		try{
			lsp = LoaiSanPhamUtils.getListLoaiSanPham(conn);
			if (beans.commons.isLogin())
			{
				cart=ChiTietHoaDonUtils.getChiTietHoaDonByMaHD(conn, "cart_"+commons.mainUser.getMaNguoiDung());
				order= HoaDonUtils.getHoaDonByIdMaKH(conn, commons.mainUser.getMaNguoiDung());
			}
			
		}
		catch(SQLException e){
            e.printStackTrace();
        }
		request.setAttribute("loaiSanPham", lsp);
		request.setAttribute("hoaDon", order);
		request.setAttribute("gioHang", cart);
		request.setAttribute("userID", commons.mainUser.getMaNguoiDung());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	public static boolean preCheckLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		// TODO Auto-generated method stub
		if (!beans.commons.isLogin())
		{
			System.out.print("Nó chưa đăng nhập, Đại vương ơi!");
			response.sendRedirect(request.getContextPath()+"/Login");
			return false;
		}
		return true;
	}
	
	
}
