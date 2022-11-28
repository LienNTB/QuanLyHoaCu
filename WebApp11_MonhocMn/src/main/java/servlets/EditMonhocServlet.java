package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Monhoc;
import conn.DBConnection;
import utils.DBUtils;

/**
 * Servlet implementation class EditMonhocServlet
 */
@WebServlet(urlPatterns= {"/editMonhoc"})
public class EditMonhocServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditMonhocServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = null;
		 String errorString = null;
		try {
			conn = DBConnection.getConnection();
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String idStr = (String) request.getParameter("id");
		int id =0;			 
		id = Integer.parseInt(idStr);
		 Monhoc mh = null;
	
		 
		 try {
			mh = DBUtils.getMonhoc(conn, id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			errorString = e.getMessage();
		}
		 
		 // nếu môn học ko có thì trở về trang cũ (ko tồn tại mh này nên ko edit đc)
		 if(errorString != null && mh == null) {
			 response.sendRedirect(request.getServletPath() + "/monhocList");
			 return;
		 }
		 
		 request.setAttribute("errorString",errorString);
		 request.setAttribute("monhoc", mh);
		 RequestDispatcher dispatcher = request.getServletContext()
	                .getRequestDispatcher("/WEB-INF/views/editMonhocView.jsp");
	        dispatcher.forward(request, response);
		 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = null;
		String errorString = null;
		try {
			conn = DBConnection.getConnection();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String idStr = (String)request.getParameter("maso_monhoc");
		String ten_monhoc = new String(request.getParameter("ten_monhoc").getBytes("ISO-8859-1"), "UTF-8");
		String sotinchiStr = (String)request.getParameter("sotinchi");
		
		int maso_monhoc = 0;
		maso_monhoc = Integer.parseInt(idStr);
		int sotinchi = 0;
		try {			
			sotinchi = Integer.parseInt(sotinchiStr);			
		}
		catch(Exception e){
			errorString = "Dữ liệu nhập vào phải là số!";
		}
		
		
		Monhoc mh = new Monhoc(maso_monhoc,ten_monhoc,sotinchi);
		try {
			DBUtils.updateMonhoc(conn, mh);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			errorString = e.getMessage();
		}
		
		request.setAttribute("errorString", errorString);
		request.setAttribute("monhoc", mh);
		
		if(errorString != null) {
			  RequestDispatcher dispatcher = request.getServletContext()
	                    .getRequestDispatcher("/WEB-INF/views/editMonhocView.jsp");
	            dispatcher.forward(request, response);
		}
		else {
	            response.sendRedirect(request.getContextPath() + "/monhocList");
	    }
	}

}
