<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="java.sql.* "%>
<%@ page import="com.bap.comn.MySQLHelper"%>


<%
	String path = request.getContextPath();//  /HelloWorld

	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";//http://localhost:8080/HelloWorld/
	//System.out.println(basePath);
%>

	 
				

				<div class="table-responsive">
					<table class="table table-striped">
						<thead>
							<tr>
							    <th>开发商ID</th>
								<th>酬金项ID</th>								
								<th>酬金项名称</th>
								<th>结算时间</th>

							</tr>
						</thead>
						<tbody id="itemContainer">							
									
									<% MySQLHelper mysql = new MySQLHelper();

									String sql = "SELECT " + "    A.PARNER_INTERFACE_ID, " + "    B.ITEM_ID, "
											+ "    B.ITEM_NAME, "
											+ "    A.END_DATE-A.START_DATE "
										    + "FROM "
											+ "    JW_FEE_ACTUAL_SCHEDULE A, " 
										    + "    JW_FEE_ITEM_INFO B "
										   
											 + "WHERE "
											+ "    A.ITEM_ID = B.ITEM_ID ;";
											
								ResultSet rs = mysql.Query(sql);
								 
							System.out.println(sql);	 
								
								while (rs.next()) {
							%>
							<tr>
								<td><%=rs.getString(1)%></td>
								
								<td><%=rs.getString(2)%></td>
								<td><%=rs.getString(3)%></td>
								<td><%=rs.getString(4)%></td>								
							</tr>
							<%
								}
								mysql.Close();
								
							
							%>
						</tbody>
					</table>
				</div>
					