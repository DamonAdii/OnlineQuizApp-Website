<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register - OnlineQuizApp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


</head>
<body>

<!-- navbar start from here -->

    <%@include file="navBlogin.jsp" %> 

<!-- navbar ends from here -->


<!-- ======= register Section ======= -->
  <section id=register class="d-flex" style="padding: 70px 0 20px 0;">
  
      <div class="container-fluid" data-aos="fade-up">
      
      
	      <div class="row justify-content">
	        
	        <div class="col-xl-12 col-lg-12 bg-dark text-white pt-3 pl-5 pb-2">
	          <h4>User Register</h4>
	        </div>
	        
	      </div>
      
      </div>
      
     
  </section>
  
  
  <section style="padding: 20px 0;">
  
  
       <div class="container" data-aos="fade-up">
      
      
	      <div class="row justify-content">
	        
	        <div class="col-xl-12 col-lg-12">
	          <h4>Register</h4>
	          <hr>
	        </div>
	        
	      </div>
      
      </div>
  
  </section>
  
  
  
  <section style="padding:20px 0px 100px 0px">
  
     <div class="container"  data-aos="fade-up">
     
       <div class="row justify-content">
	        
	        <div class="col-xl-12 col-lg-12">
          
          <form name="regform" id="reg-form" onsubmit="return regvalidation()" action="RegisterServlet" method="POST" style="width:650px;">
          
                <span style="color:#757575;font-size:.9em;">Enter Full Name</span>
             	<input type="text" class="form-control bg-light" placeholder="enter your name" id="username" name="name1" style="height:50px;border-radius:0px;">
			    <span id="nameerror" style="color:red;font-size:.7em;"></span>
			  
				<br>
				<br>
			    
			    <span style="color:#757575;font-size:.9em;">Enter Email</span>
  				<input type="email" class="form-control bg-light" placeholder="name@example.com" id="useremail" name="email1" style="height:50px;border-radius:0px;">
			    <span id="emailerror" style="color:red;font-size:.7em;"></span>
			  
			  
			  
			  <br>
			  <br>
			  
			   <span style="color:#757575;font-size:.9em;">Select Account Type</span>
			    
			    <select class="form-control form-select" name="module1" id="selection" aria-label="Default select example">
										  
					<option selected>select</option>
										  
					<option value="student">Student</option>
										  
					<option value="teacher">Teacher</option>
										 
				</select>
			    
               <span id="accounterror" style="color:red;font-size:.7em;"></span>
			  
			  
			  <br>
			  <br>
			  
			  <span style="color:#757575;font-size:.9em;">Enter Password</span>
			  <input type="password" class="form-control bg-light" placeholder="password"  id="password1" name="pass1" style="height:50px;border-radius:0px;">
			  <span id="passerror1" style="color:red;font-size:.7em;"></span>
			 
			 <br>
			 <br>
			 
			 
			   <span style="color:#757575;font-size:.9em;">Enter Confirm Password</span>
			   <input type="password" class="form-control bg-light" placeholder="confirm password" id="cpassword1" name="cpass1"  style="height:50px;border-radius:0px;">
			   <span id="cpasserror" style="color:red;font-size:.7em;"></span>
			   
			   <br>
			   <br>
			   
			   
			   <span style="color:#757575;font-size:.9em;">Select Gender</span>
			   
			   <br>
			   <div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="gender1" value="Male">
				  <label class="form-check-label" for="inlineRadio1">Male</label>
				</div>
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="gender1" value="Female">
				  <label class="form-check-label" for="inlineRadio2">Female</label>
				</div>
				<br>
                <span id="gendererror" style="color:red;font-size:.7em;"></span>
                
                
               <br>
               <br>

			  
			  <div class="form-group">
			    
			    <div class="form-check">
			      
			      <input class="form-check-input" type="checkbox" id="gridCheck" name="check">
			      
			      <label class="form-check-label" for="gridCheck" style="color:#757575;font-size:.8em;">
			        
			        Agree, Terms & conditions
			     
			      </label>
			    
			    </div>
			  
			  </div>
			  
			  <div class="form-group">
			    <button type="submit" id="submitbtn" class="btn btn-primary">Register</button>
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
<script type="text/javascript" src="js/regFormValidation.js"></script>
<script type="text/javascript" src="js/regAjax.js"></script>



</body>
</html>