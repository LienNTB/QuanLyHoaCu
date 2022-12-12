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
import utils.SanPhamUtils;
/**
 * Servlet implementation class DeleteSanPham
 */
@WebServlet(name="/DeleteSanPham",urlPatterns= {"/DeleteSanPham"})
public class DeleteSanPham extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteSanPham() {
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
		String id= request.getParameter("id");
		try
		{
			SanPhamUtils.DeleteSanPham(connection,id);
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		response.sendRedirect(request.getContextPath()+"/QuanLiSanPham");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
