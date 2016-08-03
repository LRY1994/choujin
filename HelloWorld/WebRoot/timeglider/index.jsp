<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<meta charset="UTF-8">
<base href="<%=basePath%>">

<title>进度时间轴</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet"
	href="./timeglider/css/jquery-ui-1.10.3.custom.css" type="text/css"
	charset="utf-8">
<link rel="stylesheet" href="./timeglider/timeglider/Timeglider.css"
	type="text/css" charset="utf-8">
<link rel="stylesheet"
	href="./timeglider/timeglider/timeglider.datepicker.css"
	type="text/css" charset="utf-8">
<link rel="stylesheet" href="./timeglider/css/docs.css" type="text/css" media="screen" title="no title" charset="utf-8">
<link rel="stylesheet" href="./timeglider/css/jquery-ui-1.8.5.custom.css" type="text/css" media="screen" title="no title" charset="utf-8">
<link rel="stylesheet" href="./timeglider/timeglider/Timeglider.css" type="text/css" media="screen" title="no title" charset="utf-8">
<link rel="stylesheet" href="./timeglider/docs.css" type="text/css" media="screen" title="no title" charset="utf-8">
<script src='./timeglider/js/jquery.js' type='text/javascript'></script>
<script src="./timeglider/js/jquery-ui.js" type="text/javascript"
	charset="utf-8"></script>
<script src="./timeglider/js/underscore-min.js" type="text/javascript"
	charset="utf-8"></script>
<script src="./timeglider/js/backbone-min.js" type="text/javascript"
	charset="utf-8"></script>
<script src="./timeglider/js/json2.js" type="text/javascript"
	charset="utf-8"></script>
<script src="./timeglider/js/jquery.tmpl.js" type="text/javascript"
	charset="utf-8"></script>
<script src="./timeglider/js/ba-tinyPubSub.js" type="text/javascript"
	charset="utf-8"></script>
<script src="./timeglider/js/jquery.mousewheel.js"
	type="text/javascript" charset="utf-8"></script>
<script src="./timeglider/js/jquery.ui.ipad.js" type="text/javascript"
	charset="utf-8"></script>
<script src="./timeglider/js/globalize.js" type="text/javascript"
	charset="utf-8"></script>
<script src="./timeglider/js/ba-debug.min.js" type="text/javascript"
	charset="utf-8"></script>
<script src="./timeglider/timeglider/TG_Date.js" type="text/javascript"
	charset="utf-8"></script>
<script src="./timeglider/timeglider/TG_Org.js" type="text/javascript"
	charset="utf-8"></script>
<script src="./timeglider/timeglider/TG_Timeline.js"
	type="text/javascript" charset="utf-8"></script>
<script src="./timeglider/timeglider/TG_TimelineView.js"
	type="text/javascript" charset="utf-8"></script>
<script src="./timeglider/timeglider/TG_Mediator.js"
	type="text/javascript" charset="utf-8"></script>
<script src="./timeglider/timeglider/timeglider.timeline.widget.js"
	type="text/javascript" charset="utf-8"></script>
<script src="./timeglider/timeglider/timeglider.datepicker.js"
	type="text/javascript" charset="utf-8"></script>

<style type='text/css'>
#placement {
	margin: 0px;
	
	height: 600px;
}
</style>




</head>

<body>

	<!-- html: -->
	<div id='placement'></div>

	<!-- js: -->
	<script type='text/javascript'>
		$(function() {
			var tg1 = $("#placement").timeline({
				"timezone" : "-07:00",
				"min_zoom" : 1,
				"max_zoom" : 60,
				"show_centerline" : true,
				"data_source" : "./timeglider/json/presentation.json",
				"show_footer" : true,
				"icon_folder" : "./timeglider/timeglider/icons/",
				"display_zoom_level" : true
			}).resizable({
				stop : function() {
					$(this).data("timeline").resize();
				}
			});

			var tg_actor = tg1.data("timeline");

			$(".goto").click(function() {
				var d = $(this).attr("date");
				var z = $(this).attr("zoom");
				tg_actor.goTo(d, z);
			});

			$(".zoom").click(function() {
				var z = Number($(this).attr("z"));
				tg_actor.zoom(z);
			});

			tg_actor.panButton($(".pan-left"), "left");
			tg_actor.panButton($(".pan-right"), "right");

			$("#loadData").click(function() {
				var src = $("#loadDataSrc").val();
				tg_actor.load(src);
			});

			$("#reload").on("click", function() {

				var callme = function() {
					alert('data reloaded.');
				}

				tg_actor.reloadTimeline({
					id : "us_general",
					source : "./timeglider/json/presentation.json",
					call_this : callme
				});

			});

			// we need to use a deferred event listener here since
			// this stuff is constantly re-painted in the DOM
			$("#placement").on(
					"click",
					".timeline-title",
					function() {
						var timeline_id = $(this).closest(
								".tg-timeline-envelope").attr("id");

						// get timeline to see what its display [expanded|collapsed] is:
						var tl = mediator.timelineCollection.get(timeline_id)

						// Backbone object; use ".get" to get properties
						var display = tl.get("display")
						var inverted = tl.get("inverted");

						if (display == "expanded") {
							tl.set({
								display : "collapsed"
							});
							mediator.refresh();
						} else if (display == "collapsed") {
							tl.set({
								display : "expanded"
							});
							mediator.refresh();
						}

					});

		}); // end document-ready
	</script>
</body>
</html>
