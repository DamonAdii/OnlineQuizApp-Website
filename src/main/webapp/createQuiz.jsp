
<%@page import="com.online.quiz.entities.Message"%>
<%@page import="com.online.quiz.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.online.quiz.helper.ConnectionProvider"%>
<%@page import="com.online.quiz.Dao.CategoryDao"%>
<%@page import="com.online.quiz.entities.User"%>

<%


   User  user = (User) session.getAttribute("user");
   
   if(user==null || user.getModule().equals("student"))
   {
	   session.removeAttribute("user");
	   response.sendRedirect("login.jsp");
	   
   }


%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create New Quiz</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>




<!-- navbar start from here -->

    <%@include file="navBlogin.jsp" %> 

<!-- navbar ends from here -->



<!-- ======= login Section ======= -->
  <section id="login" class="d-flex" style="padding: 70px 0 20px 0;">
  
      <div class="container-fluid" data-aos="fade-up">
      
      
	      <div class="row justify-content">
	        
	        <div class="col-xl-12 col-lg-12 bg-dark text-white pt-3 pl-5 pb-2">
	          <h4>Create Quiz</h4>
	          
	        </div>
	        
	      </div>
      
      </div>
      
     
  </section>
  
  
  <section style="padding: 20px 0;">
  
  
       <div class="container" data-aos="fade-up">
      
      
	      <div class="row justify-content">
	        
	        <div class="col-xl-12 col-lg-12">
	          
	          <h4>+ Add New Quiz</h4>
	           
 					<%
   
                       Message msg = (Message) session.getAttribute("msg");
                        
	                   if(msg!=null)
	                   {
	                	   %>
	                	   
	                	   <span class="<%= msg.getcssclass() %>"> <%= msg.getContent()%> </span>
	                	   
	                	   <%
	                	   
	                	   session.removeAttribute("msg");
	                   }
	                   
                   %>
	                	
	          <hr>
	        
	        </div>
	        
	      </div>
      
      </div>
  
  </section>






<!-- Add question section -->

<section style="padding:20px 0px 100px 0px">
  
     <div class="container"  data-aos="fade-up">
     
       <div class="row justify-content">
	        
	        <div class="col-xl-12 col-lg-12">
          
          <form name="addQuiz" id="add-quiz" onsubmit="return quizValidation()" action="QuizServlet" method="POST" style="width:650px;">
          
          
		
				<div class="form-group">
				    <label for="exampleFormControlSelect1">Select Exam Category</label>
					    <select required name="quizexamcategoryid" class="form-control bg-light" id="exmid" style="height:50px;border-radius:0px;">
					      <option selected disabled>---Select Category---</option>

                                    <%
                                    CategoryDao cdao = new  CategoryDao(ConnectionProvider.getConnection());
                                    ArrayList<Category> list = cdao.getAllCategories();
                                        for (Category c : list) {
                                    %>
                                    <option value="<%= c.getCid()%>"><%= c.getCtitle() %></option>

                                    <%
                                        }
                                    %>
					    </select>
				  
				  
				  </div>
				  
				  
				  
				  
				  
				  
				  
				  <div class="form-group">
				    <label for="exampleInputEmail1">Quiz Title</label>
				    <input type="text" name="qtitle1" class="form-control bg-light" id="qtitle" placeholder="Enter quiz title here..." style="height:50px;border-radius:0px;">
				    <small id="qtitleerror" class="form-text text-danger" style="display:none;"></small>
				  </div>
  
   			     
   			     
   			     
   			     
   			     <div class="form-group">
				    
				    <label for="exampleFormControlTextarea1">Quiz Description</label>
				    <br>
				    <textarea class="form-control bg-light" name="quizcontent1" id="quizCont" rows="3"></textarea>
				       <br>
				       <small id="quizConterror" class="form-text text-danger" style="display:none;"></small>
				   
				 </div>
				  
				  
				  
				  
  
				  
				  <div class="form-group">
				    
				    <label for="exampleFormControlSelect1">Select Max Numbers Of Questions</label>
					    <select required class="form-control bg-light" name="questionnumber1" id="qn1" style="height:50px;border-radius:0px;">
					      <option selected disabled>--- Select Answer ---</option>

                                    <option value="10">10 Questions</option>
                                    <option value="20">20 Questions</option>
                                    <option value="30">30 Questions</option>
                                    <option value="40">40 Questions</option>
                                    <option value="50">50 Questions</option>

					    </select>
				  
				  
				  </div>
		
		
		
		          <button type="submit" class="btn btn-primary">Add Quiz</button>
			
			
		  </form>
       
        </div>
       
       </div>
     
     </div>
  
  </section>
<!-- ======= add question Section ======= -->













   <!-- footer start from here -->

    <%@include file="footer.jsp" %> 

<!-- footer ends from here -->


<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<script type="text/javascript" src="js/quizFormVal.js"></script>


<script>


$(document).ready(function(){
	 
	 
	 $("#add-quiz").on('submit', function(e){
		 
		 alert("yes, quiz");
		 
		 e.preventDefault();
		 
		 var exmid = $("#exmid").val();
		 
		 console.log(exmid);
		 
 		var qtitle = $("#qtitle").val();
		 
		 console.log(qtitle);
		 
 		var cont = $("#cont").val();
		 
		 console.log(cont);
		 
		 var qn1 = $("#qn1").val();
		 
		 console.log(qn1);

			if(quizValidation()==true)
			{
				
				let form = new FormData(this);
		 
		 	    console.log(form);
		 
		 
		 //send register servlet: javascript object
                   $.ajax({
                       url: "QuizServlet",
                       type: "post",
                       data: form,
                       success: function (data, textStatus, jqXHR) {
                           
                           console.log(data)
							//swal("success..done");
                         //  $("#sumbimt-btn").show();
                          // $("#loader").hide();

                            if (data.trim() === 'done')
                            {

                            	 swal("Quiz Created successfully..We are going to redirect to Insert Question page")
                                 .then((value) => {
                                     window.location = "createQuestion.jsp"
                                 });
                           	 
                            } else
                            {
                               
                         	   swal("Quiz found invalidate..We are going to redirect to Insert Create Quiz page")
                                .then((value) => {
                                    window.location = "createQuiz.jsp"
                                });
                                //swal(data);
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
				console.log("submission failed");
				
			}
			
		 
		 
		 
		 
	 });
	 
	 
});
    

 </script>


</body>
</html>