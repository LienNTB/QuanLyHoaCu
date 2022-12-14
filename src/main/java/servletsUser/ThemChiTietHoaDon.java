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

import conn.DBConnection;
import utils.HoaDonUtils;
import utils.userUtils;

/**
 * Servlet implementation class ThemChiTietHoaDon
 */
@WebServlet("/ThemChiTietHoaDon")
public class ThemChiTietHoaDon extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThemChiTietHoaDon() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
        RequestDispatcher dispatcher = request.getServletContext()
                .getRequestDispatcher("/WEB-INF/views/allUser/pages/homepage.jsp");
        dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn=null;
		String errorString=null;
		try {
            conn=DBConnection.getConnection();
		}
		catch(SQLException |ClassNotFoundException e) {
			// TODO Auto-generated catch block
            e.printStackTrace();
		}
		String maSP = request.getParameter("maSP");
		try{
		    HoaDonUtils.insertHoaDon(conn, maSP)
		}
		catch (SQLException e)
		{
			e.printStackTrace();
			errorString=e.getMessage();
		}
	}

}
