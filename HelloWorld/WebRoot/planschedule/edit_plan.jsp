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
		
		String sql="SELECT ITEM_ID,ITEM_NAME FROM JW_FEE_ITEM_INFO";
		ResultSet rs=mysql.Query(sql);
	%>
<div class="container">
  <form action="EditPlan" method="post"> 
  <div class="form-group">
    <label for="SCHEDULE_ID2">计划进度ID</label>
    <input id="SCHEDULE_ID2" name="SCHEDULE_ID2" type="text" readonly="readonly" />
  </div>
  <div class="form-group">
    <label for="ITEM2">酬金项</label>
    <select  name="ITEM2" id="ITEM2">
    <option></option>
       <%
       while(rs.next()){
       %>
          <option value="<%=rs.getString(1) %>"><%=rs.getString(2) %></option>
       <% 
       }
       %>
    </select>
  </div>
  <div class="form-group">
    <label for="MONTH2">酬金账期</label>
    <input type="month" name="MONTH2" id="MONTH2">   
  </div>
  <div class="form-group">
    <label for="START_DATE2">计划开始时间</label>
     <input type="date" name="START_DATE2" id="START_DATE2">
  </div>
  <div class="form-group">
    <label for="END_DATE2">计划结束时间</label>
    <input type="date" name="END_DATE2" id="END_DATE2">
  </div>
  <div class="form-group">
    <label for="STATUS2">状态</label>
    <select name="STATUS2" id="STATUS2">
         <option value="new">new</option>
         <option value="ing">ing</option>
         <option value="done">done</option>
    </select>
  </div>
  <div class="form-group">
    <label for="NOTE2">备注</label>
    <textarea name="NOTE2" id="NOTE2"></textarea>
  </div>
  
  
  <button type="submit" class="btn btn-primary" >保存</button>
  <button  class="btn btn-default" data-dismiss="modal">取消</button>
</form>
	
	
</div>
</body>
</html>
