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
	MySQLHelper  mysql=new MySQLHelper();
	String sql="select USER_ID,USER_NAME  from JW_USER_INFO";
	ResultSet rs=mysql.Query(sql);
	String role=(String)session.getAttribute("usertype");
	String userid=(String)session.getAttribute("userid");
	%>
<div class="container">
  <form action="EditActual" method="post"> 
  <div class="form-group">
    <label for="SCHEDULE_ID">实际进度ID</label>
    <input id="SCHEDULE_ID" name="SCHEDULE_ID" type="text" readonly="readonly"  style="border:none" />
  </div>
  
  <div class="form-group">
    <label for="PLAN_SCHEDULE_ID">计划进度ID</label>
    <input type="text"  name="PLAN_SCHEDULE_ID" id="PLAN_SCHEDULE_ID"  style="border:none">
  </div>
  <% if(role=="1"||"1".equals(role)){%>
  <div class="form-group">
    <label for="PARNER_INTERFACE">开发商接口人</label>
    <select  name="PARNER_INTERFACE" id="PARNER_INTERFACE">
    <option></option>
       <%  while(rs.next()){
       %> 
           <option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
    	<%
       }
    	%>   
       
    </select>  
  </div>
  <%} %>
  <div class="form-group">
    <label for="START_DATE">实际开始时间</label>
     <input type="date" name="START_DATE" id="START_DATE">
  </div>
  <div class="form-group">
    <label for="END_DATE">实际结束时间</label>
    <input type="date" name="END_DATE" id="END_DATE">
  </div>
  <div class="form-group">
    <label for="STATUS">状态</label>
    <select name="STATUS" id="STATUS">
         <option value="new">new</option>
         <option value="ing">ing</option>
         <option value="done">done</option>
    </select>
  </div>
  <div class="form-group">
    <label for="NOTE">备注</label>
    <textarea name="NOTE" id="NOTE"></textarea>
  </div>
  
  
  <button type="submit" class="btn btn-primary" >保存</button>
  <button  class="btn btn-default" data-dismiss="modal">取消</button>
</form>
	
	
</div>
</body>
</html>
