


$("#username").keyup(function(){
	
    username_check();	
	
});



function username_check(){
	
	var name = $("#username").val();
	var nexp = /^[a-zA-Z ]{3,30}$/;
	console.log(name);
	
	if(name=='' || name == undefined)
	{
		$("#nameerror").show();
		$("#nameerror").html("** Name is requied");
		
		return false;
	}
	else if(nexp.test(name)==false){
		
		$("#nameerror").show();
		$("#nameerror").html("** Invalid Name, Kepp only letters na dlength should be in between 6 to 30");
		return false;
	}
	else{
		
		$("#nameerror").hide();
		return true;
	}
	
}





$("#useremail").keyup(function(){
	
    useremail_check();	
	
});



function useremail_check(){
	
	var email = $("#useremail").val();
	var exp =  /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	console.log(email);
	
	if(email=='' || email == undefined)
	{
		$("#emailerror").show();
		$("#emailerror").html("** email is requied");
		
		return false;
	}
	else if(exp.test(email)==false){
		
		$("#emailerror").show();
		$("#emailerror").html("** Invalid Email, email must contain @, . (for ex: .com, .co.in)");
		return false;
	}
	else{
		
		$("#emailerror").hide();
		return true;
	}
	
}







$("#password1").keyup(function(){
	
    userpass_check();	
	
});



function userpass_check(){
	
	var pass1 = $("#password1").val();
	var pexp = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,20}$/;
	console.log(pass1);
	
	if(pass1=='' || pass1 == undefined)
	{
		$("#passerror1").show();
		$("#passerror1").html("** password is requied");
		
		return false;
	}
	else if(pexp.test(pass1)==false){
		
		$("#passerror1").show();
		$("#passerror1").html("** Password is invalid , It must contain 1 Upperchase char and 1 special charecter and length should be in between 6 to 20");
		return false;
	}
	else{
		
		$("#passerror1").hide();
		return true;
	}
	
}






$("#cpassword1").keyup(function(){
	
    usercpass_check();	
	
});



function usercpass_check(){
	
	var cpass1 = $("#cpassword1").val();
	var pass1 = $("#password1").val();
	console.log(pass1);
	
	if(pass1 != cpass1)
	{
		$("#cpasserror").show();
		$("#cpasserror").html("** password is not matching");
		
		return false;
	}
	else{
		
		$("#cpasserror").hide();
		return true;
	}
	
}


function check_account(){
	
	var account = $("#selection").val();
	
	if(account=="" || account=="select")
	{
		console.log("yes,i'm in selection box'");
		$("#accounterror").show();
		$("#accounterror").html("** password is not matching");
		
		return false;
	}
	else{
		
		$("#accounterror").hide();
		return true;
	}
	
}


function regvalidation()
{
	let flag = false;
	
	  // check validation for username
	  
	 if(username_check()==true && useremail_check()==true && userpass_check()==true && usercpass_check()==true && check_account()==true)
	 {
		 flag = true;
	 }
	 else
	 {
		 flag = false;
	 }
	  
	  
	
	return flag;
	
}