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

import beans.LoaiSanPham;
import beans.SanPham;
import conn.DBConnection;
import utils.LoaiSanPhamUtils;
import utils.SanPhamUtils;

/**
 * Servlet implementation class HomePage
 */
@WebServlet(name="/HomePage", urlPatterns= {"/HomePage"})
public class HomePage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomePage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	       response.setContentType("text/html;charset=UTF-8");
			Connection conn = null;
			try {
				conn = DBConnection.getConnection();
			} catch (ClassNotFoundException | SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
				response.sendRedirect(request.getContextPath()+"/Login");
				return;
			}
	       

	      setupVariables(conn,request);
	       response.setContentType("text/html;charset=UTF-8");
	        RequestDispatcher dispatcher = request.getServletContext()
	                .getRequestDispatcher("/WEB-INF/views/allUser/pages/homepage.jsp");
	        dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	private void setupVariables(Connection conn, HttpServletRequest request) throws  ServletException, IOException {
		int index_page=1;
		int SPperPage=10;
		int maxPage=1;
		try
		{
			index_page=Integer.parseInt(request.getParameter("index"));
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		List<SanPham> list = null;
		List<LoaiSanPham> lsp=null;
		List <SanPham> forwardList=null;
		try {
			list = SanPhamUtils.getListSanPham(conn);
		} catch (SQLException e) {	
			e.printStackTrace();	
		}
		try{
			lsp = LoaiSanPhamUtils.getListLoaiSanPham(conn);
		}
		catch(SQLException e){
            e.printStackTrace();
        }
		if (index_page<=1)
			forwardList=list.subList(0, SPperPage);
		else
			forwardList=list.subList((index_page-1)*SPperPage,Math.min( (index_page)*SPperPage,list.size()));
		maxPage=list.size()/maxPage+1;
		request.setAttribute("sanPhamList", forwardList);
		request.setAttribute("lsp", lsp);
		request.setAttribute("maxPage",maxPage);
		request.setAttribute("index",index_page);
		
		
	}

}
