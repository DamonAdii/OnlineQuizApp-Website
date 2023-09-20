
$("#qtitle").keyup(function(){
	
	
	check_qtitle();
	
	
});


function check_qtitle(){
	
	var t1 = $("#qtitle").val();
	
	if(t1=='' || t1 == undefined)
	{
		
		$("#qtitleerror").show();
		$("#qtitleerror").html("**Title is required");
		return false;
		
	}
	else{
		
		$("#qtitleerror").hide();
		return true;
		
	}
	
}




$("#quizCont").keyup(function(){
	
	
	check_quizCont();
	
	
});


function check_quizCont(){
	
	var qc = $("#quizCont").val();
	
	if(qc=='')
	{
		
		$("#quizConterror").show();
		$("#quizConterror").html("**Title is required");
		return false;
		
	}
	else{
		
		$("#quizConterror").hide();
		return true;
		
	}
	
}




 function quizValidation(){
	 
	 var flag = false;
	 
	  
	  if(check_qtitle()==true && check_quizCont()==true)
	  {
		  
		  flag = true;
		  
	  }
	  else{
		  
		  flag = false;
	  }
	 
	 
	 return flag;
	 
	 
 }