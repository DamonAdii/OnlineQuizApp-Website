

<%@page import="com.online.quiz.entities.Quiz"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.online.quiz.helper.ConnectionProvider"%>
<%@page import="com.online.quiz.Dao.QuizDao"%>
<%@page import="com.online.quiz.entities.Message"%>

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
<title>Create Question</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="/richtexteditor/rte_theme_default.css" />
<script type="text/javascript" src="/richtexteditor/rte.js"></script>
<script type="text/javascript" src='/richtexteditor/plugins/all_plugins.js'></script>


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
	          
	          <h4>+ Add New Question</h4>
	           
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
          
                <form id="formQues" action="QuesServlet" method="POST" onsubmit="return quesValidationForm()" style="width:650px;">
				 
				  <div class="form-group">
				    <label for="exampleFormControlSelect1">Select Quiz Category</label>
				   
				      <select class="form-control bg-light" id="qcat" name="quizID">
				      
				      <option selected disabled>----- select category -----</option>
				      
				     <%
				     
				        QuizDao qDao = new QuizDao(ConnectionProvider.getConnection());
				    		
				    	ArrayList<Quiz> list = qDao.getAllQuizesByUserId(user.getId());
				    		
				        for(Quiz cqQuiz : list)
				        {
				        	%>
				        	
				        	 <option value="<%= cqQuiz.getQid() %>"><%= cqQuiz.getQtitle() %></option>
				        	
				        	<%
				        	
				        }
				     
				     %>
				     
				   
				      
				      
				    </select>
				  </div>
				  
				  
				  
				 
				  <div class="form-group">
				    <label for="exampleFormControlTextarea1">Write A Question</label>
				    <textarea class="form-control bg-light" id="questionarea" name="quesTitle1" rows="3"></textarea>
				    <small class="text-danger" id="errorques" style="display:none;"></small>
				  </div>
				  
				  
				  
				  
				  <div class="form-group">
				    <label for="exampleFormControlTextarea1">Option A</label>
				    <textarea class="form-control bg-light" id="quesoptionA" name="quesA" rows="3"></textarea>
				    <small class="text-danger" id="errorquesA" style="display:none;"></small>
				  </div>
				  
				  
				  
				  
				  <div class="form-group">
				    <label for="exampleFormControlTextarea1">Option B</label>
				    <textarea class="form-control bg-light" id="quesoptionB" name="quesB" rows="3"></textarea>
				    <small class="text-danger" id="errorquesB" style="display:none;"></small>
				  </div>
				  
				  
				  
				  <div class="form-group">
				    <label for="exampleFormControlTextarea1">Option C</label>
				    <textarea class="form-control bg-light" id="quesoptionC" name="quesC" rows="3"></textarea>
				    <small class="text-danger" id="errorquesC" style="display:none;"></small>
				  </div>
				  
				  
				  
				  
				  <div class="form-group">
				    <label for="exampleFormControlTextarea1">Option D</label>
				    <textarea class="form-control bg-light" id="quesoptionD" name="quesD" rows="3"></textarea>
				    <small class="text-danger" id="errorquesD" style="display:none;"></small>
				  </div>
				  
				   
				  
				  
				  
				  <div class="form-group">
				    <label for="exampleFormControlSelect1">Select Right Answer</label>
				    <select class="form-control bg-light" id="exampleFormControlSelect1" name="answerQue">
				      <option selected disabled>----- select answer -----</option>
				      <option value="A" id="ansopA"></option>
				      <option value="B" id="ansopB"></option>
				      <option value="C" id="ansopC"></option>
				      <option value="D" id="ansopD"></option>
				      
				    </select>
				  </div>
				  
				  
				  <button type="submit" class="btn btn-primary">Add Question</button>
				  
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
<script type="text/javascript" src="js/quesForm.js"></script>



</body>
</html>








