
<%@page import="com.online.quiz.entities.User"%>

<%


   User  user = (User) session.getAttribute("user");
   
   if(user==null)
   {
	   response.sendRedirect("login.jsp");
	   
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

<!-- ======= Header ======= -->


<%@include file="navBlogin.jsp" %>

   
   
   <div class="container-fluid">
   
       <div class="row" style="padding-top: 70px;">
       
          <div class="col-12">
          
          
             <h1> welcome to profile : <%= user.getName() %> as <%= user.getModule() %></h1>
          
          
          </div>
       
       </div>
   
   </div>
   




<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<!-- <script type="text/javascript" src="js/myjs.js"></script> -->
</body>
</html>