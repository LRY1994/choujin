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
<script>     
    function addFeeItem() {                 
            $.ajax({  
                type : 'post',  
                url : 'AddFeeItem',  
                dataType : 'text',  
                data : $('#f1').serialize(),  
                success : function (data) {  
                	if(data==1)
                    alert("添加成功");
                	else alert("添加失败");
                },
                 error : function (XMLHttpRequest, textStatus, errorThrown) {  
                    alert(errorThrown);  
                }   
            });  
              
    } 
       
  
        
</script>
<div class="container">
  <form  method="post" id="f1"> 
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
  
  <button type="submit" class="btn btn-primary" onclick="addFeeItem()">保存</button>
  <button  class="btn btn-default" data-dismiss="modal">取消</button>
</form>
	
	
	
	</div>
</body>
</html>
