function tabNav(x){
	switch(x){
	case 1 :{
		/*$.ajax({
			type:"GET",
			url:"../feeitem/index.jsp",
			dataType:"html",
			success:function(data){
				$("#content").html(data);
			}
		});*/
		//for(int i=0;)
		$("#tab2").hide();
		$("#tab3").hide();
		$("#tab4").hide();
		$("#tab5").hide();
		$("#tab1").show();
		break;
	    };
	case 2 :{
		/*$.ajax({
			type:"GET",
			url:"../planschedule/index.jsp",
			dataType:"html",
			success:function(data){
				$("#content").html(data);
			}
		});*/
		$("#tab1").hide();
		$("#tab3").hide();
		$("#tab4").hide();
		$("#tab5").hide();
		$("#tab2").show();
		break;
	    };
	case 3 :{
		/*$.ajax({
			type:"GET",
			url:"../actualschedule/index.jsp",
			dataType:"html",
			success:function(data){
				$("#content").html(data);
			}
		});*/
		$("#tab1").hide();
		$("#tab2").hide();
		$("#tab4").hide();
		$("#tab5").hide();
		$("#tab3").show();
		break;
	    };
	case 4:{
		/*$.ajax({
			type:"GET",
			url:"../timeglider/index.jsp",
			dataType:"html",
			success:function(data){
				$("#content").html(data);
			}
		});
		break;*/
		$("#tab1").hide();
		$("#tab2").hide();
		$("#tab3").hide();
		$("#tab5").hide();
		$("#tab4").show();
		break;
	    };
	case 5 :{
		/*$.ajax({
			type:"GET",
			url:"../feeitem/index.jsp",
			dataType:"html",
			success:function(data){
				$("#content").html(data);
			}
		});*/
		$("#tab1").hide();
		$("#tab2").hide();
		$("#tab3").hide();
		$("#tab4").hide();
		$("#tab5").show();
		break;
	    };
	
	        
	}
	/*if(x==1){
	$.ajax({
		type:"GET",
		url:"../feeitem/index.jsp",
		dataType:"html",
		success:function(data){
			$("#content").html(data);
		}
	});
	}
	if(x==2){
		$.ajax({
			type:"GET",
			url:"../planschedule/index.jsp",
			dataType:"html",
			success:function(data){
				$("#content").html(data);
			}
		});
	}
	if(x==3){
		$.ajax({
			type:"GET",
			url:"../actualschedule/index.jsp",
			dataType:"html",
			success:function(data){
				$("#content").html(data);
			}
		});
	}*/
	
	
}

