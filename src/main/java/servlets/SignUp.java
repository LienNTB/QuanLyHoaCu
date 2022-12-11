package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.User;
import conn.DBConnection;
import utils.userUtils;

/**
 * Servlet implementation class SignUp
 */
@WebServlet(name="/SignUp",urlPatterns= {"/SignUp"})
public class SignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUp() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String error=null;
		User user=null;
		Date dates1;
		String dateStr=request.getParameter("Birthday");
		try {
			dates1=new SimpleDateFormat("yyyy-MM-dd").parse(dateStr);
		}
		catch(Exception e)
		{
			error="Lỗi định dạng ngày sinh!";
			return;
		}
		user=new User( request.getParameter("Username"), request.getParameter("Password"), new String(request.getParameter("Name").getBytes("ISO-8859-1"),"UTF-8"), dates1, new String(request.getParameter("Address").getBytes("ISO-8859-1"),"UTF-8"));
		Connection conn=null;
		try {
            conn=DBConnection.getConnection();
		}
		catch(SQLException e1)
        {
			e1.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try{
			userUtils.insertUser(conn, user);
		}
		catch (SQLException e)
		{
			error=e.getMessage();
		}
		request.setAttribute("errorString", error);
		RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/WEB-INF/views/allUser/pages/login.jsp");
		dispatcher.forward(request, response);


		
	}

}
