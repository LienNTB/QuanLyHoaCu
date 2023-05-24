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

import beans.HoaDon;
import beans.LoaiSanPham;
import beans.SanPham;
import beans.User;
import beans.commonBeans;
import conn.DBConnection;
import utils.HoaDonUtils;
import utils.LoaiSanPhamUtils;
import utils.SanPhamUtils;
import utils.userUtils;

/**
 * Servlet implementation class Loc
 */
@WebServlet(name="/Loc", urlPatterns= {"/Loc"})
public class Loc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Loc() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @param list 
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if (!commonBeans.checkAdmin()) 
		{
			response.sendRedirect(request.getContextPath()+"/Login");
			return;
		}
		Connection conn=null;
		try
		{
			conn=DBConnection.getConnection();
		}
		catch (SQLException | ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		String object = request.getParameter("obj");
		String mode=request.getParameter("status");
		List <HoaDon> hdList = new ArrayList<HoaDon>();
		List <SanPham> spList=new ArrayList<SanPham>();
		List <User> uList = new ArrayList<User>();
		List <LoaiSanPham> lspList=new ArrayList<LoaiSanPham>();
		try
		{
			if (object.equals("sanpham"))
				if (mode.equals("0"))// 
					spList=SanPhamUtils.getSanPhamListByDeletedStatus(conn,false);
				else if (mode.equals("1"))//
					spList=SanPhamUtils.getSanPhamListByDeletedStatus(conn,true);
				else
					spList=SanPhamUtils.getListSanPham(conn);
			else if (object.equals("loaisanpham"))
				if (mode.equals("0"))// 
					lspList=LoaiSanPhamUtils.getListLoaiSanPhamByDeletedStatus(conn,false);
				else if (mode.equals("1"))//
					lspList=LoaiSanPhamUtils.getListLoaiSanPhamByDeletedStatus(conn,true);
				else
					lspList=LoaiSanPhamUtils.getListLoaiSanPham(conn);
			else if (object.equals("nguoidung"))
				if (mode.equals("0"))// 
					uList=userUtils.getListUserByDeletedStatus(conn,false);
				else if (mode.equals("1"))//
					uList=userUtils.getListUserByDeletedStatus(conn,true);
				else
					uList=userUtils.getListUser(conn);
			else if (object.equals("hoadon"))
				if (mode.equals("0"))// 
					hdList=HoaDonUtils.getListHoaDonByDeletedStatus(conn,false);
				else if (mode.equals("1"))//
					hdList=HoaDonUtils.getListHoaDonByDeletedStatus(conn,true);
				else
					hdList=HoaDonUtils.getListHoaDon(conn);
		
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		request.setAttribute("status",mode);
		if (object.equals("sanpham"))
		{
			request.setAttribute("sanPhamList", spList);
			response.setContentType("text/html;charset=UTF-8");
			 RequestDispatcher dispatcher = request.getServletContext()
					 .getRequestDispatcher("/WEB-INF/views/admin/pages/sanPhamView/quanLiSanPhamView.jsp");
			 dispatcher.forward(request, response);
		}
		else if (object.equals("loaisanpham"))
		{
			request.setAttribute("loaiSanPhamlist", lspList);
			response.setContentType("text/html;charset=UTF-8");
			
			RequestDispatcher dispatcher = request.getServletContext()
					.getRequestDispatcher("/WEB-INF/views/admin/pages/loaiSanPhamView/quanLiLoaiSanPhamView.jsp");
			dispatcher.forward(request, response);
		}
		else if (object.equals("nguoidung"))
		{
			request.setAttribute("users", uList);
			response.setContentType("text/html;charset=UTF-8");
			RequestDispatcher dispatcher = request.getServletContext()
					.getRequestDispatcher("/WEB-INF/views/admin/pages/khachHangView/quanLiKhachHangView.jsp");
			dispatcher.forward(request, response);
		}
		else if (object.equals("hoadon"))
		{
			request.setAttribute("hoaDonList", hdList);
			response.setContentType("text/html;charset=UTF-8");
			RequestDispatcher dispatcher = request.getServletContext()
					.getRequestDispatcher("/WEB-INF/views/admin/pages/donHangView/quanLiDonHangView.jsp");
			dispatcher.forward(request, response);
		}
		else
			response.sendRedirect(request.getContextPath()+"/Admin_HomePage");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
