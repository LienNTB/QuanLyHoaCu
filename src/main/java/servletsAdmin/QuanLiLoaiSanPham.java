package servletsAdmin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.LoaiSanPham;
import beans.commonBeans;
import conn.DBConnection;
import utils.LoaiSanPhamUtils;

/**
 * Servlet implementation class QuanLiLoaiSanPham
 */
@WebServlet(name="/QuanLiLoaiSanPham",urlPatterns= {"/QuanLiLoaiSanPham"})
public class QuanLiLoaiSanPham extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuanLiLoaiSanPham() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse respo	nse)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (!commonBeans.checkAdmin()) 
		{
			response.sendRedirect(request.getContextPath()+"/Login");
			return;
		}
		Connection conn=null;
		try {
			conn = DBConnection.getConnection();
		}
		catch (SQLException | ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		List <LoaiSanPham> list = null;
		// thanh tìm kiếm
		String text=request.getParameter("text");
		
		if(text != null) {
			try {
				list = LoaiSanPhamUtils.getListLoaiSanPhamBySearch(conn, text);
			} catch (SQLException e) {	
				e.printStackTrace();
				
			}
		}
		else {
			try
			{
				list = LoaiSanPhamUtils.getListLoaiSanPham(conn);
			}
			catch (SQLException e)
			{
				e.printStackTrace();
			}
		}
		request.setAttribute("loaiSanPhamlist", list);
		response.setContentType("text/html;charset=UTF-8");
		
        RequestDispatcher dispatcher = request.getServletContext()
                .getRequestDispatcher("/WEB-INF/views/admin/pages/loaiSanPhamView/quanLiLoaiSanPhamView.jsp");
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
