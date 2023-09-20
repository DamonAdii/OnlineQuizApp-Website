
//    $(document).ready(function(){
	   
	   
// 	   $("#formQues").on("submit",function(e){
		   
// 		   e.preventDefault();
		   
// 		   var ss = $("#qcat").val();
		   
// 		   console.log(ss);
		   
// 		   if(quesValidationForm()==true)
// 			   {
			      
// 			     var form = new FormData(this);
			     
// 			     console.log(form);
			     
// 			     $.ajax({
			    	 
// 			    	 url : "QuesServlet",
// 			    	 type : "POST",
// 			    	 data : form,
// 			    	 success: function (data, textStatus, jqXHR) {
                         
//                          console.log(data)
						
//                           if (data.trim() === 'done')
//                           {

//                           	 swal("Question added successfully..We are going to redirect to Insert Next Question")
//                                .then((value) => {
//                                    window.location = "createQuestion.jsp"
//                                });
                         	 
//                           } else
//                           {
                             
//                        	   swal("Question found invalidated..try with another")
//                               .then((value) => {
//                                   window.location = "createQuestion.jsp"
//                               });
//                               //swal(data);
//                           }

//                      },
//                      error: function (jqXHR, textStatus, errorThrown) {
//                         // $("#sumbimt-btn").show();
//                        //  $("#loader").hide();
//                          swal("something went wrong..try again");

//                      },
//                      processData: false,
//                      contentType: false
			    	 
			    	 
// 			     });
			   
// 			   }
// 		   else
// 			   {
			   
// 			     return false;
			   
// 			   }
		   
		   
// 	   });
	   
	   
//    });
 