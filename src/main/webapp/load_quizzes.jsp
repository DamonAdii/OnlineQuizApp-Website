<%@page import="com.online.quiz.entities.Category"%>
<%@page import="com.online.quiz.Dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.online.quiz.entities.Quiz"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.online.quiz.helper.ConnectionProvider"%>
<%@page import="com.online.quiz.Dao.QuizDao"%>
<%@page import="com.online.quiz.entities.User"%>
<div class="row">


	<%
	
	int pageNumber,pageSize=5,count;
	int pgno = request.getParameter("pgno")==null?0:Integer.parseInt(request.getParameter("pgno"));
	System.out.println("pgno :"+pgno);
	pageNumber = pgno * pageSize;
    System.out.println("pageNumber :"+pageNumber);
    
    User user = (User) session.getAttribute("user");
    
	boolean loginstatus = false;

	   if(user!=null)
	   {
		   
		   loginstatus = true;
		   
	   }
	   else
	   {
		   loginstatus = false;
		   
	   }
	   
	   
	 QuizDao qdao = new QuizDao(ConnectionProvider.getConnection());
	  
	 // ArrayList<Quiz> qlist = qdao.getAllQuizes();
	 
	 int cid = Integer.parseInt(request.getParameter("cid"));
	 
	 List<Quiz> qlist = null;
	 
	 if(cid == 0)
	 { 
		qlist = qdao.getAllQuizes(pageNumber,pageSize);
	 }
	 else{
		 
		 qlist = qdao.getAllQuizesByCatId(cid);
		 
	 }
	 
	 count = qdao.getTotalCount();
	 
	 if (qlist.size() == 0) {
         out.println("<h3 class='display-3 text-center'>No Quizzes in this category..</h3>");
         return;
     }
     
     for (Quiz q : qlist) {
               
    %>


	<div class="col-12 mb-2">

		<div class="card">
			<div class="card-header">Featured</div>
			<div class="card-body">
				<h5 class="card-title"><%= q.getQtitle()  %></h5>
				<p class="card-text"><%=  q.getQdescripton() %></p>
				
				<div class="row">
				     <div class="col-3">
				         <p>Total Marks : <%=  q.getMaxMarks() %></p>
				     </div>
				     
				     <div class="col-4">
				         <p>Number of Questions : <%= q.getNumberOfQuestion() %></p>
				     </div>
				</div>
				
       <%-- <input type="hidden" id="checkid" value="<%= user.getId() %>" /> --%>
				
				<%
				
				if(loginstatus == true)
				{
					
				%>
				
				 <a href="startQuiz.jsp?quiz_id=<%= q.getQid()%>&questionId=0&fetchNext=0" class="btn btn-primary" style="background:#16507b;">Play Quiz</a>
				
				<%	
					
				}
				else{
					%>	
					<a href="#" class="btn btn-primary" style="background:#16507b;">Play Quiz</a>
					
				<%		
				}
				
				 
				%>
				
				
			</div>
		</div>

	</div>
	
	
	 <%
        }
        

    %>
    
    
    	<!-- start pagination from here -->
	
	
	<div class="col-12 text-center">
	
	      <%
	       
	         for(int i=0; i<=count/pageSize ;i++){
	        	 
	        %>	 
	        	 <a type="submit" href="showQuizzes.jsp?pgno=<%=i%>" class="btn btn-success">Page <%= i+1 %></a>
	        
	        <%
	        
	         }
	      
	      %>
	
<%-- 	    <a href="showQuizzes.jsp?pageNumber=<%= pageNumber-1 %>" class="btn btn-dark disabled">Previous</a> --%>
	    
<%-- 	    <a href="showQuizzes.jsp?pageNumber=<%= pageNumber+1 %>" class="btn btn-dark">Next</a> --%>
	
	</div>
	
	
		<!-- ends pagination here -->

</div>


