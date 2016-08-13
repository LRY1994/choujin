function tabNav(x){
	switch(x){
	case 1 :{
		
		$("#tab2").hide();
		$("#tab3").hide();
		$("#tab4").hide();
		$("#tab5").hide();
		$("#tab1").show();
		break;
	    };
	case 2 :{
		
		$("#tab1").hide();
		$("#tab3").hide();
		$("#tab4").hide();
		$("#tab5").hide();
		$("#tab2").show();
		break;
	    };
	case 3 :{
		
		$("#tab1").hide();
		$("#tab2").hide();
		$("#tab4").hide();
		$("#tab5").hide();
		$("#tab3").show();
		break;
	    };
	case 4:{
		
		window.open("timeglider/index.jsp");
		break;
	    };
	case 5 :{
		
		$("#tab1").hide();
		$("#tab2").hide();
		$("#tab3").hide();
		$("#tab4").hide();
		$("#tab5").show();
		
		break;
	    };
	
	        
	}
	
	
}

