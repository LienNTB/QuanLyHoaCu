package servletsUser;

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
import beans.commons;
import conn.DBConnection;
import utils.userUtils;

/**
 * Servlet implementation class Profile
 */
@WebServlet(name="/Profile",urlPatterns= {"/Profile"})
public class Profile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Profile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (!servletsUser.common.preCheckLogin(request,response))
			return;
		Connection conn = null;
		try {
			conn = DBConnection.getConnection();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}	
		//sẵn tiện refesh thông tin người dùng
		String userID =commons.mainUser.getMaNguoiDung();
		try {
			commons.mainUser = userUtils.getUserById(conn, userID);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		servletsUser.common.setUpForHeader(conn,request,response);
		request.setAttribute("user",commons.mainUser);
		RequestDispatcher dispatcher = request.getServletContext()
	                .getRequestDispatcher("/WEB-INF/views/allUser/pages/profile.jsp");
	        dispatcher.forward(request, response);
	     
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
