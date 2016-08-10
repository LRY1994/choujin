package com.bap.login;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bap.comn.MySQLHelper;


public class LoginCheck extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public LoginCheck() {
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

		String path="login/index.jsp";
		String userid=request.getParameter("userid");
		String pwd=request.getParameter("password");
		List<String> info=new ArrayList<String>();
		if(userid==null||"".equals(userid)){
			info.add("用户id不能为空");
		}
		if(pwd==null||"".equals(pwd)){
			info.add("密码不能为空");
		}
		MySQLHelper mysql=null;
		try{
			String sql="select * from JW_USER_INFO where USER_ID='"+userid+"' and USER_PASSWORD='"+pwd+"'";
			System.out.println(sql);
			 mysql=new MySQLHelper();
			
			ResultSet rs=mysql.Query(sql);
			if(rs.next()){
				info.add("登录成功");
				response.sendRedirect("app/index.jsp");
			}
			else {
				info.add("登录失败，错误的用户名和密码！");
				request.setAttribute("info", info);
				request.getRequestDispatcher(path).forward(request, response);//跳转
			}
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
