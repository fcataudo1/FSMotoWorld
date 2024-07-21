<%@ page import="com.entity.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="com.conn.DBConnect" %>
<%@ page import="com.dao.DAO" %>
<%@ page import="java.sql.*" %>
<%@page import="com.entity.category"%>
<%@page import="com.entity.brand"%>
<%@page import="java.util.List"%>
<%@page import="com.conn.DBConnect"%>
<%@page import="com.dao.DAO"%>
<%@page import="java.sql.*"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Eliminare Prodotto</title>
<link rel="stylesheet" href = "images/bootstrap.css">

<link rel="stylesheet" href="Css/w3.css">
<link rel="stylesheet" href="Css/font.css">
<link rel="stylesheet" href="Css/abc.css">
<!-- Add jQuery library -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
.w3-sidebar a {font-family: "Roboto", sans-serif}
body,h1,h2,h3,h4,h5,h6,.w3-wide {font-family: "Montserrat", sans-serif;}


.a{
	margin-right: 225px;
	
	}
    
    .b{
	margin-right: 190px;
	
	}
	
	.e{
	margin-right: 205px;
	
	}
    
    .d{
	margin-right: 215px;
	
	}
	
	.f{
	margin-right: 265px;
	
	}
	
	.g{
	margin-right: 195px;
	
	}
	
	.j{
	margin-left: 17px;
	
	}


</style>
</head>
<body>
 <form method="post" action="deleteProduct">
 <%@ include file = "admin_navbar.jsp" %>
	
		<div style="background-color: #ebe9eb">
	<br>
	<h1>Eliminare Prodotto</h1>
	<br>
	</div>
	<br>
	
	 <div class="container border">
  	<h4><b>Seleziona il prodotto da eliminare:</b></h4>
        <select name="pid">
            <% 
                DAO dao = new DAO(DBConnect.getConn());
                List<Product> productList = dao.getAllProducts();
                for(Product product : productList) {
                	 %>
                     <option value="<%= product.getPid() %>"><%= product.getPid() %> - <%= product.getPname() %></option>
                     <% } %>
        </select>
        <input type="submit" value="Elimina prodotto">
        
        
        
        <br>
		</div>
		
		<br>
		
	<footer >
  
	<%@ include file = "footer.jsp" %>
</footer>
        
    </form>
    
    <script>
$(document).ready(function() {
    $('#deleteProductForm').submit(function(event) {
        event.preventDefault(); // Prevent the form from submitting the traditional way

        $.ajax({
            type: 'POST',
            url: $(this).attr('action'), // Use the action attribute of the form
            data: $(this).serialize(), // Serialize form data
            success: function(response) {
                // Handle successful response here
                $('#resultMessage').html('<b style="color: green">Prodotto eliminato con successo!</b>');
                // Optionally, update the product list or redirect
            },
            error: function(xhr, status, error) {
                // Handle error here
                $('#resultMessage').html('<b style="color: firebrick">Errore durante l\'eliminazione del prodotto. Riprova più tardi.</b>');
            }
        });
    });
});
</script>


</body>
</html>
