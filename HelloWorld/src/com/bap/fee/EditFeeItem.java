package com.bap.fee;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bap.comn.MySQLHelper;

public class EditFeeItem extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public EditFeeItem() {
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

		String itemId = (String) request.getParameter("itemId"), 
				itemName = (String)request.getParameter("itemName"),
				businessInterfaceId = (String) request.getParameter("businessInterface"), //get的是value值
				itcInterfaceId = (String) request.getParameter("itcInterface"), 
				partner_A_interfaceId = (String) request.getParameter("partner_A_interface"), 
				partner_B_interfaceId = (String) request.getParameter("partner_B_interface");

		MySQLHelper mysql = new MySQLHelper();

		String sql = "UPDATE JW_FEE_ITEM_INFO SET " + "ITEM_NAME='"
				+ itemName + "',BUSINESS_INTERFACE_ID='"
				+ businessInterfaceId + "',ITC_INTERFACE_ID='"
				+ itcInterfaceId + "',PARNER_A_INTERFACE_ID='"
				+ partner_A_interfaceId + "',PARNER_B_INTERFACE_ID='"
				+ partner_B_interfaceId + "' WHERE ITEM_ID='" + itemId
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
