package servletsUser;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;

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
 * Servlet implementation class capNhatThongTin
 */
@WebServlet(name="/capNhatThongTin", urlPatterns= {"/capNhatThongTin"})
public class capNhatThongTin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public capNhatThongTin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if (!servletsUser.commonServlets.preCheckLogin(request,response))
			return;
		Connection conn=null;
		String errorString=null;
		try{
            conn=DBConnection.getConnection();
        }
		catch (SQLException |ClassNotFoundException e)
        {
            e.printStackTrace();
		}
		String MaNguoiDung= commonBeans.mainUser.getMaNguoiDung();
		String TenDangNhap= commonBeans.mainUser.getTenDangNhap(); 
		
	    String HoTen= new String (request.getParameter("hoTen").getBytes("ISO-8859-1"),"UTF-8");
        java.sql.Date NgaySinh = commonBeans.ConvertStringToSQLDate(request.getParameter("ngaySinh"));  
		String DiaChi= new String (request.getParameter("diaChi").getBytes("ISO-8859-1"),"UTF-8");
	    String MatKhau=commonBeans.mainUser.getMatKhau();
		String RoleID=commonBeans.mainUser.getRole();
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
		if (errorString!=null)
		{
			commonBeans.mainUser=user;
		}
		else
		{
			errorString="Cập nhật thông tin thành công!";
		}
		
		request.setAttribute("user",user);
		request.setAttribute("notification",errorString);
		servletsUser.commonServlets.setUpForHeader(conn,request,response);
		RequestDispatcher dispatcher = request.getServletContext()
			.getRequestDispatcher("/WEB-INF/views/allUser/pages/profile.jsp");
	dispatcher.forward(request, response);
	}

}
