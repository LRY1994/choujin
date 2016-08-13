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

	 
				

				<button class="btn btn-info" data-toggle="modal" data-target="#add2">添加项目</button>

				<div class="table-responsive">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>计划进度ID</th>
								<th style="display:none">酬金项ID</th>
								<th>酬金项名称</th>
								<th>酬金账期</th>
								<th>计划开始时间</th>
								<th>计划结束时间</th>
								<th>状态</th>
								<th>备注</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody id="itemContainer">							
									
									<% MySQLHelper mysql = new MySQLHelper();

									String sql = "SELECT  A.SCHEDULE_ID,  A.ITEM_ID,  B.ITEM_NAME,  A.MONTH,"
									         +"   A.START_DATE,  A.END_DATE, A.STATUS,  A.NOTE"
									         +"  FROM "
											 + "    JW_FEE_PLAN_SCHEDULE A, "
									         + "    JW_FEE_ITEM_INFO B " 
									        
											 + "WHERE "
											 + "    A.ITEM_ID = B.ITEM_ID; ";
									//System.out.println(sql);		
								ResultSet rs = mysql.Query(sql);
								 
								 
								
								while (rs.next()) {
							%>
							<tr>
								<td><%=rs.getString(1)%></td>								
								<td style="display:none"><%=rs.getString(2)%></td>
								<td><%=rs.getString(3)%></td>
								<td><%=rs.getString(4)%></td>
								<td><%=rs.getDate(5)%></td>
								<td><%=rs.getDate(6)%></td>
								<td><%=rs.getString(7)%></td>
								<td><%=rs.getString(8)%></td>
								<td>
									<button class="btn btn-warning op-edit" data-toggle="modal"
										data-target="#edit2" onclick="edit_plan($(this))">修改</button>
									<button class="btn btn-danger op-del" data-toggle="modal"
										data-target="#delete2" onclick="delete_plan($(this))">删除</button>

								</td>
							</tr>
							<%
								}
								mysql.Close();
								
							
							%>
						</tbody>
					</table>
					
					<!-- 修改模态框 -->
					<div class="modal fade" id="edit2" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="myModalLabel">修改计划进度</h4>
								</div>

								<div class="modal-body">

									 <jsp:include page="edit_plan.jsp" /> 
									
								</div>

							</div>
						</div>
					</div>

<script>     
    function deletePlan() {                 
            $.ajax({  
                type : 'post',  
                url : 'DeletePlan',  
                dataType : 'text',  
                data : $('#f6').serialize(),  
                success : function (data) {  
                	if(data==1)
                    alert("删除成功");
                	else alert("删除失败");
                },
                 error : function (XMLHttpRequest, textStatus, errorThrown) {  
                    alert(errorThrown);  
                }   
            });  
              
    } 
       
  
        
</script>
					<!-- 删除模态框 -->
					<div class="modal fade" id="delete2" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="myModalLabel">删除计划进度</h4>
								</div>

								<div class="modal-body">
									
									<form id="f6" method="post">
										<p>
											确认删除此计划进度<input name="del_Id2" id="del_Id2"
												readonly="readonly" style="border:none" />？
										</p>
										<button class="btn btn-danger " type="submit" onclick="deletePlan()">删除</button>
										<button class="btn btn-default" data-dismiss="modal">取消</button>
									</form>
								</div>

							</div>
						</div>
					</div>




					<!-- 添加模态框 -->
					<div class="modal fade" id="add2" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="myModalLabel">添加计划进度</h4>
								</div>

								<div class="modal-body">
									<jsp:include page="add_plan.jsp" />

								</div>

							</div>
						</div>
					</div>


				</div>
	
	<script>
	function edit_plan(ele) {		
		var $child=ele.parent().parent().children();
		$("#SCHEDULE_ID2").val($child[0].innerHTML);				
		$("#ITEM2").get(0).options[0].value=$child[1].innerHTML;
		$("#ITEM2").get(0).options[0].text=$child[2].innerHTML;
		$("#ITEM2").get(0).options[0].selected=true;
		$("#MONTH2").val($child[3].innerHTML);
		$("#START_DATE2").val($child[4].innerHTML);
		$("#END_DATE2").val($child[5].innerHTML);		
		$("#STATUS2").get(0).options[0].text=$child[6].innerHTML;
		$("#STATUS2").get(0).options[0].value=$child[6].innerHTML;
		$("#STATUS2").get(0).options[0].selected=true;		
		$("#NOTE2").val($child[7].innerHTML);
	   
	}
	function delete_plan(ele) {
		var $child=ele.parent().parent().children();
		$("#del_Id2").attr("value",$child[0].innerHTML);
		
	} 
	
</script>
