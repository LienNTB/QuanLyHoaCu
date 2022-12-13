package servletsAdmin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.HoaDon;
import beans.commons;
import conn.DBConnection;
import utils.HoaDonUtils;

/**
 * Servlet implementation class ThemDonHang
 */
@WebServlet("/ThemDonHang")
public class ThemDonHang extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThemDonHang() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (!commons.checkAdmin()) 
		{
			response.sendRedirect(request.getContextPath()+"/NotAllow");
			return;
		}
		response.setContentType("text/html;charset=UTF-8");
        RequestDispatcher dispatcher = request.getServletContext()
                .getRequestDispatcher("/WEB-INF/views/admin/pages/donHangView/themDonHangView.jsp");
        dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if (!commons.checkAdmin()) 
		{
			response.sendRedirect(request.getContextPath()+"/NotAllow");
			return;
		}
		Connection conn=null;
		String errorString=null;
		try{
			conn=DBConnection.getConnection();
		}
		catch (SQLException | ClassNotFoundException e)
		{
			e.printStackTrace();
			
		}
		String maHoaDon=request.getParameter("maHoaDon");
		String diaChiGiaoHang=new String(request.getParameter("diaChiGiaoHang").getBytes("ISO-8859-1"),"UTF-8");
		String maKhachHang=request.getParameter("maKhachHang");
		String soDienThoai = request.getParameter("soDienThoai"); 
		java.sql.Date thoiGianGiaoHang = commons.ConvertStringToSQLDate(request.getParameter("thoiGianGiaoHang"));
		Boolean trangThaiDonHang =Boolean.parseBoolean( request.getParameter("trangThaiDonHang"));
		Boolean trangThaiGiaoHang=Boolean.parseBoolean( request.getParameter("trangThaiGiaoHang"));
		Boolean trangThaiThanhToan=Boolean.parseBoolean( request.getParameter("trangThaiThanhToan"));
		String ghiChu=new String(request.getParameter("ghiChu").getBytes("ISO-8859-1"),"UTF-8");
		int tongThanhToan=0;
		try
		{
			tongThanhToan= Integer.parseInt( request.getParameter("tongThanhToan"));
			
		}
		catch (NumberFormatException e)
		{
			errorString="Sai định dạng giá";
			e.printStackTrace();
		}
		HoaDon hoaDon=null;
		if (errorString==null)
		{
			hoaDon=new HoaDon (maHoaDon,tongThanhToan,diaChiGiaoHang,maKhachHang,soDienThoai, thoiGianGiaoHang, trangThaiDonHang,trangThaiGiaoHang,trangThaiThanhToan,ghiChu);
			try
			{
				HoaDonUtils.insertHoaDon(conn,hoaDon);
			}
			catch( SQLException e)
			{
				e.printStackTrace();
				errorString="DB: "+e.getMessage();
			}
		}
		request.setAttribute("errorString",errorString);
		request.setAttribute("hoaDon",hoaDon);

		if (errorString!=null)
		{
			RequestDispatcher rd=request.getServletContext().getRequestDispatcher("/WEB-INF/views/admin/pages/donHangView/themDonHangView.jsp");
			rd.forward(request,response);
		}
		else
		{
			response.sendRedirect(request.getContextPath()+"/QuanLiDonHang");
		}
	}

}
