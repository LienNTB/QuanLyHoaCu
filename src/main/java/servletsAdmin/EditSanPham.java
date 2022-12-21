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

import beans.SanPham;
import beans.commonBeans;
import beans.LoaiSanPham;
import conn.DBConnection;
import utils.SanPhamUtils;
import utils.LoaiSanPhamUtils;

/**
 * Servlet implementation class EditSanPham
 */
@WebServlet(name="/EditSanPham",urlPatterns= {"/EditSanPham"})
public class EditSanPham extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditSanPham() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (!commonBeans.checkAdmin()) 
		{
			response.sendRedirect(request.getContextPath()+"/NotAllow");
			return;
		}
		response.setContentType("text/html;charset=UTF-8");
		Connection conn=null;
		String errorString = null;
		try{
			conn = DBConnection.getConnection();
		}
		catch(SQLException e1) {
			e1.printStackTrace();
		}
		catch(ClassNotFoundException e2) {
			e2.printStackTrace();
		}
		String idStr=(String)request.getParameter("id");
		goBack(request,response,conn,idStr,errorString);

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
			goBack(request, response, conn, maSP, errorString);
			return;
		}
		newSP=new SanPham(maSP, tenSP, gia,chiTiet,hinh,maLoaiSanPham);
		try{
			SanPhamUtils.UpdateSanPham(conn,newSP);
		}
		catch(Exception e){
			e.printStackTrace();
			errorString=e.getMessage();
		}
		if (errorString!=null)
		{
			goBack(request, response, conn, maSP, errorString);
		}
		else{
			response.sendRedirect(request.getContextPath()+"/QuanLiSanPham");
		}
	}
	protected void goBack(HttpServletRequest request, HttpServletResponse response,Connection conn, String maSP, String errorString) throws ServletException, IOException {
		SanPham newSP=null;
		List<LoaiSanPham> lsp=null;
		try{
			newSP=SanPhamUtils.GetSanPhamById(conn,maSP);
			lsp=LoaiSanPhamUtils.getListLoaiSanPham(conn);
		}
		catch (SQLException e1)
		{
			e1.printStackTrace();
			errorString=e1.getMessage();
		}
		request.setAttribute("errorString",errorString);
		request.setAttribute("sanpham",newSP);
		request.setAttribute("loaiSanPham",lsp);
		RequestDispatcher rd=request.getServletContext().getRequestDispatcher("/WEB-INF/views/admin/pages/sanPhamView/editSanPhamView.jsp");
		rd.forward(request,response);
	}
	

}
