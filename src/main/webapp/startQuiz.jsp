



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

   int quizID = Integer.parseInt(request.getParameter("quiz_id"));

   QuizDao quizDao = new QuizDao(ConnectionProvider.getConnection());
   
   Quiz quiz = quizDao.getQuizByQuizId(quizID);
   
   
   
   QuestionDao questionDao = new QuestionDao(ConnectionProvider.getConnection());
   
   ArrayList<Question> questions = questionDao.getAllQuestionsByGid(quizID, quiz.getNumberOfQuestion());

%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>startQuiz</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<style>

.text-play{
background:#00ff80;padding-left:10px;padding-right:10px;padding-top:7px;padding-bottom:7px;border-radius:0px;color:white;font-size:.9em;
}

.text-checked{
background:#ff8000;padding-left:10px;padding-right:10px;padding-top:7px;padding-bottom:7px;border-radius:0px;color:white;font-size:.9em;
}

.radio-toolbar input[type="radio"] {
  display: none;
}
.radio-toolbar label {
  display: inline-block;
  background-color: #ddd;
  padding: 10px 20px;
  cursor: pointer;
  width:100%;
  border-radius:5px;
}
.radio-toolbar input[type="radio"]:checked+label {
  background-color: grey;
  color:#fff
}
.radio-toolbar input[type="radio"]+label:hover {
  transition: transform .2s;
  transform: scale(1.01);
}

</style>
<body>



<!-- navbar start from here -->

    <%@include file="navBlogin.jsp" %> 

<!-- navbar ends from here -->




<form action="SubmitQuiz" method="POST">

<input id="QuizId" name="QuizId" value="<%=quizID%>" style="display:none;"/>
<input id="QuizTotalQuestions" name="QuizTotalQuestions" value="<%= quiz.getNumberOfQuestion()%>"  style="display:none;"/>

    
    

<!-- ======= quiz Section ======= -->
  <section id="login" class="d-flex" style="padding: 70px 0 20px 0;">
  
      <div class="container-fluid" data-aos="fade-up">
      
      
	      <div class="row justify-content">
	        
	        <div class="col-xl-12 col-lg-12 bg-dark text-white pt-3 pl-5 pb-2">
	          <h4><%= quiz.getQtitle() %></h4>
	        </div>
	        
	      </div>
      
      </div>
      
     
  </section>
  
  
  <section style="padding: 20px 0;">
  
  
       <div class="container" data-aos="fade-up">
      
      
	      <div class="row justify-content">
	        
	        <div class="col-xl-12 col-lg-12">
	          
	        
	          
	          <h4>Quiz Ends In :</h4>
	           
	           
	          
	          <hr>
	        
	        </div>
	        
	      </div>
      
      </div>
  
  </section>
  
  
  
  <section style="padding:20px 0px 100px 0px">
  
     <div class="container"  data-aos="fade-up">
     
       <div class="row justify-content">
	        
	        <div class="col-xl-4 col-lg-12">
                 
                 <div>
                 
                     <p><span style="background:#111;padding-left:10px;padding-right:10px;padding-top:7px;padding-bottom:7px;border-radius:0px;color:white;font-size:.9em;">Points</span>
                     <span style="background:#ff6666;padding-left:10px;padding-right:10px;padding-top:7px;padding-bottom:7px;border-radius:0px;color:white;font-size:.9em;">+5</span>
                     <span style="background:#00ff80;padding-left:10px;padding-right:10px;padding-top:7px;padding-bottom:7px;border-radius:0px;color:white;font-size:.9em;">-2</span>
                     </p>
                   
                 </div>
	                        
            </div>
            
            
            
            
            <div class="col-xl-4 col-lg-12">
           
                 <div  id="timer"></div>
	                        
            </div>
            
            
            
            
            
            <div class="col-xl-4 col-lg-12 text-right">
           
                 <button type="submit" id="myformjs" name="SubmitQuiz" class="btn btn-success" style="padding-left:10px;padding-right:10px;padding-top:7px;padding-bottom:7px;border-radius:0px;color:white;font-size:1em;">Submit Quiz</button>
                 
                 <a href="#" class="btn btn-danger" style="padding-left:10px;padding-right:10px;padding-top:7px;padding-bottom:7px;border-radius:0px;color:white;font-size:1em;">Quit Quiz</a>
	                        
            </div>
            
            
       
       </div>
       
       
       
       
       
       
       
       
       
       
       
       
       <div class="row justify-content mt-3">
	        
	        
	        
	        
	        
	        <div class="col-xl-4 col-lg-12">
                 
                 <div>
                     
                     <%
                     	int i = 0;
                         for(Question qes : questions)
                         {
                        	 i++;
                        	 
                        	 %>
								<!--   < %= qes.getQuesid() %> -->
                        	    <a class="text-play questionlinkClass"  id="questionlinkid<%=i%>"><%=i%></a>
                        	 
                        	 
                        	 <%
                        	 
                         }
                     
                     %>
                     
                     
                     
                 </div>
	                        
            </div>
            
            
            
            
            <div class="col-xl-8 col-lg-12">
           
                
                <%
                     	
                
                int j = 0;
                        
                for(Question qes : questions)
                        
                {
                        	
                	j++;
                	String style = "display:none";
                	if(j == 1) {
                		style ="" ;
                	} 
                        	
                	%>
				  <!-- < %= qes.getQuesid() %> -->
                   <div class="quiz-section questiondivClass" id="divID<%=j%>" style="background:#f2f2f2;padding:20px;border-radius:5px;<%=style%>">
                 	<input name="question<%=j%>" id="question<%=j%>" value="<%= qes.getQuesid() %>">
                   <input name="questionanswered<%=j %>" id="questionanswered<%=j %>" value="0">
                     <div>
                      
                        <h5><span>Q <%=j %></span> - <%= qes.getContent() %></h5>
                      
                     </div>
                       
                      <div class="radio-toolbar">
					  
					  <div>
					  <input type="radio" class="radioOption" id="radio-<%=j%>-1" name="radio<%=j%>"  value="A">
					  <label for="radio-<%=j%>-1"><%= qes.getOption1() %></label>
					  </div>
					  
					  
					  <div>
					  <input type="radio" class="radioOption" id="radio-<%=j%>-2" name="radio<%=j%>"  value="B">
					  <label for="radio-<%=j%>-2"><%= qes.getOption2() %></label>
					  </div>
					  
					  
					  <div>
					  <input type="radio" class="radioOption" id="radio-<%=j%>-3"name="radio<%=j%>"  value="C">
					  <label for="radio-<%=j%>-3"><%= qes.getOption3() %></label>
					  </div>
					 
					 
					  <div>
					  <input type="radio" class="radioOption" id="radio-<%=j%>-4" name="radio<%=j%>"  value="D">
					  <label for="radio-<%=j%>-4"><%= qes.getOption4() %></label>
					  </div>
					   
					   
					</div>
					
					<%
					
					  if(j==1)
					  {
						  %>
						  
						  
					        <a href="#" class="btn btn-danger" onclick="ShowQuestion(<%=j+1 %>)" style="padding-left:10px;padding-right:10px;padding-top:7px;padding-bottom:7px;border-radius:0px;color:white;font-size:1em;">Next</a>
					
						  
						  <%
						  
					  }else if(j > 1 && j < quiz.getNumberOfQuestion())
					  {
						  %>
						  
						  
						  	<a href="#" class="btn btn-danger" onclick="ShowQuestion(<%=j-1 %>)" style="padding-left:10px;padding-right:10px;padding-top:7px;padding-bottom:7px;border-radius:0px;color:white;font-size:1em;">Previous</a>
					
					      	<a href="#" class="btn btn-danger" onclick="ShowQuestion(<%=j+1 %>)" style="padding-left:10px;padding-right:10px;padding-top:7px;padding-bottom:7px;border-radius:0px;color:white;font-size:1em;">Next</a>
					
						  
						  <%
						  
						  
					  }
					  else
					  {
						  %>
						  
						  
							<a href="#" class="btn btn-danger" onclick="ShowQuestion(<%=j-1 %>)" style="padding-left:10px;padding-right:10px;padding-top:7px;padding-bottom:7px;border-radius:0px;color:white;font-size:1em;">Previous</a>
					
					 		<button type="submit" name="SubmitQuiz" class="btn btn-success" style="padding-left:10px;padding-right:10px;padding-top:7px;padding-bottom:7px;border-radius:0px;color:white;font-size:1em;">Finish</button>
					
						  
						  
						  <%
						  
					  }
					
					%>
					
                    
                 
                 
                 </div>
                        	 
                        	 
                        	 <%
                        	 
                         }
                     
                     %>
               
                 
                
	                        
            </div>
            
            
            
       
       </div>
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
     
     </div>
  
  </section>
<!-- ======= quiz Section ======= -->


</form>






<!-- ======= login Section ======= -->


   <!-- footer start from here -->

    <%@include file="footer.jsp" %> 

<!-- footer ends from here -->


<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<!-- <script type="text/javascript" src="js/myjs.js"></script> -->


<script>


   $(document).ready(function(){
	   
	   
	   $(".questionlinkClass").click(function(){
		   
		   var id = this.id.replace("questionlinkid","");
		   $(".questiondivClass").hide();
		   $("#divID"+id).show();
		  // alert(id);
		   
	   });
	   
	  $(".radioOption").change(function(){
		   
		   var questionslno = this.id.split("-")[1];
		   //alert(questionslno);
		   $("#questionanswered"+questionslno).val("1");
		   $("#questionlinkid"+questionslno).removeClass("text-play");
		   $("#questionlinkid"+questionslno).addClass("text-checked");
		 //  $(".questiondivClass").hide();
		 //  $("#divID"+id).show();
		  // alert(id);
		   
	   });
	   
	   
	   
	   
	  
	   
   });
   
   function ShowQuestion(i) {
	   $("#questionlinkid"+i).click();
   }


</script>




<script>

// var time=document.getElementsByClassName("timer");
// var timings=document.getElementById("QuizTotalQuestions").value;
// console.log(timings);
// var i=0;
// var myInterval = setInterval(Timeout, 1000);
// function Timeout(){
// if((timings*60-i)%60>=10){
// time[0].innerHTML=parseInt(`${(timings*60-i)/60}`)+":"+`${(timings*60-i)%60}`;
// }
// else{
// time[0].innerHTML=parseInt(`${(timings*60-i)/60}`)+":0"+`${(timings*60-i)%60}`;
// }
// i++;
// }



// var sec         = 10,
//     countDiv    = document.getElementById("timer"),
//     secpass,
//     countDown   = setInterval(function () {
//         'use strict';
        
//         secpass();
//     }, 1000);

// function secpass() {
//     'use strict';
    
//     var min     = Math.floor(sec / 60),
//         remSec  = sec % 60;
    
//     if (remSec < 10) {
        
//         remSec = '0' + remSec;
    
//     }
//     if (min < 10) {
        
//         min = '0' + min;
    
//     }
//     countDiv.innerHTML = min + ":" + remSec;
    
//     if (sec > 0) {
        
//         sec = sec - 1;
        
//     } else {
        
//         clearInterval(countDown);
        
//         countDiv.innerHTML = 'countdown done';
        
//         document.getElementById("myformjs").click();;
        
//     }
// }

</script>

</body>
</html>