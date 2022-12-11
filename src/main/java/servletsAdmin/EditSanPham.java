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

import beans.SanPham;
import conn.DBConnection;
import utils.SanPhamUtils;

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
		response.setContentType("text/html;charset=UTF-8");
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
		String idStr=(String)request.getParameter("id");
		SanPham sp=null;
		String errorString=null;
		try{
			sp=SanPhamUtils.GetSanPhamById(conn,idStr);
		}
		catch (SQLException e)
		{
			e.printStackTrace();
			errorString=e.getMessage();
		}
		if (errorString!=null &&  sp==null)
		{
			response.sendRedirect(request.getServletPath()+"/QuanLiSanPham");
			return;
		}
		request.setAttribute("errorString",errorString);
		request.setAttribute("sanpham",sp);
		RequestDispatcher rd=request.getServletContext().getRequestDispatcher("/WEB-INF/views/admin/pages/sanPhamView/editSanPhamView.jsp");
		rd.forward(request,response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection conn =null;
		String errorString=null;
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
		System.out.println("Ok");
		String maSP=request.getParameter("maSP");
		String tenSP=new String (request.getParameter("tenSP").getBytes("ISO-8859-1"),"UTF-8");
		String giaStr=request.getParameter("gia");
		String chiTiet=new String (request.getParameter("chiTiet").getBytes("ISO-8859-1"),"UTF-8");
		String hinh=null;
		
		int gia=0;
		try{
			gia=Integer.parseInt(giaStr);

		}
		catch (Exception e) 
		{			
			errorString="Sai định dạng giá!";
			return;
		}
		SanPham sp=new SanPham(maSP, tenSP, gia,chiTiet,hinh);
		try{
			SanPhamUtils.UpdateSanPham(conn,sp);
		}
		catch(Exception e){
			e.printStackTrace();
			errorString=e.getMessage();
		}
		request.setAttribute("errorString",errorString);
		request.setAttribute("sanpham",sp);
		if (errorString!=null)
		{
			RequestDispatcher rd=request.getServletContext().getRequestDispatcher("/WEB-INF/views/admin/pages/sanPhamView/editSanPhamView.jsp");
			rd.forward(request,response);
		}
		else{
			response.sendRedirect(request.getContextPath()+"/QuanLiSanPham");
		}
	}

}
