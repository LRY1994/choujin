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

 	 
				<!-- <form class="form-inline" action="#">
					<div class="form-group">
						<label for="fee_item_id">输入项目酬金ID</label>
						 <input type="text" class="form-control" id="fee_item_id" name="fee_item_id" placeholder="ID">
					</div>
					<button type="submit" class="btn btn-default" id="searchId" onclick="serachId()">Search</button>
				</form> -->

				<button class="btn btn-info" data-toggle="modal" data-target="#add">添加项目</button>

				<div class="table-responsive">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>酬金项ID</th>
								<th>酬金项名称</th>
								<th>业务部门接口人</th>
								<th>业支接口人</th>
								<th>开发商A接口人</th>
								<th>开发商B接口人</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody id="itemContainer">							
									
									<% MySQLHelper mysql = new MySQLHelper();

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
											+ "    AND A.PARNER_B_INTERFACE_ID = E.USER_ID ;";
								ResultSet rs = mysql.Query(sql);
								 
								 
								
								while (rs.next()) {
							%>
							<tr>
								<td><%=rs.getString(1)%></td>
								<td><%=rs.getString(2)%></td>
								<td><%=rs.getString(3)%>-<%=rs.getString(4)%></td>
								<td><%=rs.getString(6)%>-<%=rs.getString(7)%></td>
								<td><%=rs.getString(9)%>-<%=rs.getString(10)%></td>
								<td><%=rs.getString(12)%>-<%=rs.getString(13)%></td>
								<td>
									<button class="btn btn-warning op-edit" data-toggle="modal"
										data-target="#edit" onclick="edit_item($(this))">修改</button>
									<button class="btn btn-danger op-del" data-toggle="modal"
										data-target="#delete" onclick="delete_item($(this))">删除</button>

								</td>
							</tr>
							<%
								}
								mysql.Close();
								
							
							%>
						</tbody>
					</table>
					
					<!-- 修改模态框 -->
					<div class="modal fade" id="edit" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="myModalLabel">修改酬金项目</h4>
								</div>

								<div class="modal-body">

									 <jsp:include page="edit_fee_item.jsp" /> 
									
								</div>

							</div>
						</div>
					</div>


					<!-- 删除模态框 -->
					<div class="modal fade" id="delete" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="myModalLabel">删除酬金项目</h4>
								</div>

								<div class="modal-body">
									<!-- <form action="../feeitem/delete_fee_item.jsp" method="post"> -->
									<form action="DeleteFeeItem" method="post">
										<p>
											确认删除此项目<input name="del_itemId" id="del_itemId"
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
					<div class="modal fade" id="add" tabindex="-1" role="dialog"
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
									<jsp:include page="add_fee_item.jsp" />

								</div>

							</div>
						</div>
					</div>


				</div>
	
	<script>
	function edit_item(ele) {		
		var $child=ele.parent().parent().children();
		$("#itemId").attr("value",$child[0].innerHTML);
		$("#itemName").attr("value",$child[1].innerHTML);
	    var arr=$child[2].innerHTML.split('-');
		$("#businessInterface").get(0).options[0].value=arr[0];
		$("#businessInterface").get(0).options[0].text=$child[2].innerHTML;
		$("#businessInterface").get(0).options[0].selected=true;
		arr=$child[3].innerHTML.split('-');
		$("#itcInterface").get(0).options[0].value=arr[0];
		$("#itcInterface").get(0).options[0].text=$child[3].innerHTML;
		$("#itcInterface").get(0).options[0].selected=true;
		arr=$child[4].innerHTML.split('-');
		$("#partner_A_interface").get(0).options[0].value=arr[0];
		$("#partner_A_interface").get(0).options[0].text=$child[4].innerHTML;
		$("#partner_A_interface").get(0).options[0].selected=true;
		arr=$child[5].innerHTML.split('-');
		$("#partner_B_interface").get(0).options[0].value=arr[0];
		$("#partner_B_interface").get(0).options[0].text=$child[5].innerHTML;
		$("#partner_B_interface").get(0).options[0].selected=true;
	}
	function delete_item(ele) {
		var $child=ele.parent().parent().children();
		$("#del_itemId").attr("value",$child[0].innerHTML);
		
	} 
	function serachId(){
		var id=$("#fee_item_id").val();
		
		$.ajax({
			type:"POST",
			url:"../SearchFeeItem?fee_item_id="+id,
			dataType:"html",
			success:function(data){
				$("#itemContainer").html(data);
			}
		});
	}
</script>
