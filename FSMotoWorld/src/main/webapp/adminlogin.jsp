<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>
<link rel="stylesheet" href = "images/bootstrap.css">

<link rel="stylesheet" href="Css/w3.css">
<link rel="stylesheet" href="Css/abc.css">
<link rel="stylesheet" href="Css/font.css">
<link rel="stylesheet" href="Css/spin.css">


<style>
.w3-sidebar a {font-family: "Roboto", sans-serif}
body,h1,h2,h3,h4,h5,h6,.w3-wide {font-family: "Montserrat", sans-serif;}
.a{
	margin-right: 240px;
	
	}
    
    .b{
	margin-right: 245px;
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
</style>

</head>
<body>
	
<form method= "post" action = "checkadmin">

	<%@ include file = "navbar.jsp" %>
	<%
	String fail = null;
	String msg = null;
	Cookie[] cookies = request.getCookies();

    for(int i = 0; i < cookies.length; i++) 
    	{
    if (cookies[i].getName().equals("tname")) 
    	{
            cookies[i].setMaxAge(0);
            response.addCookie(cookies[i]);
            msg = "Ti sei disconnesso con successo....";
    	}    
    
    if (cookies[i].getName().equals("un")) 
	{
        cookies[i].setMaxAge(0);
        response.addCookie(cookies[i]);
        fail = "Username o password sono errati.";
	} 
    }

	%>
			<center>
					<div style="background-color: #ebe9eb">
	<br>
	<h1>Admin Login</h1>
	<br>
	</div>
	<br>
	
	
	
	 <div class = "container border" style="background-color:white">
                <br>
                
                <div class = "row" style="justify-content: center">

                        <div class = "col-xl-2 col-lg-1 col-md-1" style="background-color:white">
                            <br>
                            <center>
                                <img src="images/adminimg.png" alt=Picture height="350px" class="spinhov3D">   
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
		
		
		
		<%if(msg != null)
		out.println("<b style='color: firebrick'>" + msg +  "</b>");%>
		
		<%if(fail != null)
		out.println("<b style='color: firebrick'>" + fail +  "</b>");%>
			<br>
           <h4 class = "a"><b> Username: </b></h4>
           <h2><input type ="text" id = "x1" name ="Username" class = "c" required></h2>
            
           <h4 class = "b"><b> Password: </b></h4>
           <h2><input type ="password" id = "x2" name ="Password" class = "c" required></h2>
            <br>
            
            <h3><b><input type ="submit" name="b1" value ="Login"></b></h3>
            
             </center> 
                            <br>
                            <br>                        
                        </div>
                    
                </div>    
                <br>
            </div>  
            
            
            
            
             <div style="color: firebrick"><h3><b>Prova usando</b></h3>
            <h4><b>Username: admin</b></h4>
            <h4><b>Password: admin</b></h4>
            
            
            
            
            
            </center>
            
            
            
            <br>
	<footer>
  
	<%@ include file = "footer.jsp" %>
</footer>
            
		</form>
		
		
		<script>
$(document).ready(function() {
    $('#loginForm').on('submit', function(e) {
        e.preventDefault();

        $.ajax({
            url: 'checkadmin',
            type: 'POST',
            data: $(this).serialize(),
            success: function(response) {
                // Assuming the server returns a JSON object with success or error message
                var result = JSON.parse(response);
                if (result.success) {
                    window.location.href = 'adminhome.jsp'; // Redirect to admin dashboard on success
                } else {
                    $('#message').html('<b style="color: firebrick">' + result.message + '</b>');
                }
            },
            error: function(xhr, status, error) {
                $('#message').html('<b style="color: firebrick">Errore durante il login</b>');
                console.error(error);
            }
        });
    });
});
</script>
		
		
		
</body>
</html>