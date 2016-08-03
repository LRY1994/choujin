<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.bap.fee.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.bap.comn.MySQLHelper"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<%
	/*  String sql= "SELECT " + "    A.ITEM_ID, " + "    A.ITEM_NAME, "
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
			+ "    AND A.PARNER_B_INTERFACE_ID = E.USER_ID ;"; */

	//+ "    AND A.ITEM_ID = '" + 1 + "';";
	//out.print(sql1);
	/*ResultSet rs1 = mysql.Query(sql1);
	rs1.next(); */
	//sql2="SELECT USER_CHIANESENAME FROM JW_USER_INFO WHERE USER_ID="

	MySQLHelper mysql = new MySQLHelper();
	String sql = "SELECT USER_ID,USER_NAME FROM JW_USER_INFO";
	ResultSet rs = null;
	/* List<String> result=new ArrayList<String>();
	while(rs.next()){ 
	List<String> content=new ArrayList<String>();
	for(int i=1;i<=2;i++){
	content.add(rs.getString(i));
	}
	result.add(content);
	}
	int len=result.size(); */
%>
<div class="container">
	<!-- <form action="../feeitem/edit_save.jsp" method="post"> -->
	<form action="EditFeeItem" method="post">
		<div class="form-group">
			<label for="itemId">酬金项ID</label> 
			<input name="itemId" id="itemId"
				type="text" readonly="readonly" style="border:none" />
		</div>
		<div class="form-group">
			<label for="itemName">酬金项名称</label> 
			<input type="text"
				name="itemName" id="itemName" style="width:300px;" />
		</div>
		<div class="form-group">
			<label for="businessInterface">业务部门接口人</label>
			 <select name="businessInterface"  id="businessInterface">
				<option></option>
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
			<label for="itcInterface">业务支持部门接口人</label> 
			<select name="itcInterface" id="itcInterface">
				<option></option>
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
			<label for="partner_A_interface">开发商A团队接口人</label> 
			<select name="partner_A_interface" id="partner_A_interface">
				<option></option>
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
			<label for="partner_B_interface">开发商B团队接口人</label> 
			<select name="partner_B_interface" id="partner_B_interface">
				<option></option>
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
		<input type="hidden" id="hide" name="hide" />
		<button type="submit" class="btn btn-primary">保存</button>
		<button class="btn btn-default" data-dismiss="modal">取消</button>
		<%
			mysql.Close();
		%>
	</form>
</div>
