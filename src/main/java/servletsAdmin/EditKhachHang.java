package servletsAdmin;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.User;
import conn.DBConnection;
import utils.userUtils;
import beans.commons;

/**
 * Servlet implementation class EditKhachHang
 */
@WebServlet(name="/EditKhachHang",urlPatterns= {"/EditKhachHang"})
public class EditKhachHang extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditKhachHang() {
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
		Connection conn=null;
		String errorString=null;
		String id=request.getParameter("id");
		try{
			conn=DBConnection.getConnection();
		}
		catch (SQLException | ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		User user=null;
		try
		{
			user=userUtils.getUserById(conn,id);
		}
		catch(SQLException e)
        {
			e.printStackTrace();
			errorString=e.getMessage();
		}
		response.setContentType("text/html;charset=UTF-8");
        request.setAttribute("user",user);
        request.setAttribute("errorString",errorString);
		RequestDispatcher dispatcher = request.getServletContext()
                .getRequestDispatcher("/WEB-INF/views/admin/pages/khachHangView/editKhachHangView.jsp");
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
		catch (SQLException |ClassNotFoundException e)
        {
            e.printStackTrace();
		}
		String MaNguoiDung= request.getParameter("maNguoiDung");
		String TenDangNhap= request.getParameter("tenDangNhap"); //
	    String HoTen= new String (request.getParameter("hoTen").getBytes("ISO-8859-1"),"UTF-8");
        java.sql.Date NgaySinh = commons.ConvertStringToSQLDate(request.getParameter("ngaySinh"));  
		String DiaChi= new String (request.getParameter("diaChi").getBytes("ISO-8859-1"),"UTF-8");
	    String MatKhau="123";
		String RoleID="001";
		User user = null;
		try {
			user = new User(MaNguoiDung, TenDangNhap, MatKhau,HoTen, NgaySinh, DiaChi, RoleID);
		} catch (ParseException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}

		

		try{
		    userUtils.updateUserWithoutMatKhau(conn,user);
		}
		catch (SQLException e)
		{
			e.printStackTrace();
			errorString=e.getMessage();
			try
			{
				user=userUtils.getUserById(conn,MaNguoiDung);
			}
			catch(SQLException e1)
	        {
				e1.printStackTrace();
				errorString=e1.getMessage();
			}
		}
		request.setAttribute("errorString",errorString);
		request.setAttribute("user",user);
		if (errorString != null)
		{
			request.setAttribute("errorString",errorString);
			RequestDispatcher dispatcher = request.getServletContext()
			.getRequestDispatcher("/WEB-INF/views/admin/pages/khachHangView/EditKhachHangView.jsp");
	dispatcher.forward(request, response);
		}
		else
		{
			response.sendRedirect(request.getContextPath()+"/QuanLiKhachHang");
		}
	}

}
