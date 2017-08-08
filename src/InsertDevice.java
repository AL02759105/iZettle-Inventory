

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.backend.*;

/**
 * Servlet implementation class InsertDevice
 */
@WebServlet({ "/InsertDevice", "/I" })
public class InsertDevice extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertDevice() {
        super();
        // TODO Auto-generated constructor stub
    }
    

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if (request.getParameter("inpuType") == null) {
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views/NewEntry.jsp");
			dispatcher.forward(request,response);
		} 
		
	}

	/**
	 * 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String type = request.getParameter("inputType");
		String status = request.getParameter("inputStatus");
		String userID = request.getParameter("inputUser");
		String location= request.getParameter("inputLocation");
		String SN = request.getParameter("inputSN");
		String IMEI = request.getParameter("inputIMEI");
		String make = request.getParameter("inputMake");
		String model = request.getParameter("inputModel");
		String modelNumber = request.getParameter("inputModelNumber");
		String specification = request.getParameter("inputSpecification");
		Boolean encrypted = false;
		
		if (request.getParameter("inputEncrypted") != null) {
			encrypted = true;
			System.out.println("The device is encrypted.");
		} else {
			System.out.println("The device is not encrypted");
		}
		
		
		//Insert received information into DB
		int device_id = 0;
		int user_id = Integer.parseInt(userID);
		int result = 0;
		
		//create object device with methods to interact with the DB obtaining parameters acquired in this servlet
		Device device = new Device(); 
		
		// Inserts Device information to DB table device and retrieves the Autogenerated id
		device_id = device.setDevice(type, SN, status, encrypted, IMEI, location, make, model, modelNumber, specification); 
		
		System.out.println("Your device id is: ");
		System.out.println(device_id);
		
		//Inserts device id and user id to connection table for relational queries
		result = device.setIds(user_id, device_id);
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views/NewEntry.jsp");
		dispatcher.forward(request,response);
		}
	
	}
