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


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html lang="en">
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>酬金出账进度管控</title>
<link href="<%=basePath %>lib/bootstrap.min.css" rel="stylesheet" charset="utf-8">

<link href="<%=basePath %>app/app.css" rel="stylesheet" charset="utf-8">

</head>

<body>
	
	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">酬金出账进度管控 </a>
		</div>

	</div>
	</nav>

	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-2 col-md-1 sidebar">
				<ul class="nav nav-sidebar">					
					<li ><a href="javascript:;" onclick="tabNav(1)" >酬金项目信息管理</a></li>
					<li><a href="javascript:;" onclick="tabNav(2)" >计划进度信息管理</a></li>
					<li><a href="javascript:;" onclick="tabNav(3)" >实际进度信息管理</a></li>
				</ul>
				<ul class="nav nav-sidebar">
					<li><a href="javascript:;" onclick="tabNav(4)" >时间轴</a></li>
					<li><a href="javascript:;" onclick="tabNav(5)" >时间统计</a></li>

				</ul>

			</div>
			
			<div class="col-sm-10 col-sm-offset-2 col-md-11 col-md-offset-1 main" id="content">
               <div id="tab1" >
                  <jsp:include page="/feeitem/index.jsp"></jsp:include>
               </div>
                <div id="tab2" style="display:none">
                  <jsp:include page="/planschedule/index.jsp"></jsp:include>
               </div>
               <div id="tab3" style="display:none">
                  <jsp:include page="/actualschedule/index.jsp"></jsp:include>
               </div>
               <div id="tab4" style="display:none">
                  <jsp:include page="/timeglider/index.jsp"></jsp:include>
               </div>
               <div id="tab5" style="display:none">
                  <jsp:include page="/statics/index.jsp"></jsp:include>
               </div> 
            </div>



	<script src="<%=basePath %>/lib/jquery-3.1.0.min.js"></script>
	 <script src="<%=basePath %>/lib/bootstrap.min.js"></script> 
	 <script type="text/javascript" src="<%=basePath %>app/app.js"></script> 
	
</body>
</html>
