
<%@page import="com.online.quiz.entities.User"%>
<%

   User user2 = (User) session.getAttribute("user");
   
   boolean loginstatus = false;

   if(user2!=null)
   {
	   
	   loginstatus = true;
	   
   }
   else
   {
	   loginstatus = false;
	   
   }

%>



<!-- ======= Header ======= -->
<header id="header" class="fixed-top">
    <div class="container d-flex align-items-center justify-content-between">

      <h1 class="logo"><a href="index.jsp">OnlineQuizApp</a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

      <nav id="navbar" class="navbar">
        <ul>
             <li><a class="nav-link scrollto active" href="showQuizzes.jsp">Browse Quizzes</a></li>
<!--          <li><a class="nav-link scrollto" href="#services">Browse</a></li> -->
<!--           <li><a class="nav-link scrollto o" href="#portfolio">Portfolio</a></li> -->
<!--           <li><a class="nav-link scrollto" href="#team">Team</a></li> -->
<!--           <li><a class="nav-link scrollto" href="#pricing">Pricing</a></li> -->
<!--           <li class="dropdown"><a href="#"><span>Drop Down</span> <i class="bi bi-chevron-down"></i></a> -->
<!--             <ul> -->
<!--               <li><a href="#">Drop Down 1</a></li> -->
<!--               <li class="dropdown"><a href="#"><span>Deep Drop Down</span> <i class="bi bi-chevron-right"></i></a> -->
<!--                 <ul> -->
<!--                   <li><a href="#">Deep Drop Down 1</a></li> -->
<!--                   <li><a href="#">Deep Drop Down 2</a></li> -->
<!--                   <li><a href="#">Deep Drop Down 3</a></li> -->
<!--                   <li><a href="#">Deep Drop Down 4</a></li> -->
<!--                   <li><a href="#">Deep Drop Down 5</a></li> -->
<!--                 </ul> -->
<!--               </li> -->
<!--               <li><a href="#">Drop Down 2</a></li> -->
<!--               <li><a href="#">Drop Down 3</a></li> -->
<!--               <li><a href="#">Drop Down 4</a></li> -->
<!--             </ul> -->
<!--           </li> -->
                  
                  
                  
					<!--  login for student -->
                  <%
             	  
             	     if(loginstatus && user2.getModule().equals("student"))
             	     {
             	    	 %>
             	    	 
             	    	
             	    	 <li><a class="nav-link scrollto" href="profile.jsp"><img src="img/default.png" style="width:20px;height:20px;border-radius:100%;border:2px solid #2487ce;margin-right:4px;">  <%= user2.getName() %></a></li>
          		         
          		         <li><a class="getstarted scrollto" href="Logout">Logout</a></li>
             	    	 
             	    	 <%
             	    	 
             	     }
             	  
             	  %>
             	  
             	  <!-- ends login for student -->
             	  
             	  
             	  
             	  
             	  
             	  <!--  login for teacher -->
                  <%
             	  
             	     if(loginstatus && user2.getModule().equals("teacher"))
             	     {
             	    	 %>
             	    	<li><a class="nav-link scrollto" href="createQuestion.jsp"><b>+ Post Quiz</b></a></li>
             	    	
             	    	  <li class="dropdown"><a href="#"><span><b>Make Quiz</b></span> <i class="bi bi-chevron-down"></i></a>
				            <ul>
				              <li><a href="createQuiz.jsp">Create New Quiz</a></li> </ul>
				          </li>
          				 
             	    	 <li><a class="nav-link scrollto" href="profile.jsp"><img src="img/default.png" style="width:20px;height:20px;border-radius:100%;border:2px solid #2487ce;margin-right:4px;">  <%= user2.getName() %></a></li>
          		         
          		         <li><a class="getstarted scrollto" href="Logout">Logout</a></li>
             	    	 
             	    	 <%
             	    	 
             	     }
             	  
             	  %>
             	  
             	  <!-- ends login for teacher -->
             	  
             	  
             	  
             	  
             	  
             	  <!--  login for admin -->
                  <%
             	  
             	     if(loginstatus && user2.getModule().equals("admin"))
             	     {
             	    	 %>
             	    	 
             	    	 <li><a class="nav-link scrollto" href="#!"><b>Manage User</b></a></li>
             	    	 
             	    	 <li><a class="nav-link scrollto" href="createQuestion.jsp"><b>+ Post Quiz</b></a></li>
             	    	 
				           <li class="dropdown"><a href="#"><span><b>Make Quiz</b></span> <i class="bi bi-chevron-down"></i></a>
				            <ul>
				              <li><a href="createQuiz.jsp">Create New Quiz</a></li>
				              <li><a href="#">Manage Exam</a></li>
				              <li><a href="#">Manage MCQ</a></li>
				              <li><a href="#">Manage Question</a></li>
				              <li><a href="#">Show Result</a></li>
				            </ul>
				          </li>
          				 
             	    	 <li><a class="nav-link scrollto" href="profile.jsp"><img src="img/default.png" style="width:20px;height:20px;border-radius:100%;border:2px solid #2487ce;margin-right:4px;">  <%= user2.getName() %></a></li>
          		         
          		         <li><a class="getstarted scrollto" href="Logout">Logout</a></li>
             	    	 
             	    	 <%
             	    	 
             	     }
             	  
             	  %>
             	  
             	  <!-- ends login for admin -->
             	  
             	  
             	  
             	  
             	  

             	  <%
             	  
             	     if(!loginstatus)
             	     {
             	    	 %>
             	    	 
             	    	 <li><a class="nav-link scrollto" href="login.jsp">Login</a></li>
          		         <li><a class="getstarted scrollto" href="register.jsp">Register Here</a></li>
             	    	 
             	    	 <%
             	    	 
             	     }
             	  
             	  %>
             	   
            
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->