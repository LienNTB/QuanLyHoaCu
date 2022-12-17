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
import beans.LoaiSanPham;
import beans.commons;
import utils.ChiTietHoaDonUtils;
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
		try{
			lsp = LoaiSanPhamUtils.getListLoaiSanPham(conn);
			if (beans.commons.isLogin())
			{
				cart=ChiTietHoaDonUtils.getChiTietHoaDonByMaHD(conn, "cart_"+commons.mainUser.getMaNguoiDung());
			}
			
		}
		catch(SQLException e){
            e.printStackTrace();
        }
		request.setAttribute("loaiSanPham", lsp);
		request.setAttribute("gioHang", cart);
		request.setAttribute("nav_active", "HomePage");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	
}
