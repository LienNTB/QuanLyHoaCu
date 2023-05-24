package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

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
 * Servlet implementation class DoiMatKhau
 */
@WebServlet(name="/DoiMatKhau",urlPatterns= {"/DoiMatKhau"})
public class DoiMatKhau extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoiMatKhau() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setAttribute("user", commonBeans.mainUser);
	       response.setContentType("text/html;charset=UTF-8");
	        RequestDispatcher dispatcher = request.getServletContext()
	                .getRequestDispatcher("/WEB-INF/views/allUser/pages/doiMatKhau.jsp");
	        dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection conn=null;
		try {
			conn=DBConnection.getConnection();
		} catch (SQLException | ClassNotFoundException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		boolean hasError=false;
		String notification=null;
		String username=request.getParameter("Username");
		String oldPassword=request.getParameter("oldPassword");
		String newPassword=request.getParameter("newPassword");
		// kiểm tra thông tin cũ có đúng không?
		User user=null;
		try{
			user=userUtils.findUser(conn,username,oldPassword);
			
		}
		catch (SQLException e)
		{
			e.printStackTrace();
			hasError = true;
			notification=e.getMessage();
		}
		if (user == null){
			hasError = true;
			notification="Thông tin tài khoản hoặc mật khẩu không chính xác.";
		}
		else
		{
			user.setMatKhau(newPassword);
			try
			{
				userUtils.updateMatKhau(conn, user);
			}		
			catch (SQLException e)
			{
				e.printStackTrace();
				hasError = true;
				notification=e.getMessage();
			}
		}
		if (hasError)
		{
			request.setAttribute("user", commonBeans.mainUser);
			request.setAttribute("notification", notification);
		       response.setContentType("text/html;charset=UTF-8");
		        RequestDispatcher dispatcher = request.getServletContext()
		                .getRequestDispatcher("/WEB-INF/views/allUser/pages/doiMatKhau.jsp");
		        dispatcher.forward(request, response);
		}
		else
		{
			notification="Đổi mật khẩu thành công";
			if (commonBeans.mainUser==null)
			{
				request.setAttribute("notification", notification);
			       response.setContentType("text/html;charset=UTF-8");
			        RequestDispatcher dispatcher = request.getServletContext()
			                .getRequestDispatcher("/WEB-INF/views/allUser/pages/login.jsp");
			        dispatcher.forward(request, response);
			}
			else
			{
				commonBeans.mainUser=user;
				request.setAttribute("notification", notification);
				if (commonBeans.mainUser.getRole().equals("USER"))
				{
					request.setAttribute("user", user);
					servletsUser.commonServlets.setUpForHeader(conn,request,response);
				       response.setContentType("text/html;charset=UTF-8");
				        RequestDispatcher dispatcher = request.getServletContext()
				                .getRequestDispatcher("/WEB-INF/views/allUser/pages/profile.jsp");
				        dispatcher.forward(request, response);
				}
				else if (commonBeans.mainUser.getRole().equals("ADMIN"))
				{
					request.setAttribute("user", user);
					servletsUser.commonServlets.setUpForHeader(conn,request,response);
				       response.setContentType("text/html;charset=UTF-8");
				        RequestDispatcher dispatcher = request.getServletContext()
				                .getRequestDispatcher("/WEB-INF/views/admin/pages/homepage.jsp");
				        dispatcher.forward(request, response);
				}
			}
		}
	}

}
