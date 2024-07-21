<%@page import="java.util.List"%>
<%@page import="com.entity.Product"%>
<%@page import="com.dao.DAO"%>
<%@page import="com.conn.DBConnect"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Aggiorna Prodotto</title>
    <link rel="stylesheet" href="images/bootstrap.css">
    <link rel="stylesheet" href="Css/w3.css">
    <link rel="stylesheet" href="Css/font.css">
    <link rel="stylesheet" href="Css/abc.css">
    <style>
        .w3-sidebar a {font-family: "Roboto", sans-serif}
        body,h1,h2,h3,h4,h5,h6,.w3-wide {font-family: "Montserrat", sans-serif;}
        .a { margin-right: 225px; }
        .b { margin-right: 190px; }
        .e { margin-right: 205px; }
        .d { margin-right: 215px; }
        .f { margin-right: 265px; }
        .g { margin-right: 195px; }
        .j { margin-left: 17px; }
       
    </style>
</head>
<body>
    <%@ include file="admin_navbar.jsp" %>

    <div style="background-color: #ebe9eb; padding: 20px;">
        <h1 class="j">Aggiornare Prodotto</h1>
    </div>

    <div class="container">
        <div class="form-container">
            <h4>Aggiorna Nome Prodotto</h4>
            <form method="post" action="updateproductname">
                <select name="pid">
                    <% 
                        DAO dao = new DAO(DBConnect.getConn());
                        List<Product> productList = dao.getAllProducts();
                        for (Product product : productList) {
                    %>
                    <option value="<%= product.getPid() %>"><%= product.getPid() %> - <%= product.getPname() %></option>
                    <% } %>
                </select>
                <br><br>
                <label for="pname">Nuovo Nome Prodotto:</label><br>
                <input type="text" id="pname" name="pname" required>
                <br><br>
                <input type="submit" value="Aggiorna Nome">
            </form>
        </div>

        <div class="form-container">
            <h4>Aggiorna Descrizione</h4>
            <form method="post" action="updateproductdescription">
                <select name="pid">
                    <% 
                        for (Product product : productList) {
                    %>
                    <option value="<%= product.getPid() %>"><%= product.getPid() %> - <%= product.getPname() %></option>
                    <% } %>
                </select>
                <br><br>
                <label for="description">Nuova Descrizione:</label><br>
                <textarea id="description" name="description" rows="4" cols="50" required></textarea>
                <br><br>
                <input type="submit" value="Aggiorna Descrizione">
            </form>
        </div>

        <div class="form-container">
            <h4>Aggiorna Prezzo</h4>
            <form method="post" action="updateproductprice">
                <select name="pid">
                    <% 
                        for (Product product : productList) {
                    %>
                    <option value="<%= product.getPid() %>"><%= product.getPid() %> - <%= product.getPname() %></option>
                    <% } %>
                </select>
                <br><br>
                <label for="pprice">Nuovo Prezzo:</label><br>
                <input type="number" id="pprice" name="pprice" required>
                <br><br>
                <input type="submit" value="Aggiorna Prezzo">
            </form>
        </div>

        <div class="form-container">
            <h4>Aggiorna Quantità</h4>
            <form method="post" action="updateproductquantity">
                <select name="pid">
                    <% 
                        for (Product product : productList) {
                    %>
                    <option value="<%= product.getPid() %>"><%= product.getPid() %> - <%= product.getPname() %></option>
                    <% } %>
                </select>
                <br><br>
                <label for="pquantity">Nuova Quantità:</label><br>
                <input type="number" id="pquantity" name="pquantity" required>
                <br><br>
                <input type="submit" value="Aggiorna Quantità">
            </form>
        </div>

        <div class="form-container">
            <h4>Aggiorna URL Immagine</h4>
            <form method="post" action="updateproductimage">
                <select name="pid">
                    <% 
                        for (Product product : productList) {
                    %>
                    <option value="<%= product.getPid() %>"><%= product.getPid() %> - <%= product.getPname() %></option>
                    <% } %>
                </select>
                <br><br>
                <label for="pimage">Nuovo URL Immagine:</label><br>
                <input type="text" id="pimage" name="pimage" required>
                <br><br>
                <input type="submit" value="Aggiorna URL Immagine">
            </form>
        </div>

        <div class="form-container">
            <h4>Aggiorna ID Brand</h4>
            <form method="post" action="updateproductbrandid">
                <select name="pid">
                    <% 
                        for (Product product : productList) {
                    %>
                    <option value="<%= product.getPid() %>"><%= product.getPid() %> - <%= product.getPname() %></option>
                    <% } %>
                </select>
                <br><br>
                <label for="bid">Nuovo ID Brand:</label><br>
                <input type="number" id="bid" name="bid" required>
                <br><br>
                <input type="submit" value="Aggiorna ID Brand">
            </form>
        </div>

        <div class="form-container">
            <h4>Aggiorna ID Categoria</h4>
            <form method="post" action="updateproductcategoryid">
                <select name="pid">
                    <% 
                        for (Product product : productList) {
                    %>
                    <option value="<%= product.getPid() %>"><%= product.getPid() %> - <%= product.getPname() %></option>
                    <% } %>
                </select>
                <br><br>
                <label for="cid">Nuovo ID Categoria:</label><br>
                <input type="number" id="cid" name="cid" required>
                <br><br>
                <input type="submit" value="Aggiorna ID Categoria">
                
                
            </form>
        </div>
    </div>

    <footer>
        <%@ include file="footer.jsp" %>
    </footer>
</body>
</html>