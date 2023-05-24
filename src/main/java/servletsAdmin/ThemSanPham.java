package servletsAdmin;

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

import beans.LoaiSanPham;
import beans.SanPham;
import beans.commonBeans;
import conn.DBConnection;
import servletsUser.commonServlets;
import utils.LoaiSanPhamUtils;
import utils.SanPhamUtils;

/**
 * Servlet implementation class ThemSanPham
 */
@WebServlet(name="/ThemSanPham", urlPatterns= {"/ThemSanPham"})
public class ThemSanPham extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThemSanPham() {
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
		Connection conn=null;
		try{
			conn = DBConnection.getConnection();
		}
		catch(SQLException e1) {
			e1.printStackTrace();
		}
		catch(ClassNotFoundException e2) {
			e2.printStackTrace();
		}
		List<LoaiSanPham> lsp=null;
		String errorString=null;
		try{
			lsp=LoaiSanPhamUtils.getListLoaiSanPham(conn);
		}
		catch (SQLException e)
		{
			e.printStackTrace();
			errorString=e.getMessage();
		}
		request.setAttribute("loaiSanPham",lsp);
		request.setAttribute("errorString",errorString);
		response.setContentType("text/html;charset=UTF-8");
        RequestDispatcher dispatcher = request.getServletContext()
                .getRequestDispatcher("/WEB-INF/views/admin/pages/sanPhamView/themSanPhamView.jsp");
        dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if (!commonBeans.checkAdmin()) 
		{
			response.sendRedirect(request.getContextPath()+"/Login");
			return;
		}
		Connection conn =null;
		String errorString=null;
		SanPham newSP=null;
		
		try{
			conn=DBConnection.getConnection();
		}
		catch (SQLException e1)
		{
			e1.printStackTrace();
		}
		catch (ClassNotFoundException e2)
		{
			e2.printStackTrace();
		}
	
		String maSP=request.getParameter("maSP");
		String tenSP=new String (request.getParameter("tenSP").getBytes("ISO-8859-1"),"UTF-8");
		String giaStr=request.getParameter("gia");
		String maLoaiSanPham=request.getParameter("maLoaiSanPham");
		String chiTiet=new String (request.getParameter("chiTiet").getBytes("ISO-8859-1"),"UTF-8");
		String hinh=request.getParameter("hinh");
		
		int gia=0;
		try{
			gia=Integer.parseInt(giaStr);

		}
		catch (Exception e) 
		{					
			errorString="Sai định dạng giá!";
			return;
		}
		newSP=new SanPham(maSP, tenSP, gia,chiTiet,hinh,maLoaiSanPham);
		newSP.OutPrint();
		try{
			SanPhamUtils.InsertSanPham(conn,newSP);
		}
		catch(Exception e){
			e.printStackTrace();
			errorString=commonServlets.filterErrorFromDatabase(e.getMessage());
		}
		request.setAttribute("notification",errorString);
		request.setAttribute("sanpham",newSP);
		if (errorString!=null)
		{
			request.setAttribute("notification",errorString);
			RequestDispatcher dispatcher = request.getServletContext()
			.getRequestDispatcher("/WEB-INF/views/admin/pages/sanPhamView/themSanPhamView.jsp");
	dispatcher.forward(request, response);
		}
		else{
			response.sendRedirect(request.getContextPath()+"/QuanLiSanPham");
		}
	}

}
