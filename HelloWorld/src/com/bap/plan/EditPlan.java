package com.bap.plan;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bap.comn.MySQLHelper;

public class EditPlan extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public EditPlan() {
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

		String SCHEDULE_ID = (String) request.getParameter("SCHEDULE_ID2"), 
				ITEM_ID = (String)request.getParameter("ITEM2"),
				MONTH = (String) request.getParameter("MONTH2"), 
				START_DATE = (String) request.getParameter("START_DATE2"), 
				END_DATE = (String) request.getParameter("END_DATE2"), 
				STATUS = (String) request.getParameter("STATUS2"), 
				NOTE = (String) request.getParameter("NOTE2");

		MySQLHelper mysql = new MySQLHelper();

		String sql = "UPDATE JW_FEE_PLAN_SCHEDULE SET "
		+  "ITEM_ID='"+ ITEM_ID 
		+ "',MONTH='"+ MONTH
		+ "',START_DATE='"+ START_DATE 
		+ "',END_DATE='"+ END_DATE 
		+ "',STATUS='"+ STATUS
		+ "',NOTE='"+ NOTE
		+ "' WHERE SCHEDULE_ID='" + SCHEDULE_ID				
		+ "'";
		
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		try{
		
			System.out.println(sql);						
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
