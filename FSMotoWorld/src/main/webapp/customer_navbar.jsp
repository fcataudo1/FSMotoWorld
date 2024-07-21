	<% String Total2 = request.getParameter("Total"); %>
	
	<input type = "hidden" name = "Total" value =<%=Total2 %> >
	
	<% String CusName2 = request.getParameter("CusName"); %>
	
	<input type = "hidden" name = "CusName" value =<%=CusName2 %> >
	
	
	

	<%@ include file="validateloginc.jsp" %>

	<div style='margin-left:40% '>
	
	<b style='color: firebrick'>Benvenuto <%= N%> </b> 
	
	<b>
	<a href="cart.jsp" class="w3-bar-item w3-button" ><img src = images/cart.png height=40px alt=Cart></a>
	<b style="position: relative;
  top: 16px;
  right: 37px;"><span style="height: 25px;
  width: 25px;
  background-color: red;
  border-radius: 50%;
  display: inline-block"><b style="color:white"><center><%=tcqty %></center></b></span></b>
	</b>
	<a href="orders.jsp" class="w3-bar-item w3-button" ><b> Visualizza l'elenco degli ordini</b></a>
	
	<a href="customerlogin.jsp" class="w3-bar-item w3-button" ><b>Logout</b></a>
	
	<a href="contactusc.jsp" class="w3-bar-item w3-button" ><b>Contattaci</b></a>
	
	</div>
	<center>
	<b class="w3-wide" style="width:250px"> <h3><b>F&S MotoWorld</b></h3></b>
	
	<div class=" w3-large w3-text-grey" style="font-weight:bold">
	
	<a href="customerhome.jsp" class="w3-bar-item w3-button" >Home Cliente</a>&ensp;
	
	<a href="categoryc.jsp" class="w3-bar-item w3-button" >Visualizza categorie</a>&ensp;
	
	<a href="partsc.jsp" class="w3-bar-item w3-button">Ricambi</a>&ensp;
	<a href="accessoriesc.jsp" class="w3-bar-item w3-button">Accessori</a>&ensp;
	<a href="clothingc.jsp" class="w3-bar-item w3-button">Abbigliamento</a>&ensp;
	<a href="maintenancec.jsp" class="w3-bar-item w3-button">Manutenzione</a>&ensp;
	
	<a href="viewproductc.jsp" class="w3-bar-item w3-button" >Visualizza Tutti i Prodotti</a>&ensp;
	
	<a href="aboutusc.jsp" class="w3-bar-item w3-button" >Chi Siamo</a>&ensp;
	
	</div>
	<hr>
	
	