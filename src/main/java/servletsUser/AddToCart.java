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
		int soLuong=1;
		try
		{
			conn=DBConnection.getConnection();
		}
		catch (SQLException | ClassNotFoundException e)
		{
			e.printStackTrace();
			response.sendRedirect(request.getContextPath()+"/SanPham?id="+maSP);
			return;
		}
		
		try{
			soLuong=Integer.parseInt(request.getParameter("number"));
			
		}
		catch(Exception e){
           e.printStackTrace();
		   response.sendRedirect(request.getContextPath()+"/SanPham?id="+maSP);
           return;
		}
		
		try
		{
			cthd=ChiTietHoaDonUtils.getChiTietHoaDonByMaHDMaSP(conn, "cart_"+commons.mainUser.getMaNguoiDung(),maSP);
			sanpham=SanPhamUtils.GetSanPhamById(conn,maSP);
			sanpham.OutPrint();
		}
		catch(SQLException esql) {
			esql.printStackTrace();
		}

		if (sanpham==null)
		{
			response.sendRedirect(request.getContextPath()+"/Login");
			return;
		}
		if (cthd!=null)
		{
			cthd.setSoLuong(cthd.getSoLuong()+soLuong);
			cthd.setTongPhu(cthd.getSoLuong()*((beans.SanPham) sanpham).getGia());
			try{
				
				ChiTietHoaDonUtils.updateChiTietHoaDon(conn,cthd);
			}
			catch(SQLException esql){
                esql.printStackTrace();
			}
		}
		else
		{

			cthd=new ChiTietHoaDon("cart_"+commons.mainUser.getMaNguoiDung(),maSP, soLuong, soLuong*sanpham.getGia());
			try{
				ChiTietHoaDonUtils.insertChiTietHoaDon(conn,cthd);
			}
			catch (SQLException esql)
			{
				esql.printStackTrace();
				response.sendRedirect(request.getContextPath()+"/SanPham?id="+maSP);
				return;
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
