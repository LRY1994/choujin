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
<script>     
    function editFeeItem() {                 
            $.ajax({  
                type : 'post',  
                url : 'EditFeeItem',  
                dataType : 'text',  
                data : $('#f2').serialize(),  
                success : function (data) {  
                	if(data==1)
                    alert("修改i成功");
                	else alert("修改失败");
                },
                 error : function (XMLHttpRequest, textStatus, errorThrown) {  
                    alert(errorThrown);  
                }   
            });  
              
    } 
       
  
        
</script>
<div class="container">
	
	<form  method="post" id="f2">
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
		<button type="submit" class="btn btn-primary" onclick="editFeeItem()">保存</button>
		<button class="btn btn-default" data-dismiss="modal">取消</button>
		<%
			mysql.Close();
		%>
	</form>
</div>
