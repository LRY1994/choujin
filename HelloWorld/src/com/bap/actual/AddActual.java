package com.bap.actual;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bap.comn.MySQLHelper;

public class AddActual extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AddActual() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		String scheduleId = (String) request.getParameter("SCHEDULE_ID"), 
				planscheduleid = (String) request.getParameter("PLAN_SCHEDULE_ID"),
			    parnerinterface = (String) request.getParameter("PARNER_INTERFACE"),			    
				start = (String) request.getParameter("START_DATE"),
				end = (String) request.getParameter("END_DATE"),
				status = (String) request.getParameter("STATUS"),
				note=(String)request.getParameter("NOTE");
		        
		MySQLHelper mysql = new MySQLHelper();

	String sql = "insert into JW_FEE_ACTUAL_SCHEDULE values('" + scheduleId
						+ "','" + planscheduleid + "','" + parnerinterface + "','"
						+ start + "','" + end + "','"
						+ status +"','"+note+ "')";
		
	PrintWriter out = response.getWriter();
	
		try{
		
			//System.out.println(sql);						
			int flag = mysql.Update(sql);
			out.println(flag);
			out.flush();
			out.close();
			
		}catch(Exception e){		
				e.printStackTrace();					
		}finally{
			mysql.Close();
				
		}
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
