<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.* "%>
<%@ page import="com.bap.comn.MySQLHelper"%>


<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>


<%request.setCharacterEncoding("GBK"); %>
    
	<%
		MySQLHelper mysql = new MySQLHelper();
		String sql = "SELECT SCHEDULE_ID FROM JW_FEE_PLAN_SCHEDULE ";
		ResultSet rs=mysql.Query(sql);
		String sql2="SELECT USER_ID,USER_NAME FROM JW_USER_INFO";
		ResultSet rs2=mysql.Query(sql2);
		String role=(String)session.getAttribute("usertype");
		String userid=(String)session.getAttribute("userid");
	%>
	<script>     
    function addActual() {                 
            $.ajax({  
                type : 'post',  
                url : 'AddActual',  
                dataType : 'text',  
                data : $('#f7').serialize(),  
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
  <form id="f7" method="post"> 
  <div class="form-group">
    <label for="SCHEDULE_ID">实际进度ID</label>
    <input name="SCHEDULE_ID" type="text" readonly="readonly" value="<%=MySQLHelper.GetGlobalUniqueID()%>" />
  </div>
  <div class="form-group">
    <label for="PLAN_SCHEDULE_ID">计划进度ID</label>
    <select  name="PLAN_SCHEDULE_ID" >
       <%  while(rs.next()){
       %> 
           <option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>
    	<%
       }
    	%>   
       
    </select>
  </div>
  <% if(role=="1"||"1".equals(role)){%>
 <div class="form-group">
    <label for="PARNER_INTERFACE">开发商接口人</label>
    <select  name="PARNER_INTERFACE" >
       <%  while(rs2.next()){
       %> 
           <option value="<%=rs2.getString(1)%>"><%=rs2.getString(2)%></option>
    	<%
       }
    	%>   
       
    </select>  
  </div>
  <%}else{ %>
  <div class="form-group">
    <label for="START_DATE">实际开始时间</label>
     <input type="date" name="START_DATE" >
  </div>
  <div class="form-group">
    <label for="END_DATE">实际结束时间</label>
    <input type="date" name="END_DATE" >
  </div>
  <div class="form-group">
    <label for="STATUS">状态</label>
    <select name="STATUS" >
         <option value="new">new</option>
         <option value="ing">ing</option>
         <option value="done">done</option>
    </select>
  </div>
  <div class="form-group">
    <label for="NOTE">备注</label>
    <textarea name="NOTE" ></textarea>
  </div>
  <%} %>
  
  <button type="submit" class="btn btn-primary" onclick="addActual()">保存</button>
  <button  class="btn btn-default" data-dismiss="modal">取消</button>
</form>
	
	
</div>
</body>
</html>
