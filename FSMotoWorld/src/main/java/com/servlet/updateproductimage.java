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

@WebServlet("/updateproductimage")
public class updateproductimage extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public updateproductimage() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            DAO dao = new DAO(DBConnect.getConn());
            int pid = Integer.parseInt(request.getParameter("pid"));
            String pimage = request.getParameter("pimage");

            
            System.out.println("PID: " + pid);
            System.out.println("Image URL: " + pimage);

            Product p = new Product();
            p.setPid(pid);
            p.setPimage(pimage);

            int result = dao.updateaproductimage(p);
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
