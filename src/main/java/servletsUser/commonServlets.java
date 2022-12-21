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
import beans.commonBeans;
import conn.DBConnection;
import utils.ChiTietHoaDonUtils;
import utils.HoaDonUtils;
import utils.LoaiSanPhamUtils;

/**
 * Servlet implementation class common
 */
public class commonServlets extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public commonServlets() {
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
			lsp = LoaiSanPhamUtils.getListLoaiSanPhamByDeletedStatus(conn,false);
			if (beans.commonBeans.isLogin())
			{
				cart=ChiTietHoaDonUtils.getChiTietHoaDonByMaHD(conn, "cart_"+commonBeans.mainUser.getMaNguoiDung());
				order= HoaDonUtils.getHoaDonByIdMaKH(conn, commonBeans.mainUser.getMaNguoiDung());
				request.setAttribute("userID", commonBeans.mainUser.getMaNguoiDung());
			}
			
		}
		catch(SQLException e){
            e.printStackTrace();
        }
		request.setAttribute("loaiSanPham", lsp);
		request.setAttribute("hoaDon", order);
		request.setAttribute("gioHang", cart);
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
		if (!beans.commonBeans.isLogin())
		{
			System.out.print("Nó chưa đăng nhập, Đại vương ơi!");
			response.sendRedirect(request.getContextPath()+"/Login");
			return false;
		}
		return true;
	}
	public static String filterErrorFromDatabase(String error)
	{

		if (error.contains("Cannot insert duplicate key in object 'dbo.NguoiDung'"))
			return "Tên đăng nhập đã tồn tại!";
		else if (error.contains("Cannot insert duplicate key in object 'dbo.SanPham'"))
			return "Mã sản phẩm đã tồn tại đã tồn tại!";
		else if (error.contains("Cannot insert duplicate key in object 'dbo.LoaiSanPham'"))
			return "Mã loại sản phẩm đã tồn tại đã tồn tại!";
		return "Chưa filter: "+error;
	}
	
	
}
