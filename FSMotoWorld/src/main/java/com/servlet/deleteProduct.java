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
import com.entity.Product;







@WebServlet("/deleteProduct")
public class deleteProduct extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public deleteProduct() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Recupera l'ID del prodotto da eliminare dalla richiesta
            int pid = Integer.parseInt(request.getParameter("pid"));
            
            // Utilizza il DAO per eliminare il prodotto
            DAO dao = new DAO(DBConnect.getConn());
            Product productToDelete = dao.getProductById(pid);
            
            if (productToDelete != null) {
                boolean success = dao.deleteProduct(productToDelete);
                if (success) {
                    // Operazione di eliminazione riuscita, reindirizza a una pagina di conferma
                    response.sendRedirect("removec.jsp");
                } else {
                    // Gestione errore eliminazione
                    response.sendRedirect("failc.jsp");
                }
            } else {
                // Prodotto non trovato
                response.sendRedirect("failc.jsp");
            }

        } catch (Exception ex) {
            System.out.println(ex);
            response.sendRedirect("failc.jsp"); // Gestione generale dell'errore
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Implementazione del metodo doGet se necessario
    }

}