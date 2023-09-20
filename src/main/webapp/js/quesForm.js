/**
 * 
 */

 
    	
    	$("#ansopA").hide();
    	$("#ansopB").hide();
    	$("#ansopC").hide();
    	$("#ansopD").hide();
    	
    	
    	alert("i,m working fine");
    	
    	$("#questionarea").keyup(function(){
    		
    		checkQuestion();
    		
    		
    		
    	});
    	
    	
		$("#quesoptionA").keyup(function(){
		    		
			checkOptionA();
		    copyAnswerA();		
		    		
		});
		    	
		    	
		$("#quesoptionB").keyup(function(){
			
			checkOptionB();
			copyAnswerB();
			
		});
		
		
		$("#quesoptionC").keyup(function(){
			
			checkOptionC();
			copyAnswerC();
			
		});
		
		
		$("#quesoptionD").keyup(function(){
			
			checkOptionD();
			copyAnswerD();
			
		});
    	
		
		
		
		function copyAnswerA(){
			
			var cA = $("#quesoptionA").val();
			$("#ansopA").show();
			$("#ansopA").html(cA);
			
		}
		
		
		function copyAnswerB(){
			
			var cB = $("#quesoptionB").val();
			$("#ansopB").show();
			$("#ansopB").html(cB);
			
		}
		
		function copyAnswerC(){
			
			var cC = $("#quesoptionC").val();
			$("#ansopC").show();
			$("#ansopC").html(cC);
			
		}
		
		function copyAnswerD(){
			
			var cD = $("#quesoptionD").val();
			$("#ansopD").show();
			$("#ansopD").html(cD);
			
		}
		
		
    	
    	function checkQuestion(){
    		
    		var q1 = $("#questionarea").val();
    		
    		if(q1=='')
    			{
    			  
    			   $("#errorques").show();
    			   $("#errorques").html("**Question is required");
    			   return false;
    			
    			}
    		else
    			{
    			
    			$("#errorques").hide();
    			  return true;
    			
    			}
    		
    	}
    	
    	
		function checkOptionA(){
    		
    		var qA = $("#quesoptionA").val();
    		
    		if(qA=='')
    			{
    			  
    			   $("#errorquesA").show();
    			   $("#errorquesA").html("**Option A is required");
    			   return false;
    			
    			}
    		else
    			{
    			
    			$("#errorquesA").hide();
    			  return true;
    			
    			}
    		
    	}
		
		
		
		
		
		function checkOptionB(){
    		
    		var qB = $("#quesoptionB").val();
    		
    		if(qB=='')
    			{
    			  
    			   $("#errorquesB").show();
    			   $("#errorquesB").html("**Option B is required");
    			   return false;
    			
    			}
    		else
    			{
    			
    			$("#errorquesB").hide();
    			  return true;
    			
    			}
    		
    	}
    	
    	
		
		
		
		function checkOptionC(){
    		
    		var qC = $("#quesoptionC").val();
    		
    		if(qC=='')
    			{
    			  
    			   $("#errorquesC").show();
    			   $("#errorquesC").html("**Option C is required");
    			   return false;
    			
    			}
    		else
    			{
    			
    			$("#errorquesC").hide();
    			  return true;
    			
    			}
    		
    	}
    	
    	
		
		
		function checkOptionD(){
    		
    		var qD = $("#quesoptionD").val();
    		
    		if(qD=='')
    			{
    			  
    			   $("#errorquesD").show();
    			   $("#errorquesD").html("**Option D is required");
    			   return false;
    			
    			}
    		else
    			{
    			
    			$("#errorquesD").hide();
    			  return true;
    			
    			}
    		
    	}
		
		
		
    	function quesValidationForm(){
    		
    		var quesFlag = false;
    		
    		if(checkQuestion()==true && checkOptionA()==true && checkOptionB()==true && checkOptionC()==true && checkOptionD()==true )
    			{
    			
    			    quesFlag = true;
    			
    			}
    		else
    			{
    			
    			    quesFlag = false;
    			
    			}
    		
    		
    		return quesFlag;
    		
    	}
    	