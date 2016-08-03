package com.bap.fee;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bap.comn.MySQLHelper;

public class SearchFeeItem extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public SearchFeeItem() {
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
       
		
		String itemId = (String) request.getParameter("fee_item_id");
				
		MySQLHelper mysql = new MySQLHelper();

		String sql = "SELECT " + "    A.ITEM_ID, " + "    A.ITEM_NAME, "
				+ "    A.BUSINESS_INTERFACE_ID, "
				+ "    B.USER_NAME AS BUSINESS_INTERFACE_NAME, "
				+ "    B.USER_NAME, " + "    A.ITC_INTERFACE_ID, "
				+ "	   C.USER_NAME AS ITC_INTERFACE_NAME, "
				+ "    C.USER_NAME, "
				+ "    A.PARNER_A_INTERFACE_ID, "
				+ "    D.USER_NAME AS PARNER_A_INTERFACE_NAME, "
				+ "    D.USER_NAME, " + "	A.PARNER_B_INTERFACE_ID, "
				+ "    E.USER_NAME AS PARNER_B_INTERFACE_NAME, "
				+ "    E.USER_NAME " + "FROM "
				+ "    JW_FEE_ITEM_INFO A, " + "    JW_USER_INFO B, "
				+ "    JW_USER_INFO C, " + "	JW_USER_INFO D, "
				+ "    JW_USER_INFO E  " + "WHERE "
				+ "    A.BUSINESS_INTERFACE_ID = B.USER_ID "
				+ "    AND A.ITC_INTERFACE_ID = C.USER_ID "
				+ "    AND A.PARNER_A_INTERFACE_ID = D.USER_ID "
				+ "    AND A.PARNER_B_INTERFACE_ID = E.USER_ID "
				+ "    AND A.ITEM_ID='"+itemId+"'" ;
		//System.out.println(sql);
	response.setContentType("text/html;charset=utf-8");
	PrintWriter out = response.getWriter();
	
		try{
							
			ResultSet rs = mysql.Query(sql);
			if (rs.next()) {							
				String txthtml="<tr>" +
			             "<td>"+rs.getString(1)+"</td>"+
			             "<td>"+rs.getString(2)+"</td>"+
			             "<td>"+rs.getString(3)+'-'+rs.getString(4)+"</td>"+
			             "<td>"+rs.getString(6)+'-'+rs.getString(7)+"</td>"+
			             "<td>"+rs.getString(9)+'-'+rs.getString(10)+"</td>"+
			             "<td>"+rs.getString(12)+'-'+rs.getString(13)+"</td>"+
			             "<td>"+
							"<button class='btn btn-warning' data-toggle='modal'"+
								"data-target='#edit' onclick='edit_item($(this))'>修改</button>"+
							"<button class='btn btn-danger' data-toggle='modal'"+
								"data-target='#delete'onclick='delete_item($(this))'>删除</button>"+

						"</td>"+
					"</tr>";
			out.print(txthtml);
			} else {
				out.print("no such item");	
				
			}						
			
		}catch(Exception e){		
				e.printStackTrace();					
		}finally{
			if(out!=null){
				out.flush();
				out.close();
			}
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
