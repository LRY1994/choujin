package com.bap.fee;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;
import java.util.*;

import com.bap.*;
import com.bap.comn.MySQLHelper;

public class AddFeeItem extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AddFeeItem() {
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
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		String itemId = (String) request.getParameter("FEE_ITEM_ID"), 
				itemName = (String) request.getParameter("FEE_ITEM_NAME"),
				businessInterfaceId = (String) request.getParameter("BUSINESS_INTERFACE"), 
				itcInterfaceId = (String) request.getParameter("ITC_INTERFACE"),
				partner_A_interfaceId = (String) request.getParameter("PARNER_A_INTERFACE"),
				partner_B_interfaceId = (String) request.getParameter("PARNER_B_INTERFACE");
		MySQLHelper mysql = new MySQLHelper();

	String sql = "insert into JW_FEE_ITEM_INFO values('" + itemId
						+ "','" + itemName + "','" + businessInterfaceId + "','"
						+ itcInterfaceId + "','" + partner_A_interfaceId + "','"
						+ partner_B_interfaceId + "')";
		
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
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	this.doGet(request, response);
	}

	/**
	 * Initialization of the servlet. <br>
	 * 
	 * @throws ServletException
	 *             if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
