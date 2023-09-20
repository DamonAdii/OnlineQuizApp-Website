



<%@page import="com.online.quiz.entities.Message"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login - OnlineQuizApp</title>
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
	          <h4>User Login</h4>
	        </div>
	        
	      </div>
      
      </div>
      
     
  </section>
  
  
  <section style="padding: 20px 0;">
  
  
       <div class="container" data-aos="fade-up">
      
      
	      <div class="row justify-content">
	        
	        <div class="col-xl-12 col-lg-12">
	          
	          <h4>Login</h4>
	           
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
	        
	        <div class="col-xl-12 col-lg-12">
          
          <form action="Login" method="POST">
			  
			  <div class="row mb-3" style="width:650px;">
			    <div class="col">
			      <label for="exampleInputEmail1"><span style="color:#757575;font-size:.8em">User Name Or Email*</span></label>
			      <input type="text" class="form-control bg-light" placeholder="User Name or Email" name="email">
			      </div>
			    <div class="col">
			      <label for="exampleInputEmail1"><span style="color:#757575;font-size:.8em">Password*</span></label>
			      <input type="password" class="form-control bg-light" placeholder="Password" name="pass">
			      
			    </div>
			  </div>
			  
			  <div class="row">
			    <div class="col">
			    <button type="submit" class="btn btn-primary">Login</button>
			    </div>
			  </div>
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