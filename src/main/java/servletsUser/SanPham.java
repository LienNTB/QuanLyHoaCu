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

import conn.DBConnection;
import utils.LoaiSanPhamUtils;
import utils.SanPhamUtils;


/**
 * Servlet implementation class SanPham
 */
@WebServlet("/SanPham")
public class SanPham extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SanPham() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn=null;
		try
		{
			conn=DBConnection.getConnection();

		}
		catch (SQLException | ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		String maSP=request.getParameter("id");
		List<beans.SanPham> spRelated=null;
		List<beans.LoaiSanPham> lsp=null;
		System.out.print(maSP);	
		beans.SanPham sp=null;
		try
		{
			sp=SanPhamUtils.GetSanPhamById(conn,maSP);
		
		
		}
		catch (SQLException e)
        {
            e.printStackTrace();
            System.out.print("Sản phẩm bị gì rồi kìa Đại vương!");
            
		}
		if (sp!=null)
		{
			try
			{
				spRelated=SanPhamUtils.getListSanPhamRelated(conn,sp,4);
			}
			catch (SQLException e)
			{
				e.printStackTrace();
	            System.out.print("Lấy sản phẩm có liên quan hông được rồi Đại vương!");
			}
			sp.OutPrint();
		}
		else
			System.out.print("Hỏng thấy sản phẩm, Đại vương ơi!");
		System.out.print(spRelated);
		request.setAttribute("sanPham",sp);
		request.setAttribute("spRelated",spRelated);
		servletsUser.commonServlets.setUpForHeader(conn,request,response);
		response.setContentType("text/html;charset=UTF-8");
	        RequestDispatcher dispatcher = request.getServletContext()
	                .getRequestDispatcher("/WEB-INF/views/allUser/pages/sanpham.jsp");
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
