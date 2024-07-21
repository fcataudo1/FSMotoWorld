<%@page import="java.util.List"%>
<%@page import="com.dao.DAO5"%>
<%@page import="com.conn.DBConnect"%>
<%@page import="com.entity.orders"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Visualizzare Ordini</title>
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
            <h1>Visualizzare Ordini per Criteri</h1>
            <br>
        </div>
        <br>

        <!-- Section for searching by customer name -->
        <div>
            <h2> Ordini per Cliente</h2>
            <form method="post" action="vieworders.jsp">
                <input type="text" name="Customer_Name" placeholder="Inserisci Nome Cliente" value="<%= request.getParameter("Customer_Name") != null ? request.getParameter("Customer_Name") : "" %>">
                <input type="submit" value="Cerca Ordini">
            </form>

            <!-- Table for displaying orders by customer name -->
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
                        String Customer_Name = request.getParameter("Customer_Name");
                        if (Customer_Name != null && !Customer_Name.trim().isEmpty()) {
                            DAO5 dao = new DAO5(DBConnect.getConn());
                            List<orders> listv = dao.getOrdersByCustomerName(Customer_Name);
                            if (listv != null && !listv.isEmpty()) {
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
                            } else {
                        %>
                        <tr>
                            <td colspan="7" style="border: 1px solid; text-align: center;">Nessun ordine trovato per il nome cliente inserito.</td>
                        </tr>
                        <%
                            }
                        }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
        <br>

        <!-- Section for searching by date range -->
        <div>
            <h2> Ordini per Intervallo di Date</h2>
            <form method="post" action="vieworders.jsp">
                <label for="startDate">Data Inizio (Formato: yyyy-MM-dd):</label>
                <input type="date" id="startDate" name="startDate" value="<%= request.getParameter("startDate") != null ? request.getParameter("startDate") : "" %>">
                <label for="endDate">Data Fine (Formato: yyyy-MM-dd):</label>
                <input type="date" id="endDate" name="endDate" value="<%= request.getParameter("endDate") != null ? request.getParameter("endDate") : "" %>">
                <input type="submit" value="Cerca Ordini">
            </form>

            <!-- Table for displaying orders by date range -->
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
                            if (listv != null && !listv.isEmpty()) {
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
                            } else {
                        %>
                        <tr>
                            <td colspan="7" style="border: 1px solid; text-align: center;">Nessun ordine trovato per l'intervallo di date selezionato.</td>
                        </tr>
                        <%
                            }
                        }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </center>
    <br>
    <footer>
        <%@ include file="footer.jsp" %>
    </footer>
</body>
</html>