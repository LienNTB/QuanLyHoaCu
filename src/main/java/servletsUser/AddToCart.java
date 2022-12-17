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
import beans.commons;
import conn.DBConnection;
import utils.ChiTietHoaDonUtils;
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
		ChiTietHoaDon cthd=null;
		SanPham sanpham=null;
		String maSP=request.getParameter("id");
		String userID = commons.mainUser.getMaNguoiDung();
		int soLuong=Integer.parseInt(request.getParameter("number"));
		try
		{
			conn=DBConnection.getConnection();
			SanPhamUtils.AddSanPhamToCart(conn, maSP, soLuong);
		}
		catch (SQLException | ClassNotFoundException e)
		{
			e.printStackTrace();
			response.sendRedirect(request.getContextPath()+"/SanPham?id="+maSP);
			return;
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
