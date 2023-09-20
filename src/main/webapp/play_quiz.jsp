<%@page import="com.online.quiz.entities.Question"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.online.quiz.Dao.QuestionDao"%>
<%@page import="com.online.quiz.entities.Quiz"%>
<%@page import="com.online.quiz.helper.ConnectionProvider"%>
<%@page import="com.online.quiz.Dao.QuizDao"%>


<%


   User  user = (User) session.getAttribute("user");
   
   if(user==null)
   {
	   response.sendRedirect("login.jsp");
	   
   }


%>



<%

String questionId = request.getParameter("questionId");

System.out.println(questionId);

int i = Integer.parseInt(questionId);

int quizId = Integer.parseInt(request.getParameter("quiz_id"));

System.out.println(quizId);

int fetchNext = Integer.parseInt(request.getParameter("fetchNext"));


System.out.println(fetchNext);

//loading the quiz
QuizDao qDao = new QuizDao(ConnectionProvider.getConnection());


Quiz quiz1 = qDao.getQuizByQuizId(quizId);

System.out.println(quiz1);

QuestionDao quesDao1 = new QuestionDao(ConnectionProvider.getConnection());

Question quest = quesDao1.getQuestionByQuesId(i,quizId,fetchNext);
System.out.println(quest.getContent()+"not getting some");


 //ArrayList<Question> qqList = (ArrayList<Question>)quesDao1.getAllQuestionsByGid(quizId);

//int sizeQ = quList1.size();

//System.out.println(quList1.size());
	
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><%= quiz1.getQtitle() %></title>
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
	          <h4><%= quiz1.getQtitle() %></h4>
	        </div>
	        
	      </div>
      
      </div>
      
     
  </section>
  
  
  <section style="padding: 20px 0;">
  
  
       <div class="container" data-aos="fade-up">
      
      
	      <div class="row justify-content">
	        
	        <div class="col-xl-12 col-lg-12">
	          
	        
	          
	          <h4>Questions :<%= quest.getQuesid() %></h4>
	           
	           
	          
	          <hr>
	        
	        </div>
	        
	      </div>
      
      </div>
  
  </section>
  
  
  
  <section style="padding:20px 0px 100px 0px">
  
     <div class="container"  data-aos="fade-up">
     
       <div class="row justify-content">
	        
	        <div class="col-xl-12 col-lg-12">
           
				<!--  action="CheckAnswerServlet" method="POST"    -->
	                          
	                           
	                        	
	                        	<form action="CheckAnswerServlet" method="POST">
	            	     
			            	      
			            	      <div class="question-section mb-3">
			                       
			                         
			                        <span> Q<input name="quesIDD" value="<%= quest.getQuesid() %>" style="pointer-events: none;width:25px;border:0px transparent;background:transparent;outline:none;"/>                               
			                         
			                        <%= quest.getContent() %>
			                         
			                        </span>
			                         
			                         <div class="custom-control custom-radio">
									   <input type="radio" id="customRadio1" name="customRadio" class="custom-control-input" value="A">
									   <label class="custom-control-label" for="customRadio1"><%= quest.getOption1() %></label>
									 </div>
									
									
									
									
									
									<div class="custom-control custom-radio">
									  <input type="radio" id="customRadio2" name="customRadio" class="custom-control-input" value="B">
									  <label class="custom-control-label" for="customRadio2"><%= quest.getOption2() %></label>
									</div>
									
									
									
									
									
									<div class="custom-control custom-radio">
									   <input type="radio" id="customRadio3" name="customRadio" class="custom-control-input" value="C">
									   <label class="custom-control-label" for="customRadio3"><%= quest.getOption3() %></label>
									 </div>
									
									
									
									
									
									<div class="custom-control custom-radio">
									  <input type="radio" id="customRadio4" name="customRadio" class="custom-control-input" value="D">
									  <label class="custom-control-label" for="customRadio4"><%= quest.getOption4() %></label>
									</div>
			                            
		                   		  </div>
		                   		  
		                   		  
		                   		  <%
		                   		  
		                   		     if(i == 0)
		                   		     {
		                   		    	 %>
		                   		    	<a href="play_quiz.jsp?quiz_id=<%= quizId%>&questionId=<%= quest.getQuesid() %>&fetchNext=1" class="btn btn-danger">Next</a>
		                   		     
		                   		     <%

		                   		     }else if(i > 0){
		                   		    	 
		                   		    	 %>
		                   		    	 
		                   		    	  <a href="play_quiz.jsp?quiz_id=<%= quizId%>&questionId=<%= quest.getQuesid()-2 %>&fetchNext=-1" class="btn btn-danger">Prev</a>
		                   		  
		                   		  
		                   		 	      <a href="play_quiz.jsp?quiz_id=<%= quizId%>&questionId=<%= quest.getQuesid() %>&fetchNext=1" class="btn btn-danger">Next</a>
		                   		    	 
		                   		    	 <%
		                   		    	 
		                   		     }
		                   		     
		                   		  
		                   		  %>
		                   		 
		                   		  
		                   		  
		                  	    </form>  
	                        	
	                        
            </div>
       
       </div>
     
     </div>
  
  </section>
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




