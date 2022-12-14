package servletsAdmin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.LoaiSanPham;
import beans.commons;
import conn.DBConnection;
import utils.LoaiSanPhamUtils;

/**
 * Servlet implementation class ThemLoaiSanPham
 */
@WebServlet(name="/ThemLoaiSanPham",urlPatterns= {"/ThemLoaiSanPham"})
public class ThemLoaiSanPham extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThemLoaiSanPham() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (!commons.checkAdmin()) 
		{
			response.sendRedirect(request.getContextPath()+"/NotAllow");
			return;
		}
		response.setContentType("text/html;charset=UTF-8");
        RequestDispatcher dispatcher = request.getServletContext()
                .getRequestDispatcher("/WEB-INF/views/admin/pages/loaiSanPhamView/themLoaiSanPhamView.jsp");
        dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if (!commons.checkAdmin()) 
		{
			response.sendRedirect(request.getContextPath()+"/NotAllow");
			return;
		}
		Connection conn=null;
		String errorString=null;
		try{
			conn=DBConnection.getConnection();

		}
		catch(SQLException | ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		String maLoaiSanPham = request.getParameter("maLoaiSanPham");
		String tenLoaiSanPham = new String(request.getParameter("tenLoaiSanPham").getBytes("ISO-8859-1"),"UTF-8");
		LoaiSanPham lsp=new LoaiSanPham(maLoaiSanPham,tenLoaiSanPham);
		try
        {
			LoaiSanPhamUtils.insertLoaiSanPham(conn,lsp);
		}
		catch(SQLException e)
        {
			errorString = e.getMessage();
		}
		if(errorString!=null)
		{
			request.setAttribute("errorString",errorString);
			RequestDispatcher dispatcher = request.getServletContext()
			.getRequestDispatcher("/WEB-INF/views/admin/pages/loaiSanPhamView/themLoaiSanPhamView.jsp");
	dispatcher.forward(request, response);
		}
		else
		{
			response.sendRedirect(request.getContextPath()+"/QuanLiLoaiSanPham");
		}
	}

}
