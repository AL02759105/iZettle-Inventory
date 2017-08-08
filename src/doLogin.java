

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.backend.DBConnect;

/**
 * Servlet implementation class doLogin
 */
@WebServlet({"/doLogin", "/doL"})
public class doLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public doLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		
        if (request.getParameter("inputEmail") != null && request.getParameter("inputPassword") != null) {
    		
        	String email = request.getParameter("inputEmail");
    		String password = request.getParameter("inputPassword");
    		
	        try {
				Connection conn = null;
	
				conn = DBConnect.getConnection();
				
				String sql = "SELECT user_email, password FROM user WHERE user_email = ? and password= ?";
			 
			      PreparedStatement pstm = conn.prepareStatement(sql);
			      pstm.setString(1, email);
			      pstm.setString(2, password);
			      ResultSet rs = pstm.executeQuery();
			      
			      if (rs.next()) {
			    	  request.getRequestDispatcher("/views/Landing.jsp").forward(request,response);
			      } else {
			    	  request.getRequestDispatcher("/views/Login.jsp").forward(request,response);
			      }
	        }catch (SQLException e) {
	            e.printStackTrace();
	        } 
	        	
        } else {
        	request.getRequestDispatcher("/views/Login.jsp").forward(request,response);
        }
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
