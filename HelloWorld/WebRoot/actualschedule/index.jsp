<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="java.sql.* "%>
<%@ page import="com.bap.comn.MySQLHelper"%>


<%
	String path = request.getContextPath();//  /HelloWorld

	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";//http://localhost:8080/HelloWorld/
	//System.out.println(basePath);
	String role=(String)session.getAttribute("usertype");
	String userid=(String)session.getAttribute("userid");
%>
	 				
             
				<button class="btn btn-info" data-toggle="modal" data-target="#add1">添加项目</button>
            
            
				<div class="table-responsive">
			<%
			if(role=="1"||"1".equals(role)){
			%>
					<table class="table table-striped">
						<thead>
							<tr>
								<th>实际进度ID</th>
								<th>计划进度ID</th>								
								<th>开发商接口人</th>
								<th>实际开始时间</th>
								<th>实际结束时间</th>
								<th>状态</th>
								<th>备注</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody id="itemContainer">							
									
									<% MySQLHelper mysql = new MySQLHelper();

									String sql = "SELECT  A.SCHEDULE_ID, A.PLAN_SCHEDULE_ID, A.PARNER_INTERFACE_ID, B.USER_NAME,"
									        +"A.START_DATE,  A.END_DATE, A.STATUS , A.NOTE"
									         +"  FROM "
											+ "    JW_FEE_ACTUAL_SCHEDULE A, "
									         + "   JW_USER_INFO B " 									       
											 + "WHERE "											
											+ "    A.PARNER_INTERFACE_ID = B.USER_ID ";
									System.out.println(sql);		
								ResultSet rs = mysql.Query(sql);
								 
								 
								
								while (rs.next()) {
							%>
							<tr>
								<td><%=rs.getString(1)%></td>																
								<td><%=rs.getString(2)%></td>
								<td><%=rs.getString(3)%>-<%=rs.getString(4) %></td>
								<td><%=rs.getDate(5)%></td>
								<td><%=rs.getDate(6)%></td>
								<td><%=rs.getString(7)%></td>
								<td><%=rs.getString(8)%></td>
								<td>
									<button class="btn btn-warning op-edit" data-toggle="modal"
										data-target="#edit1" onclick="edit_actual($(this))">修改</button>
									<button class="btn btn-danger op-del" data-toggle="modal"
										data-target="#delete1" onclick="delete_actual($(this))">删除</button>

								</td>
							</tr>
							<%
								}
								mysql.Close();
								
							
							%>
						</tbody>
					</table>
			<%}else { %>
			         <table class="table table-striped">
						<thead>
							<tr>
								<th>实际进度ID</th>
								<th>计划进度ID</th>																
								<th>实际开始时间</th>
								<th>实际结束时间</th>
								<th>状态</th>
								<th>备注</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody id="itemContainer">							
									
									<% MySQLHelper mysql = new MySQLHelper();

									String sql = "SELECT  A.SCHEDULE_ID, A.PLAN_SCHEDULE_ID, "
									         +"A.START_DATE,  A.END_DATE, A.STATUS , A.NOTE"
									         +"  FROM "
											 + "    JW_FEE_ACTUAL_SCHEDULE A "									         									       
											 + "WHERE "																			
											 +"    A.PARNER_INTERFACE_ID = '"+userid+"'";
									System.out.println(sql);		
								ResultSet rs = mysql.Query(sql);
								 
								 
								
								while (rs.next()) {
							%>
							<tr>
								<td><%=rs.getString(1)%></td>																
								<td><%=rs.getString(2)%></td>								
								<td><%=rs.getDate(3)%></td>
								<td><%=rs.getDate(4)%></td>
								<td><%=rs.getString(5)%></td>
								<td><%=rs.getString(6)%></td>
								<td>
									<button class="btn btn-warning op-edit" data-toggle="modal"
										data-target="#edit1" onclick="edit_actual($(this))">修改</button>
									<button class="btn btn-danger op-del" data-toggle="modal"
										data-target="#delete1" onclick="delete_actual($(this))">删除</button>

								</td>
							</tr>
							<%
								}
								mysql.Close();
								
							
							%>
						</tbody>
					</table>
					<%} %>
					
					<!-- 修改模态框 -->
					<div class="modal fade" id="edit1" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="myModalLabel">修改进度</h4>
								</div>

								<div class="modal-body">

									 <jsp:include page="edit_actual.jsp" /> 
									
								</div>

							</div>
						</div>
					</div>


					<!-- 删除模态框 -->
					<div class="modal fade" id="delete1" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="myModalLabel">删除进度</h4>
								</div>

								<div class="modal-body">
									
									<form action="DeleteActual" method="post">
										<p>
											确认删除此实际进度<input name="del_Id" id="del_Id"
												readonly="readonly" style="border:none" />？
										</p>
										<button class="btn btn-danger " type="submit">删除</button>
										<button class="btn btn-default" data-dismiss="modal">取消</button>
									</form>
								</div>

							</div>
						</div>
					</div>




					<!-- 添加模态框 -->
					<div class="modal fade" id="add1" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="myModalLabel">添加酬金项目</h4>
								</div>

								<div class="modal-body">
									<jsp:include page="add_actual.jsp" />

								</div>

							</div>
						</div>
					</div>


				</div>
	
	<script>
	function edit_actual(ele) {		
		var $child=ele.parent().parent().children();
		$("#SCHEDULE_ID").val($child[0].innerHTML);
		$("#PLAN_SCHEDULE_ID").attr("value",$child[1].innerHTML);		
		var arr=$child[2].innerHTML.split('-');	 
		$("#PARNER_INTERFACE").get(0).options[0].value=arr[0];
		$("#PARNER_INTERFACE").get(0).options[0].text=arr[1];
		$("#PARNER_INTERFACE").get(0).options[0].selected=true;		
		$("#START_DATE").val($child[3].innerHTML);
		$("#END_DATE").val($child[4].innerHTML);
		$("#NOTE").val($child[6].innerHTML);					   
	}
	function delete_actual(ele) {
		var $child=ele.parent().parent().children();
		$("#del_Id").attr("value",$child[0].innerHTML);
		
	} 
	
</script>
