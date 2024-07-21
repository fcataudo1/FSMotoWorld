<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Cliente</title>
<link rel="stylesheet" href = "images/bootstrap.css">

<link rel="stylesheet" href="Css/w3.css">
<link rel="stylesheet" href="Css/abc.css">
<link rel="stylesheet" href="Css/font.css">
<link rel="stylesheet" href="Css/whitespace.css">
 <!-- Add jQuery library -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
.w3-sidebar a {font-family: "Roboto", sans-serif}
body,h1,h2,h3,h4,h5,h6,.w3-wide {font-family: "Montserrat", sans-serif;}

.a{
	margin-right: 260px;
	
	}
    
    .b{
	margin-right: 245px;
	
	}

	 .d{
	margin-right: 110px;
	
	}
</style>
</head>
<body>
<form method= "post" action = "checkcustomer">

<%@ include file = "navbar.jsp" %>
<% String Total4 = request.getParameter("Total"); %>
	
	<input type = "hidden" name = "Total" value =<%=Total4 %> >
	
	
	<% String CusName4 = request.getParameter("CusName"); %>
	
	<input type = "hidden" name = "CusName" value =<%=CusName4 %> >
	
<%
String cregg = null;
String fail = null;
	String msg = null;
	Cookie[] cookies = request.getCookies();

    for(int i = 0; i < cookies.length; i++) 
    {
        if (cookies[i].getName().equals("cname")) 
        {
         cookies[i].setMaxAge(0);
        response.addCookie(cookies[i]);
        msg = "Ti sei disconnesso con successo....";
	}
        
        if (cookies[i].getName().equals("un")) 
    	{
            cookies[i].setMaxAge(0);
            response.addCookie(cookies[i]);
            fail = "L'e-mail o la password sono errati.";
    	} 
       
        
        if (cookies[i].getName().equals("creg")) 
    	{
            cookies[i].setMaxAge(0);
            response.addCookie(cookies[i]);
            cregg = "Cliente registrato con successo.<br> Ora prova ad accedere.";
    	} 
       
}
	%>
		<center>
				<div style="background-color: #ebe9eb">
	<br>
	<h1>Login Cliente</h1>
	<br>
	</div>
	<br>
	      
            <div class = "container border" style="background-color:white">
                <br>
                
                <div class = "row" style="justify-content: center">

                        <div class = "col-xl-2 col-lg-1 col-md-1" style="background-color:white">
                            <br>
                            <center>
                                <img src="images/loginimg.png" alt=Feedback height="350px">   
                            </center><br>

                        </div>
                        <br>
                        &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
                        &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
                        &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
                        &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
                        &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;

                        <div class = "col-xl-2 col-lg-1 col-md-1" style="background-color: white">
                            <center> 
	
	
	
	
	
	<br>
	<%if(msg != null)
		out.println("<b style='color: firebrick'>" + msg +  "</b>");%>
	<%if(fail != null)
		out.println("<b style='color: firebrick'>" + fail +  "</b>");%>		
			
	<%if(cregg != null)
		out.println("<b style='color: firebrick'>" + cregg +  "</b>");%>		
					
			
			<br>
           <h4 class = "a ws"><b> Email:</b> </h4>
           <h2><input type ="email" id = "x1" name ="Email_Id" class = "c" required></h2>
            
           <h4 class = "b ws"><b> Password: </b></h4>
           <h2><input type ="password" id = "x2" name ="Password" class = "c" required></h2>
            
            <br>
            <h3><b><input type ="submit" name="b1" value ="Login"></b></h3>
            
		
        </center>
        
        <br>
        <br>
        <a href = 'customer_reg.jsp?Total=<%=Total4 %>&CusName=<%=CusName4 %>' class ="d w3-bar-item w3-button" ><h4><b>Registrazione Cliente</b></h4></a>
        
            
            
            
            </center> 
                            <br>
                            <br>                        
                        </div>
                    
                </div>    
                <br>
            </div>    
            
            
            
            
            
            
            
            
            
            
            
            <br>
	<footer>
  
	<%@ include file = "footer.jsp" %>
</footer>
            
		</form>
		
		<script>
$(document).ready(function() {
    $('#loginForm').submit(function(event) {
        event.preventDefault(); // Prevent the form from submitting the traditional way

        $.ajax({
            type: 'POST',
            url: 'checkcustomer', // URL to send the form data to
            data: $(this).serialize(), // Serialize form data
            success: function(response) {
                // Handle successful response here
                $('#loginMessages').html('<b style="color: green">Login effettuato con successo!</b>');
                // Optionally, you can redirect the user or update the page
                window.location.href = 'customerhome.jsp'; // Redirect to another page on success
            },
            error: function(xhr, status, error) {
                // Handle error here
                $('#loginMessages').html('<b style="color: firebrick">Errore durante il login. Riprova più tardi.</b>');
            }
        });
    });
});
</script>

</body>
</html>