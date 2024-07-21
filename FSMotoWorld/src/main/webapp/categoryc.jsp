<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Categoria</title>
<link rel="stylesheet" href = "images/bootstrap.css">

<link rel="stylesheet" href="Css/w3.css">
<link rel="stylesheet" href="Css/font.css">

<style>
.w3-sidebar a {font-family: "Roboto", sans-serif}
body,h1,h2,h3,h4,h5,h6,.w3-wide {font-family: "Montserrat", sans-serif;}
</style>
    
   
</head>

<body>

<%@ include file = "customer_navbar.jsp" %>
	<div style="background-color: #ebe9eb">
	<br>
	<h1>Prodotti Categorie </h1>
	<br>
	</div>
	<br>
          
              <div class = "container border" style="background-color:">

  	<center>
    <div class = "container"  >
		<center>
        <div class = "row">
				<%String parts = "ricambi";
				%>
				
			<div class = "col-1 "">
						<center>
                     	
              		   </center>
            </div>
            
            <div class = "col-xxl-5 col-xl-5 col-lg-5 col-md-5 col-sm-12 col-xs-12 "">
						<center>
							<table>
								<tr><th>
                       				<a href = "partsc.jsp"><img src="images/ricambi.png" alt="Ricambi"   height="200px"></a>
                       			</th></tr><br>
                       			<tr style='background-color: #ebe9eb'><th style='border: 1px solid; text-align: center'>
              		   				<a href = "partsc.jsp?parts=parts">Ricambi</a>
              		   			</th></tr>	
              		   		</table>
              		   </center>
            </div>
          
          

            <div class = "col-xxl-5 col-xl-5 col-lg-5 col-md-5 col-sm-12 col-xs-12 ">
            			<center>
            			<%String accessories = "accessori";
				%>
							<table>
								<tr><th>
            						<a href = "accessoriesc.jsp"><img src="images/accessori.png" alt="Ricambi"  height="200px"></a>
            				</th></tr><br>
            				<tr style='background-color: #ebe9eb'><th style='border: 1px solid; text-align: center'>
              		   				<a href = "accessoriesc.jsp">Accessori</a>
              		   		</th></tr>
              		   		</table>
               			</center>
            </div>
            
            <div class = "col-1 "">
						<center>
                     	
              		   </center>
            </div>
            
            <div class = "col-1 "">
						<center>
                     	
              		   </center>
            </div>
		

            <div class = "col-xxl-5 col-xl-5 col-lg-5 col-md-5 col-sm-12 col-xs-12 ">
                <center>
                <%String clothing = "abbigliamento";
				%>
					<table>
						<tr><th>
                			<a href = "clothingc.jsp"><img src="images/abbigliamento.png" alt="Ricambi"  height="200px"></a>
                		</th></tr><br>
                		<tr style='background-color: #ebe9eb'><th style='border: 1px solid; text-align: center'>
              		   		<a href = "clothingc.jsp">Abbigliamento</a>
              		   	</th></tr>
              		</table>
                </center>
            </div>
            
         
            <div class = "col-xxl-5 col-xl-5 col-lg-5 col-md-5 col-sm-12 col-xs-12 ">
				<center>
				<%String maintenance = "manutenzione";
				%>
					<table>
						<tr><th>
							<a href = "maintenancec.jsp"><img src="images/manutenzione.png" alt="Ricambi" height="200px"></a>
						</th></tr><br>
						<tr style='background-color: #ebe9eb'><th style='border: 1px solid; text-align: center'>
              		   		<a href = "maintenancec.jsp">Manutenzione</a>
              		   	</th></tr>	
              		</table>
				</center>
            </div>
            
            <div class = "col-1 "">
						<center>
                     	
              		   </center>
            </div>
            
            </div>
            </center>
        </div>
        </center>
    </div>

</div>
    
          <br>
	<footer text-align: center;
  padding: 3px;
  background-color: DarkSalmon;
  color: white;>
  
	<%@ include file = "footer.jsp" %>
</footer> 
           
</body>
</html>