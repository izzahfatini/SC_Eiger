/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.Order;
import model.User;
import model.OrderItems;

/**
 *
 * @author EradahAhayatMohamed
 */
public class orderController extends HttpServlet {

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
        
        HttpSession session = request.getSession(true);
        User user = (User) session.getAttribute("user");
        int order_id = 0;
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/leoClinic?", "root", "");
        Statement st = con.createStatement(); 
        ResultSet rs = st.executeQuery("SELECT * FROM orders WHERE usermail_order = '"+user.getEmail()+"'"); 
        Order order = new Order();
        
        while(rs.next()) {
            order.setId(rs.getString(1));
            order.setDate(rs.getString(2));
            order.setTotal(rs.getString(3));
            order.setStatus(rs.getString(4));
            order.setPayment(rs.getString(5));
            order.setCourier(rs.getString(6));
            order.setTrackingno(rs.getString(7));
            order_id = rs.getInt(1);
        }       
        st.close(); 
        
        Statement st2 = con.createStatement(); 
        ResultSet rs2 = st2.executeQuery("SELECT * FROM order_items WHERE order_id = '"+order_id+"'"); 
        ArrayList orderItemsList = new ArrayList();
        
        while(rs2.next()) {
            OrderItems orderItems = new OrderItems();
            orderItems.setItem_id(rs2.getString(3));
            orderItems.setName(rs2.getString(4));
            orderItems.setPrice(rs2.getString(5));
            orderItems.setTotal_price(rs2.getString(6));
            orderItems.setQuantity(rs2.getString(7));
            orderItems.setImage(rs2.getString(8));
            orderItemsList.add(orderItems);
        }       
        st2.close();
        
        request.setAttribute("order", order);
        request.setAttribute("orderItemsList", orderItemsList);
        
        con.close();
        sendPage(request, response, "/myOrder.jsp");
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
            Logger.getLogger(orderController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(orderController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(orderController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(orderController.class.getName()).log(Level.SEVERE, null, ex);
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

    void sendPage(HttpServletRequest req, HttpServletResponse res, String fileName) throws ServletException, IOException
    {
        // Get the dispatcher; it gets the main page to the user
	RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(fileName);

	if (dispatcher == null)
	{
            System.out.println("There was no dispatcher");
	    // No dispatcher means the html file could not be found.
	    res.sendError(res.SC_NO_CONTENT);
	}
	else
	    dispatcher.forward(req, res);
    } 

}
