package servletsUser;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.ChiTietHoaDon;
import conn.DBConnection;
import utils.ChiTietHoaDonUtils;



/**
 * Servlet implementation class Cart_HasProduct
 */
@WebServlet("/Cart_HasProduct")
public class Cart_HasProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Cart_HasProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = null;
		try {
			conn = DBConnection.getConnection();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		List<ChiTietHoaDon> list = null;
		try {
			list = ChiTietHoaDonUtils.getChiTietHoaDonByIdMaHD(conn,"DH1");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// set attribute
		request.setAttribute("chitiethoadonList", list);
		response.setContentType("text/html;charset=UTF-8");
        RequestDispatcher dispatcher = request.getServletContext()
                .getRequestDispatcher("/WEB-INF/views/allUser/pages/cart_hasproduct.jsp");
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
