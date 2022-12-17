package servletsUser;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

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
import utils.SanPhamUtils;
import beans.SanPham;

/**
 * Servlet implementation class AddToCart
 */
@WebServlet("/AddToCart")
public class AddToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddToCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if (!commons.isLogin())
		{
			System.out.print("Không ổn nữa rồi Đại vương");
			response.sendRedirect(request.getContextPath()+"/Login");
			return;
		}
		Connection conn=null;
		String maHD="cart_"+commons.mainUser.getMaNguoiDung();
		String maSP=request.getParameter("id");
		int soLuong=Integer.parseInt(request.getParameter("number"));
		try
		{
			conn=DBConnection.getConnection();
			// SanPhamUtils.AddToCart(conn, maSP, soLuong);
		}
		catch (SQLException | ClassNotFoundException e)
		{
			e.printStackTrace();
			response.sendRedirect(request.getContextPath()+"/SanPham?id="+maSP);
			return;
		}
		// tạo Chi Tiết Hóa Đơn
		ChiTietHoaDon cthd=null;
		SanPham sp=null;
		// kiểm tra xem sản phẩm đã có trong cart chưa
		
		try {
            cthd=ChiTietHoaDonUtils.getChiTietHoaDonByMaHDMaSP(conn,maHD, maSP);
			sp=SanPhamUtils.GetSanPhamById(conn,maSP);
			
		}
		catch (SQLException e) {
            e.printStackTrace();
        }
		///nếu sản phẩm không có thì quay lại trang chủ
		if(sp==null)
        {
            response.sendRedirect(request.getContextPath()+"/defaultHomePage");
            return;
        }
		//// nếu sản phẩm chưa có trong cart thì thêm vào cart
		if (cthd==null)
		{
			cthd=new ChiTietHoaDon (maHD, maSP, soLuong, soLuong*sp.getGia());
			try
			{
				ChiTietHoaDonUtils.insertChiTietHoaDon(conn,cthd);
			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
		}
		else //nếu đã có trong cart thì cập nhật số lượnng
		{
			cthd.setSoLuong(cthd.getSoLuong()+soLuong);
			cthd.setTongPhu(cthd.getSoLuong()*sp.getGia());
			try {
				ChiTietHoaDonUtils.updateChiTietHoaDon(conn,cthd);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		response.sendRedirect(request.getContextPath()+"/Cart_HasProduct");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
