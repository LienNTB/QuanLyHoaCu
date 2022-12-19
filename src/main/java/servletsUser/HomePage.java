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

import beans.SanPham;
import beans.commons;
import conn.DBConnection;
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
	       

	      setupVariables(conn,request,response);
	      servletsUser.common.setUpForHeader(conn,request,response);
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
		
	}
	private void setupVariables(Connection conn, HttpServletRequest request,  HttpServletResponse response) throws  ServletException, IOException {
		int index_page=1;
		int SPperPage=20;
		int maxPage=1;
		if (request.getParameter("index")!=null)
			try
			{
				index_page=Integer.parseInt(request.getParameter("index"));
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		List<SanPham> list = null;
	
		List <SanPham> forwardList=null;
		List <SanPham> bestSeller=null;
		try {
			if (commons.homePage.getChedo()==0)
			{
				list = SanPhamUtils.getListSanPham(conn);
				bestSeller=SanPhamUtils.getBestSeller(conn,4);
				
			}
			else
			{
				list=SanPhamUtils.getListSanPhamByMaLSPandDataInput(conn,commons.homePage.getMaLSP(), commons.homePage.getDataInput());
				bestSeller=SanPhamUtils.getBestSellerByLSP(conn,4,commons.homePage.getMaLSP());
			}
		
		} catch (SQLException e) {	
			e.printStackTrace();	
		}
		System.out.print(list.size());
		SPperPage=Math.min(list.size(), SPperPage);

		if (SPperPage>=1)
		{
			maxPage=list.size()/SPperPage+1;
			index_page=Math.min(index_page, maxPage);
			if (index_page<=1)
				forwardList=list.subList(0, SPperPage);
			else
				forwardList=list.subList((index_page-1)*SPperPage,Math.min( (index_page)*SPperPage,list.size()));
		}
		if (commons.homePage.getChedo()==0 || commons.homePage.getMaLSP().equals("%%"))
			request.setAttribute("defaulLSPFind", "lsp00");
		else
			request.setAttribute("defaulLSPFind", commons.homePage.getMaLSP());
		request.setAttribute("sanPhamList", forwardList);
		request.setAttribute("maxPage",maxPage);
		request.setAttribute("index",index_page);
		request.setAttribute("bestSeller",bestSeller);
	
		request.setAttribute("isHomePage", false);
	}

}
