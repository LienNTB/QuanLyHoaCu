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
import beans.SinhVien;
import conn.DBConnection;
import utils.DBUtils;

/**
 * Servlet implementation class CreateMonhocServlet
 */
@WebServlet(urlPatterns={"/createMonhoc"})
public class CreateMonhocServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateMonhocServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 RequestDispatcher dispatcher = request.getServletContext()
	                .getRequestDispatcher("/WEB-INF/views/createMonhocView.jsp");
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
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
        String maso_monhocStr= (String)request.getParameter("maso_monhoc");
        String ten_monhoc = new String(request.getParameter("ten_monhoc").getBytes("ISO-8859-1"), "UTF-8");
        String sotinchiStr = new String(request.getParameter("sotinchi").getBytes("ISO-8859-1"), "UTF-8");
        
        int maso_monhoc = Integer.parseInt(maso_monhocStr);
        int sotinchi = Integer.parseInt(sotinchiStr);
        
        Monhoc mh = new Monhoc(maso_monhoc,ten_monhoc,sotinchi);  
 
        try {
            DBUtils.insertMonhoc(conn, mh);
        } catch (SQLException e) {
            e.printStackTrace();
            errorString = e.getMessage();
        }
        // LÆ°u thÃ´ng tin vÃ o request attribute trÆ°á»›c khi forward sang views.
        request.setAttribute("errorString", errorString);
       
        // Náº¿u cÃ³ lá»—i forward sang trang edit.
        if (errorString != null) {
            RequestDispatcher dispatcher = request.getServletContext()
                    .getRequestDispatcher("/WEB-INF/views/createMonhocView.jsp");
            dispatcher.forward(request, response);
        }
        // Náº¿u má»�i thá»© tá»‘t Ä‘áº¹p.
        // Redirect sang trang danh sÃ¡ch sáº£n pháº©m.
        else {
            response.sendRedirect(request.getContextPath() + "/monhocList");
        }
	}

}
