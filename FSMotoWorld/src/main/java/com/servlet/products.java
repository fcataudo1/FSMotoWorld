package com.servlet;

import java.io.IOException;
import java.nio.file.Path;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.conn.DBConnect;
import com.dao.DAO;
import com.dao.DAO;





@WebServlet("/Products")
public class ProductsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String query = request.getParameter("q");
        DAO dao = new DAO(DBConnect.getConn()); // Assumi che DAO sia la tua classe di accesso ai dati
        List<Product> productList = dao.searchProducts(query); // Implementa searchProducts in DAO
        
        for (Product product : productList) {
            out.println("<div>" +
                "<img src='images/" + product.getPimage() + "' height='100px'/>" +
                "<p>Nome: " + product.getPname() + "</p>" +
                "<p>Prezzo: " + product.getPprice() + "€</p>" +
                "</div>");
        }
    }
}