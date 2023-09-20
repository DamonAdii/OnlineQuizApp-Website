/**
 * 
 */

 $(document).ready(function(){
	 
	 
	 $("#reg-form").on('submit', function(e){
		 
		 alert("yes, form is not sending anymore");
		 
		 e.preventDefault();
		 
		 
		 
//		 var account = $("#selection").val(); 
//		 
//		 console.log(account);
//		 
//		 var gender1 = $("#gender1").val(); 
//		 
//		 console.log(gender1);

			if(regvalidation()==true)
			{
				
				let form = new FormData(this);
		 
		 	    console.log(form);
		 
		 
		 //send register servlet: javascript object
                    $.ajax({
                        url: "RegisterServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            
                            console.log(data)
							//swal("success..done");
                          //  $("#sumbimt-btn").show();
                           // $("#loader").hide();

                            if (data.trim() === 'done')
                            {

                            	 swal("Registered successfully..We are going to redirect to login page")
                                 .then((value) => {
                                     window.location = "login.jsp"
                                 });
                            	 
                            } else
                            {

                                swal(data);
                            }

                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                           // $("#sumbimt-btn").show();
                          //  $("#loader").hide();
                            swal("something went wrong..try again");

                        },
                        processData: false,
                        contentType: false

                    });
				
			}
			else{
				
				return false;
				
			}
			
		 
		 
		 
		 
	 });
	 
	 
 });