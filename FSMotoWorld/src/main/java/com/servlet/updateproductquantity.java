package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.conn.DBConnect;
import com.dao.DAO;
import com.entity.Product;

@WebServlet("/updateproductquantity")
public class updateproductquantity extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public updateproductquantity() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            DAO dao = new DAO(DBConnect.getConn());
            int pid = Integer.parseInt(request.getParameter("pid"));
            int pquantity = Integer.parseInt(request.getParameter("pquantity"));

            Product p = new Product();
            p.setPid(pid);
            p.setPquantity(pquantity);

            int result = dao.updateproductquantity(p); // Method name should be updated to `updateaproductquantity` to avoid confusion
            if (result > 0) {
                response.sendRedirect("updatec.jsp");
            } else {
                response.sendRedirect("failc.jsp");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            response.sendRedirect("failc.jsp");
        }
    }
}
