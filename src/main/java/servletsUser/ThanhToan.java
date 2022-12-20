package servletsUser;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import conn.DBConnection;
import utils.ChiTietHoaDonUtils;
import utils.HoaDonUtils;
import beans.ChiTietHoaDon;
import beans.HoaDon;
import beans.commons;

/**
 * Servlet implementation class CheckOut
 */
@WebServlet(name="/ThanhToan", urlPatterns= {"/ThanhToan"}	)
public class ThanhToan extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThanhToan() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		servletsUser.common.preCheckLogin(request,response);
		Connection conn=null;
		try
		{
			conn=DBConnection.getConnection();
		}
		catch (SQLException | ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		List<ChiTietHoaDon> cthdList=null;
		float tong=0;
		try
		{
			cthdList=ChiTietHoaDonUtils.getChiTietHoaDonByMaHD(conn,"cart_"+commons.mainUser.getMaNguoiDung());
			tong=HoaDonUtils.getTongThanhToan(conn,"cart_"+commons.mainUser.getMaNguoiDung());
		}
		catch(SQLException e)
        {
            e.printStackTrace();
		}
		System.out.print(cthdList.size());
		servletsUser.common.setUpForHeader(conn,request,response);
		request.setAttribute("tongTien",tong);
		request.setAttribute("chiTietHoaDon",cthdList);
		
		response.setContentType("text/html;charset=UTF-8");
        RequestDispatcher dispatcher = request.getServletContext()
                .getRequestDispatcher("/WEB-INF/views/allUser/pages/thanhtoan.jsp");
        dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("deprecation")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if (!servletsUser.common.preCheckLogin(request,response))
			return;
		Connection conn=null;
		try
		{
			conn=DBConnection.getConnection();
		}
		catch (SQLException | ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		String ghiChu="";
		String diaChiGiaoHang="";
		String SoDienThoai="";
		int tongTien=0;
		
		try{
			ghiChu=new String(request.getParameter("ghiChu").getBytes("ISO-8859-1"),"UTF-8");
			diaChiGiaoHang=new String(request.getParameter("diaChi").getBytes("ISO-8859-1"),"UTF-8");
			SoDienThoai=new String(request.getParameter("soDienThoai"));
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		String newMaHD= "DH."+commons.mainUser.getMaNguoiDung()+"."+new SimpleDateFormat("yyyyMMddhhmmss").format(Calendar.getInstance().getTime());
		HoaDon hd=new HoaDon(newMaHD, tongTien,diaChiGiaoHang, commons.mainUser.getMaNguoiDung(), SoDienThoai, new Date(2023,01,01), false,false, false, ghiChu);
		
		try
		{
			tongTien= HoaDonUtils.getTongThanhToan(conn,"cart_"+commons.mainUser.getMaNguoiDung() );
			hd.setTongThanhToan(tongTien);
			HoaDonUtils.insertHoaDon(conn,hd);
			ChiTietHoaDonUtils.changeMaCTHD(conn,"cart_"+commons.mainUser.getMaNguoiDung(),newMaHD );
		}
		catch(SQLException e)
				{
					e.printStackTrace();
					response.sendRedirect(request.getContextPath()+"/ThanhToan?");
		            return;
				}
		servletsUser.common.setUpForHeader(conn,request,response);
		response.setContentType("text/html;charset=UTF-8");
		RequestDispatcher dispatcher = request.getServletContext()
				.getRequestDispatcher("/WEB-INF/views/allUser/pages/homepage.jsp");
		dispatcher.forward(request, response);
		
	}

}
