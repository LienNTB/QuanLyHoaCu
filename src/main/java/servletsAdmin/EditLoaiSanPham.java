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
import beans.commonBeans;
import conn.DBConnection;
import utils.LoaiSanPhamUtils;

/**
 * Servlet implementation class EditLoaiSanPham
 */
@WebServlet("/EditLoaiSanPham")
public class EditLoaiSanPham extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditLoaiSanPham() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (!commonBeans.checkAdmin()) 
		{
			response.sendRedirect(request.getContextPath()+"/Login");
			return;
		}
		Connection conn =null;
		String id=request.getParameter("id");
		try{
            conn = DBConnection.getConnection();
		}
		catch (SQLException | ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		LoaiSanPham lsp=null;
		try {
            lsp = LoaiSanPhamUtils.getLoaiSanPhamById(conn,id);
		}
		catch (SQLException e) {
				e.printStackTrace();
		}
		request.setAttribute("loaiSanPham",lsp);
		response.setContentType("text/html;charset=UTF-8");
        RequestDispatcher dispatcher = request.getServletContext()
                .getRequestDispatcher("/WEB-INF/views/admin/pages/loaiSanPhamView/editLoaiSanPhamView.jsp");
        dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if (!commonBeans.checkAdmin()) 
		{
			response.sendRedirect(request.getContextPath()+"/NotAllow");
			return;
		}
		response.setContentType("text/html;charset=UTF-8");
		String errorString = null;
		LoaiSanPham lsp=null;
		Connection conn=null;
		try
		{
			conn = DBConnection.getConnection();
		}
		catch (SQLException |ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		String maLoaiSP=request.getParameter("maLoaiSP");
		String tenLoaiSP=new String (request.getParameter("tenLoaiSanPham").getBytes("ISO-8859-1"),"UTF-8");
		lsp=new LoaiSanPham(maLoaiSP,tenLoaiSP);
		try{
			 LoaiSanPhamUtils.updateLoaiSanPham(conn,lsp);
		}
		catch (SQLException e)
        {
            e.printStackTrace();
			errorString = e.getMessage();
		}
		request.setAttribute("errorString",errorString);
		request.setAttribute("loaiSanPham",lsp);

		if (errorString!=null)
		{
			RequestDispatcher rd=request.getServletContext().getRequestDispatcher("/WEB-INF/views/admin/pages/sanPhamView/editLoaiSanPhamView.jsp");
			rd.forward(request,response);
		}
		else
		{
			response.sendRedirect(request.getContextPath()+"/QuanLiLoaiSanPham");
		}
	}

}
