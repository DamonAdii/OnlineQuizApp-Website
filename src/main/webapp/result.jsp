<%@page import="com.online.quiz.entities.QuizResult"%>
<%@page import="com.online.quiz.entities.Message"%>
<%@page import="com.online.quiz.entities.User"%>

<%


   User  user = (User) session.getAttribute("user");
   
   if(user==null)
   {
	   response.sendRedirect("login.jsp");
	   
   }


%>

<%

int TotalMarksgot = 0;
int rightAnswer = 0;
int wrongAnswer = 0;
int total_maks = 0;
int total_question = 0;
  if(request.getAttribute("quizResult")!= null) {
	  
	  QuizResult quizResult = (QuizResult)request.getAttribute("quizResult");
	  TotalMarksgot = quizResult.getTotalmarksobtained();
	  rightAnswer = quizResult.getRightAnswerCount();
	  wrongAnswer = quizResult.getWrongAnswerCount();
	  total_maks = quizResult.getTotal_marks();
	  total_question = quizResult.getTotalquestion();

  } else {
	  
	  
  }


%>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
	          <h4>Quiz Result</h4>
	        </div>
	        
	      </div>
      
      </div>
      
     
  </section>
  
  
  <section style="padding: 20px 0;">
  
  <% 
  
   int t_marks = (TotalMarksgot *100) / total_maks;
  System.out.println("total percent : "+t_marks);
  
  %>
  
       <div class="container" data-aos="fade-up">
      
      
	      <div class="row justify-content">
	        
	        <div class="col-xl-12 col-lg-12">
	          
	          <h4>You Scored <span class="text-success"><%=t_marks%>%</span></h4>
	           
	          <hr>
	        
	        </div>
	        
	      </div>
      
      </div>
  
  </section>
  
  
  
  <section style="padding:20px 0px 100px 0px">
  
     <div class="container"  data-aos="fade-up">
     
       <div class="row justify-content">
	        
	     <div class="col-xl-12 col-lg-12 text-center">
          
           <img src="img/trophy.png" style="width:200px;height:200px;object-fit:cover;">
           
           <h1>Hey, Congratulations!</h1>
           
           <h2>Your Scored is : <%= TotalMarksgot %></h2>
           
           <h1><span class="text-success"><%= rightAnswer %></span>/<span class="text-danger"><%= wrongAnswer %></span></h1>
           
           <a class="btn btn-outline-success" href="showQuizzes.jsp">Play Next Quiz</a>
       
        </div>
       
       </div>
     
     </div>
  
  </section>
<!-- ======= result Section ======= -->









<!-- ======= login Section ======= -->


   <!-- footer start from here -->

    <%@include file="footer.jsp" %> 

<!-- footer ends from here -->


<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<!-- <script type="text/javascript" src="js/myjs.js"></script> -->

</body>
</html>