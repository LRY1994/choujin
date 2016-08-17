package com.bap.login;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		String role=request.getParameter("role");
		List<String> info=new ArrayList<String>();
		if(userid==null||"".equals(userid)){
			info.add("用户id不能为空");
		}
		if(pwd==null||"".equals(pwd)){
			info.add("密码不能为空");
		}
		MySQLHelper mysql=null;
		try{
			String sql="select USER_PASSWORD,USER_TYPE  from JW_USER_INFO where USER_ID='"+userid+"'";
			System.out.println(sql);
			 mysql=new MySQLHelper();
			 
			 HttpSession session = request.getSession(); 
			ResultSet rs=mysql.Query(sql);
			if(rs.next()){
				System.out.println(rs.getString(1));
				System.out.println(pwd);
				if(!rs.getString(1).equals(pwd)){
					info.add("密码错误");
					request.setAttribute("info", info);
					request.getRequestDispatcher(path).forward(request, response);//跳转
				}else if(!rs.getString(2).equals(role)){
					info.add("没有该类型的用户");
					request.setAttribute("info", info);
					request.getRequestDispatcher(path).forward(request, response);//跳转
				}else{
				info.add("登录成功");
				session.setAttribute("userid",userid);
				session.setAttribute("usertype", role);
				response.sendRedirect("app/index.jsp");
				}
			}
			else {
				info.add("登录失败，该用户名不存在！");
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
