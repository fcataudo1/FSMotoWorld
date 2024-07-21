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

@WebServlet("/updateproductname")
public class updateproductname extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public updateproductname() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            DAO dao = new DAO(DBConnect.getConn());
            int pid = Integer.parseInt(request.getParameter("pid"));
            String pname = request.getParameter("pname");

            Product p = new Product();
            p.setPid(pid);
            p.setPname(pname);

            int result = dao.updateaproductname(p);
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
