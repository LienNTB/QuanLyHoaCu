package servletsAdmin;



import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.commons;
import conn.DBConnection;
import utils.HoaDonUtils;
import utils.LoaiSanPhamUtils;
import utils.SanPhamUtils;
import utils.userUtils;
/**
 * Servlet implementation class DeleteSanPham
 */
@WebServlet(name="/ChangDeleteStatus",urlPatterns= {"/ChangDeleteStatus"})
public class ChangDeleteStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangDeleteStatus() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if (!commons.checkAdmin()) 
		{
			response.sendRedirect(request.getContextPath()+"/NotAllow");
			return;
		}
		Connection connection =null;
		String errorString =null;
		try{
            connection = DBConnection.getConnection();
		}
		catch(SQLException | ClassNotFoundException e){
			e.printStackTrace();
            // TODO: handle exception
        }
		String object=request.getParameter("object");
		String id= request.getParameter("id");
		String mode=request.getParameter("mode");
		
		
		try
		{
			if (object.equals("sanpham"))
				if (mode.equals("true"))// Nếu chưa xóa thì xóa
					SanPhamUtils.unDeleteSanPham(connection,id);
				else
					SanPhamUtils.DeleteSanPham(connection,id);
			else if (object.equals("loaisanpham"))
				if (mode.equals("true"))// Nếu chưa xóa thì xóa
					LoaiSanPhamUtils.undeleteLoaiSanPham(connection,id);
				else
					LoaiSanPhamUtils.deleteLoaiSanPham(connection,id);
			else if (object.equals("nguoidung"))
				if (mode.equals("true"))// Nếu chưa xóa thì xóa
					userUtils.undeleteUser(connection,id);
				else
					userUtils.deleteUser(connection,id);
			else if (object.equals("hoadon"))
				if (mode.equals("true"))// Nếu chưa xóa thì xóa
					HoaDonUtils.undeleteHoaDon(connection,id);
				else
					HoaDonUtils.deleteHoaDon(connection,id);
		
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		if (object.equals("sanpham"))
			response.sendRedirect(request.getContextPath()+"/QuanLiSanPham");
		else if (object.equals("loaisanpham"))
			response.sendRedirect(request.getContextPath()+"/QuanLiLoaiSanPham");
		else if (object.equals("nguoidung"))
			response.sendRedirect(request.getContextPath()+"/QuanLiKhachHang");
		else if (object.equals("hoadon"))
			response.sendRedirect(request.getContextPath()+"/QuanLiDonHang");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
