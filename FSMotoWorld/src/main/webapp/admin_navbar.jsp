	<%@ include file="validatelogina.jsp" %>
	
	<%@ include file="cartnullqty.jsp" %>
	
	<div style='margin-left:6% '>
	
	<b style='color: firebrick'>Benevenuto <%= A%> </b> 
	
<b>	<a href="cartnulla.jsp" class="w3-bar-item w3-button" ><img src = images/cart.png height=40px alt=Cart></a>

	<b style="position: relative;
  top: 16px;
  right: 37px;"><span style="height: 25px;
  width: 25px;
  background-color: red;
  border-radius: 50%;
  display: inline-block"><b style="color:white"><center><%=tqty %></center></b></span></b>
	</b>
	
		
	<a href="addproduct.jsp" class="w3-bar-item w3-button"  ><b>Aggiungere Prodotto</b></a>
	
	<a href="updateproduct.jsp" class="w3-bar-item w3-button"  ><b>Aggiornare Prodotto</b></a>
	
	<a href="deleteproduct.jsp" class="w3-bar-item w3-button"  ><b>Rimuovere Prodotto</b></a>
	
	<a href="vieworders.jsp" class="w3-bar-item w3-button"  ><b>Visualizzare Ordini</b></a>
	
	
	
	
	<a href = "managecustomers.jsp" class="w3-bar-item w3-button" ><b>Gestire Clienti</b></a>
	
	<a href = "managetables.jsp" class="w3-bar-item w3-button" ><b>Gestire Altro</b></a>
	
	
	<a href="adminlogin.jsp" class="w3-bar-item w3-button"  ><b>Admin Logout</b></a>&ensp;
	
	</div>
	<center>
	<b class="w3-wide" style="width:250px"> <h3><b>F&S MotoWorld</b></h3></b>
	
	<div class=" w3-large w3-text-grey" style="font-weight:bold">
	
	<a href="adminhome.jsp" class="w3-bar-item w3-button"  >Admin Home</a>&ensp;
	
	<a href="categorya.jsp" class="w3-bar-item w3-button"  >Visualizza Categorie</a>&ensp;
	
	<a href="partsa.jsp" class="w3-bar-item w3-button">Ricambi</a>&ensp;
	<a href="accessoriesa.jsp" class="w3-bar-item w3-button">Accessori</a>&ensp;
	<a href="clothinga.jsp" class="w3-bar-item w3-button">Abbigliamento</a>&ensp;
	<a href="maintenancea.jsp" class="w3-bar-item w3-button">Manutenzione</a>&ensp;
	
	<a href="viewproducta.jsp" class="w3-bar-item w3-button"  >Visualizza Tutti i Prodotti</a>&ensp;
	
	<a href="aboutusa.jsp" class="w3-bar-item w3-button"  >Chi siamo</a>&ensp;
	
	</div>
	<hr>

	