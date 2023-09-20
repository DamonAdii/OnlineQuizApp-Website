<%@page import="com.online.quiz.Dao.CategoryDao"%>
<%@page import="com.online.quiz.entities.Category"%>
<%@page import="com.online.quiz.entities.Quiz"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.online.quiz.helper.ConnectionProvider"%>
<%@page import="com.online.quiz.Dao.QuizDao"%>
<%@page import="com.online.quiz.entities.Message"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Quizzes - Play Quiz</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
.c-link.active{
background:#16507b;
}
</style>
</head>
<body>




<!-- navbar start from here -->

    <%@include file="navBlogin.jsp" %> 

<!-- navbar ends from here -->



<!-- ======= show quizzes section ======= -->
 
  <section id="login" class="d-flex" style="padding: 70px 0 20px 0;">
  
      <div class="container-fluid" data-aos="fade-up">
      
      
	      <div class="row justify-content">
	        
	        <div class="col-xl-12 col-lg-12 bg-dark text-white pt-3 pl-5 pb-2">
	          <h4>Quizzes</h4>
	        </div>
	        
	      </div>
      
      </div>
      
     
  </section>
  
  
  <section style="padding: 20px 0;">
  
  
       <div class="container" data-aos="fade-up">
      
      
	      <div class="row justify-content">
	        
	        <div class="col-xl-12 col-lg-12">
	          
	          <h4>Play Quiz</h4>
	           
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
  
  
  
  <section style="padding:20px 0px 100px 0px">
  
     <div class="container"  data-aos="fade-up">
     
       <div class="row justify-content">
	        
	        
	        
	        
	        <div class="col-xl-4 col-lg-4">
             
             <div class="show-quiz-left-section" id="quiz-left-section">
             
              <!-- show all quizzes category -->
              
               <div class="list-group">
                            
                            <a href="#" onclick="getQuizes(0,this)"  class="c-link list-group-item list-group-item-action active">
                               
                                All Quiz
                            
                            </a>
                            <!--categories-->

                               <%   
                            	CategoryDao d = new CategoryDao(ConnectionProvider.getConnection());
                                ArrayList<Category> list1 = d.getAllCategories();
                                for (Category cc : list1)
                                {

	                            %>
	                           
	                            <a href="#" onclick="getQuizes(<%= cc.getCid() %>, this)" class="c-link list-group-item list-group-item-action"><%= cc.getCtitle() %></a>


		                       <% 
									
									}
		
		                       %>
                        </div>
                        
                        
                        <!-- show all quizzes category -->
       
             </div>
             
             
          </div>
	        
	        
	        
	        
	        
	        
	        <div class="col-xl-8 col-lg-8">
             
             
             
             
             <!--posts-->
             <div class="container text-center" id="loader">
                     
                     <i class="fa fa-refresh fa-4x fa-spin"></i>
                    
                     <h3 class="mt-2">Loading...</h3>
                  
             </div>
                        
                        
             
             <div class="show-quiz-right-section" id="quiz-right-section">
             
                
             </div>
             
             
          </div>
          
          
          
          
          
          
          
       </div>
     
     </div>
  
  </section>
<!-- ======= show quizzes section ======= -->


   <!-- footer start from here -->

    <%@include file="footer.jsp" %> 

<!-- footer ends from here -->


<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<!-- <script type="text/javascript" src="js/myjs.js"></script> -->

<script>

$(document).ready(function (e) {

	   let allPostRef = $('.c-link')[0]
	    getQuizes(0,allPostRef);


})
	
function getQuizes(catId,temp) {
    $("#loader").show();
    $("#quiz-right-section").hide()

    $(".c-link").removeClass('active')


    $.ajax({
        url: "load_quizzes.jsp",
        data: {cid: catId},
        success: function (data, textStatus, jqXHR) {
            console.log(data);
            $("#loader").hide();
            $("#quiz-right-section").show();
            $('#quiz-right-section').html(data)
            $(temp).addClass('active')

        }
    })

}


</script>

</body>
</html>