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
		
	<footer text-align: center;
  padding: 3px;
  background-color: DarkSalmon;
  color: white;>
  
	<%@ include file = "footer.jsp" %>
</footer>
        
    </form>


</body>
</html>
