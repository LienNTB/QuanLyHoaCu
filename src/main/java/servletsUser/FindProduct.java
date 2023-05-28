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

import beans.commonBeans;
import conn.DBConnection;

/**
 * Servlet implementation class FindProduct
 */
@WebServlet("/FindProduct")
public class FindProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FindProduct() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setHeader("X-Frame-Options", "SAMEORIGIN");
		// TODO Auto-generated method stub
		int mode = 1;
		String maLSP = request.getParameter("loaiSanPhamFind");
		String dataInput = null;
		try {
			dataInput = new String(request.getParameter("inputFind").getBytes("ISO-8859-1"), "UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("inputFind rỗng");

		}
		if (dataInput == null || dataInput == "") {
			dataInput = "%%";
		} else {
			dataInput = "%" + dataInput + "%";
		}

		if (maLSP == null) {
			maLSP = "lsp00";
		} else if (maLSP.equals("lsp00")) {
			maLSP = "%%";
		}
		System.out.print(maLSP);
		commonBeans.homePage.setChedo(mode);
		commonBeans.homePage.setMaLSP(maLSP);
		commonBeans.homePage.setDataInput(dataInput);
		commonBeans.homePage.setSttTrang(1);
		System.out.println("Giờ tới homepage nè Đại vương");
		response.sendRedirect(request.getContextPath() + "/HomePage");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.print("Ok rồi Đại vương!");
		doGet(request, response);
	}

}
