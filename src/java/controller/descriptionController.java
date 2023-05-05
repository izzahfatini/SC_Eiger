/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author EradahAhayatMohamed
 */
public class descriptionController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        
        int item_id = Integer.parseInt(request.getParameter("id"));
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/leoClinic?", "root", ""); 
        Statement st = con.createStatement(); 
        ResultSet rs = st.executeQuery("SELECT * FROM product (id, name, price, quantity, description, instruction, packing, image) where id=item_id");
        
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<%@include file=\"header.jsp\" %>");
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Leo Vitamin Glow Serum</title>\n" +
                        "        <meta charset=\"UTF-8\">\n" +
                        "        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n" +
                        "        <link rel=\"stylesheet\" type=\"text/css\" href=\"css/style.css\">\n" +
                        "        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3\" crossorigin=\"anonymous\">\n" +
                        "        \n" +
                        "        <style>\n" +
                        "            body {background-color: #F8F5FF;}\n" +
                        "            .content {\n" +
                        "                height: auto;\n" +
                        "                padding-left: 30px;\n" +
                        "                padding-right: 30px;\n" +
                        "                background-color: white;\n" +
                        "                width: 80%;\n" +
                        "                border-radius: 15px;\n" +
                        "            }\n" +
                        "        </style>");            
            out.println("</head>");
            out.println("<body>");
            out.println("\n" +
                        "        <br>\n" +
                        "    <center><h2><b> " + rs.getString(2) + " </b></h2></center> <br>\n" +
                        "    <center>\n" +
                        "        <div class=\"content\">\n" +
                        "            \n" +
                        "            <br><br>\n" +
                        "            <img src=\"images/" + rs.getString(8) + "\" width=\"180px\" height=\"260px\"><br><br><br>\n" +
                        "            <img src=\"images/product.png\" width=\"30px\" height=\"30px\">\n" +
                        "            <b>Description </b><br><br>\n" +
                        "            <div>\n" + rs.getString(5) +
                        "            </div> <br><br>\n" +
                        "            \n" +
                        "            <img src=\"images/product.png\" width=\"30px\" height=\"30px\">\n" +
                        "            <b>Instruction </b><br><br>\n" +
                        "            <div>\n" + rs.getString(6) +
                        "            </div> <br><br><br>\n" +
                        "            \n" +
                        "        </div>\n" +
                        "    </center>");
            out.println("</body>");
            out.println("</html>");
        }
        
        st.close();
        con.close();
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(descriptionController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(descriptionController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(descriptionController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(descriptionController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
