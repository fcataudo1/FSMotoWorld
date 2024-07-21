<%@page import="java.util.List"%>
<%@page import="com.dao.DAO5"%>
<%@page import="com.conn.DBConnect"%>
<%@page import="com.entity.orders"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Visualizzare Ordini per Intervallo di Date</title>
    <link rel="stylesheet" href="images/bootstrap.css">
    <link rel="stylesheet" href="Css/w3.css">
    <link rel="stylesheet" href="Css/font.css">
    <style>
        .w3-sidebar a {font-family: "Roboto", sans-serif}
        body,h1,h2,h3,h4,h5,h6,.w3-wide {font-family: "Montserrat", sans-serif;}
    </style>
</head>
<body>
    <%@ include file="admin_navbar.jsp" %>
    <center>
        <div style="background-color: #ebe9eb">    
            <br>
            <h1>Visualizzare Ordini per Intervallo di Date</h1>
            <br>
        </div>
        <br>
        <form method="post" action="viewordersd.jsp">
            <label for="startDate">Data Inizio (Formato: yyyy-MM-dd):</label>
            <input type="date" id="startDate" name="startDate" value="<%= request.getParameter("startDate") != null ? request.getParameter("startDate") : "" %>">
            <label for="endDate">Data Fine (Formato: yyyy-MM-dd):</label>
            <input type="date" id="endDate" name="endDate" value="<%= request.getParameter("endDate") != null ? request.getParameter("endDate") : "" %>">
            <input type="submit" value="Cerca Ordini">
        </form>
        <br>
        <div style="background-color: #ebe9eb; padding: 10px;">
            <table style="border-collapse: collapse; width: 100%;">
                <thead>
                    <tr>
                        <th style="border: 1px solid; text-align: center;">Order Id</th>
                        <th style="border: 1px solid; text-align: center;">Customer Name</th>
                        <th style="border: 1px solid; text-align: center;">Customer City</th>
                        <th style="border: 1px solid; text-align: center;">Date</th>
                        <th style="border: 1px solid; text-align: center;">Total Price</th>
                        <th style="border: 1px solid; text-align: center;">Status</th>
                        <th style="border: 1px solid; text-align: center;">Remove</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    String startDate = request.getParameter("startDate");
                    String endDate = request.getParameter("endDate");

                    if (startDate != null && endDate != null && !startDate.trim().isEmpty() && !endDate.trim().isEmpty()) {
                        DAO5 dao = new DAO5(DBConnect.getConn());
                        List<orders> listv = dao.getOrdersByDateRange(startDate, endDate);

                        if (listv.isEmpty()) {
                    %>
                    <tr>
                        <td colspan="7" style="border: 1px solid; text-align: center;">Nessun ordine trovato per l'intervallo di date selezionato.</td>
                    </tr>
                    <%
                        } else {
                            for (orders v : listv) {
                    %>
                    <tr>
                        <td style="border: 1px solid; text-align: center;"><%= v.getOrder_Id() %></td>
                        <td style="border: 1px solid; text-align: center;"><%= v.getCustomer_Name() %></td>
                        <td style="border: 1px solid; text-align: center;"><%= v.getCustomer_City() %></td>
                        <td style="border: 1px solid; text-align: center;"><%= v.getDate() %></td>
                        <td style="border: 1px solid; text-align: center;"><%= v.getTotal_Price() %>€</td>
                        <td style="border: 1px solid; text-align: center;"><%= v.getStatus() %></td>
                        <td style="border: 1px solid; text-align: center;"><a href="remove_orders?id=<%= v.getOrder_Id() %>"><img src="images/delete.jpg" alt="Remove" height="25px"></a></td>
                    </tr>
                    <%
                            }
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="7" style="border: 1px solid; text-align: center;">Inserisci un intervallo di date per cercare gli ordini.</td>
                    </tr>
                    <%
                    }
                    %>
                </tbody>
            </table>
        </div>
    </center>
    <br>
    <footer>
        <%@ include file="footer.jsp" %>
    </footer>
</body>
</html>
              