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
import conn.DBConnection;
import utils.userUtils;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	       response.setContentType("text/html;charset=UTF-8");
	        RequestDispatcher dispatcher = request.getServletContext()
	                .getRequestDispatcher("/WEB-INF/views/allUser/login.jsp");
	        dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				// TODO Auto-generated method stub
		String username = request.getParameter("Email");
		String password = request.getParameter("Password");
		User user=null;
		boolean hasError = false;
		String errorString=null;	
		if (username == null || password ==null || username.length() == 0 || password.length() == 0)
		{
			hasError = true;
			errorString="Please enter a username and password.";
		}
		else
		{
			Connection conn=null;
			try{
				conn=DBConnection.getConnection();
			}
			catch (ClassNotFoundException| SQLException e1)
			{
				e1.printStackTrace();
			}
			try{
				user=userUtils.findUser(conn,username,password);
				if (user == null){
					hasError = true;
					errorString="Username or password is invalid.";
				}
			}
			catch (SQLException e)
			{
				e.printStackTrace();
				hasError = true;
				errorString=e.getMessage();
			}
		}
		if (hasError)
		{
			RequestDispatcher dispatcher= this.getServletContext().getRequestDispatcher("/WEB-INF/views/allUser/login.jsp");
			dispatcher.forward(request,response);
		}
		else
		{

			response.sendRedirect(request.getContextPath()+"/HomePage");
		}
	}

}
