package servletsAdmin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.User;
import beans.commonBeans;
import conn.DBConnection;
import utils.userUtils;

/**
 * Servlet implementation class ThemKhachHang
 */
@WebServlet(name="/ThemKhachHang", urlPatterns= {"/ThemKhachHang"})
public class ThemKhachHang extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThemKhachHang() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (!commonBeans.checkAdmin()) 
		{
			response.sendRedirect(request.getContextPath()+"/Login");
			return;
		}
		response.setContentType("text/html;charset=UTF-8");
        RequestDispatcher dispatcher = request.getServletContext()
                .getRequestDispatcher("/WEB-INF/views/admin/pages/khachHangView/themKhachHangView.jsp");
        dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if (!commonBeans.checkAdmin()) 
		{
			response.sendRedirect(request.getContextPath()+"/Login");
			return;
		}
		Connection conn=null;
		String errorString=null;
		try {
            conn=DBConnection.getConnection();
		}
		catch(SQLException |ClassNotFoundException e) {
			// TODO Auto-generated catch block
            e.printStackTrace();
		}
		String MaNguoiDung= request.getParameter("maNguoiDung");
		String TenDangNhap= request.getParameter("tenDangNhap"); //
	    String HoTen= new String(request.getParameter("hoTen").getBytes("ISO-8859-1"),"UTF-8");
        java.sql.Date NgaySinh = commonBeans.ConvertStringToSQLDate(request.getParameter("ngaySinh"));  
		String DiaChi= new String(request.getParameter("diaChi").getBytes("ISO-8859-1"),"UTF-8");
	    String MatKhau="123";
		String RoleID="001";
		User user = null;
		try {
			user = new User(MaNguoiDung, TenDangNhap, MatKhau,HoTen, NgaySinh, DiaChi, RoleID);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		user.OutPrint();
		try{
		    userUtils.insertUser(conn,user);
		}
		catch (SQLException e)
		{
			e.printStackTrace();
			errorString=e.getMessage();
		}
		if (errorString != null)
		{
			request.setAttribute("errorString",errorString);
			RequestDispatcher dispatcher = request.getServletContext()
			.getRequestDispatcher("/WEB-INF/views/admin/pages/khachHangView/themKhachHangView.jsp");
	dispatcher.forward(request, response);
		}
		else
		{
			response.sendRedirect(request.getContextPath()+"/QuanLiKhachHang");
		}


	}

}
