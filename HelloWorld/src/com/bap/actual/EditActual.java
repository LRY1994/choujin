package com.bap.actual;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bap.comn.MySQLHelper;

public class EditActual extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public EditActual() {
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
		 HttpSession session = request.getSession();
		 String role=(String)session.getAttribute("usertype");
		 String id=(String)session.getAttribute("userid");
		 
		String SCHEDULE_ID = (String) request.getParameter("SCHEDULE_ID"), 
				PLAN_SCHEDULE_ID = (String)request.getParameter("PLAN_SCHEDULE_ID"), 
				START_DATE = (String) request.getParameter("START_DATE"), 
				END_DATE = (String) request.getParameter("END_DATE"), 
				STATUS = (String) request.getParameter("STATUS"), 
				NOTE = (String) request.getParameter("NOTE"),
				PARNER_INTERFACE_ID;
		
		if(role=="1"||"1".equals(role)){
		PARNER_INTERFACE_ID = (String) request.getParameter("PARNER_INTERFACE");
		}else{
			PARNER_INTERFACE_ID=id;
		}
		MySQLHelper mysql = new MySQLHelper();

		String sql = "UPDATE JW_FEE_ACTUAL_SCHEDULE SET "
		+ " PLAN_SCHEDULE_ID='"+ PLAN_SCHEDULE_ID 
		+ "', PARNER_INTERFACE_ID='"+ PARNER_INTERFACE_ID
		+ "',START_DATE='"+ START_DATE 
		+ "',END_DATE='"+ END_DATE 
		+ "',STATUS='"+ STATUS
		+ "',NOTE='"+ NOTE
		+ "' WHERE SCHEDULE_ID='" + SCHEDULE_ID				
		+ "'";
		System.out.println(sql);
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		try{
		
			System.out.println(sql);						
			int flag = mysql.Update(sql);
			if (flag == 1) {							
				out.println("edit successful");				
				
			} else {
				out.println("edit fail");	
				
			}
			response.setHeader("refresh", "0.5;URL=app/index.jsp");
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
