<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
System.out.println(basePath);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="lib/bootstrap.min.css" rel="stylesheet" >     
    <link href="login/login.css" rel="stylesheet">

  </head>
  
  <body>
  <%request.setCharacterEncoding("GBK"); %>
    <%
     List<String> info=(List<String>)request.getAttribute("info");
    if(info!=null){
    	Iterator<String> it=info.iterator();
    	while(it.hasNext()){
    %>
    <h4><%=it.next() %></h4>
    <% 	
    	}
    }
    %>
   <div class="container">
      <img src="login/logo.jpg" />
      <h1>酬金出账进度管控</h1>
      <form class="form-signin" action="loginCheck" method="post">      	
        <h2 class="form-signin-heading">系统登录</h2>
       
        <label for="userid" class="sr-only">账号</label>
        <input type="text"  name="userid" class="form-control" placeholder="账号" required autofocus />
        <label for="password" class="sr-only">密码</label>
        <input type="password" name="password" class="form-control" placeholder="密码" required />
        <div class="radio">
        	<label>
        		<input type="radio" name="role" value="1" />业务支持部
        	</label>
        	<label>
        		<input type="radio" name="role" value="2"/>开发商
        	</label>
        </div>       
        <button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
       
      </form>
    </div> 
  </body>
</html>
