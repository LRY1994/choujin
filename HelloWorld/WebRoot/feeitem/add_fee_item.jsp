<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.* "%>
<%@ page import="com.bap.comn.MySQLHelper"%>


<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	System.out.println(path);
%>

<%request.setCharacterEncoding("GBK"); %>
    
	<%
		MySQLHelper mysql = new MySQLHelper();
		String sql = "SELECT USER_ID,USER_NAME FROM JW_USER_INFO";
	%>

<div class="container">
  <form action="AddFeeItem" method="post"> 
  <div class="form-group">
    <label for="FEE_ITEM_ID">酬金项ID</label>
    <input id="FEE_ITEM_ID" name="FEE_ITEM_ID" type="text" readonly="readonly" value="<%=MySQLHelper.GetGlobalUniqueID()%>" />
  </div>
  <div class="form-group">
    <label for="FEE_ITEM_NAME">酬金项名称</label>
    <input type="text"  name="FEE_ITEM_NAME" id="FEE_ITEM_NAME" autofocus required="required">
  </div>
 <div class="form-group">
    <label for="BUSINESS_INTERFACE">业务部门接口人</label>
    <select  name="BUSINESS_INTERFACE">

			<%
				ResultSet rs = mysql.Query(sql);
				while (rs.next()) {
			%>
			<option value="<%=rs.getString(1)%>"><%=rs.getString(1)%>-<%=rs.getString(2)%></option>
			<%
				}
			%>
	</select>
  </div>
  <div class="form-group">
    <label for="ITC_INTERFACE">业务支持部门接口人</label>
    <select id="ITC_INTERFACE" name="ITC_INTERFACE">
			<%
				rs = mysql.Query(sql);
				while (rs.next()) {
			%>
			<option value="<%=rs.getString(1)%>"><%=rs.getString(1)%>-<%=rs.getString(2)%></option>
			<%
				}
			%>
		</select> 
  </div>
  <div class="form-group">
    <label for="PARNER_A_INTERFACE">开发商A团队接口人</label>
    <select id="PARNER_A_INTERFACE" name="PARNER_A_INTERFACE">
			<%
				rs = mysql.Query(sql);
				while (rs.next()) {
			%>
			<option value="<%=rs.getString(1)%>"><%=rs.getString(1)%>-<%=rs.getString(2)%></option>
			<%
				}
			%>
	</select>
  </div>
  <div class="form-group">
    <label for="PARNER_B_INTERFACE">开发商B团队接口人</label>
    <select id="PARNER_B_INTERFACE" name="PARNER_B_INTERFACE">
			<%
				rs = mysql.Query(sql);
				while (rs.next()) {
			%>
			<option value="<%=rs.getString(1)%>"><%=rs.getString(1)%>-<%=rs.getString(2)%></option>
			<%
				}
			%>
	</select>
  </div>
  
  <button type="submit" class="btn btn-primary" >保存</button>
  <button  class="btn btn-default" data-dismiss="modal">取消</button>
</form>
	
	
	<%-- <form id="form1">
		<label>酬金项ID</label>
		<input id="FEE_ITEM_ID" type="text"	disabled="disabled" value="<%=MySQLHelper.GetGlobalUniqueID()%>" />
		 <label>酬金项名称</label>
		 <input id="FEE_ITEM_NAME" text="text"
			value="请输入"><br> 
			<label>业务部门接口人</label>
			<select
			id="BUSINESS_INTERFACE_NAME">

			<%
				 rs = mysql.Query(sql);
				while (rs.next()) {
			%>
			<option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
			<%
				}
			%>
		</select>
		 <br> 
		 <label>业支接口人</label>
		  <select id="ITC_INTERFACE_NAME">
			<%
				rs = mysql.Query(sql);
				while (rs.next()) {
			%>
			<option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
			<%
				}
			%>
		</select> 
		<br> 
		<label>开发商A团队接口人</label>
		 <select
			id="PARNER_A_INTERFACE_NAME">
			<%
				rs = mysql.Query(sql);
				while (rs.next()) {
			%>
			<option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
			<%
				}
			%>
		</select>
		 <br> <label>开发商B团队接口人</label> <select
			id="PARNER_B_INTERFACE_NAME">
			<%
				rs = mysql.Query(sql);
				while (rs.next()) {
			%>
			<option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
			<%
				}
			%>
		</select> <br>
	    <input type="button" value="保存" onclick="save_item();">
		<input type="button" value="取消">
	</form> --%>
	</div>
</body>
</html>
