/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import model.Order;
import model.OrderItems;
import model.User;

/**
 *
 * @author izzah
 */
@WebServlet(name = "orderDetailsController", urlPatterns = {"/orderDetailsController"})
public class orderDetailsController extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession(true);
           
            int orderid = Integer.parseInt(request.getParameter("orderid"));
            
            String o_id, o_date, o_total, o_status, o_payment, o_courier, o_trackingno, o_email = null;   // orders 
            String u_fullname, u_email, u_phone, u_address; // user
            String i_id, i_name, i_price, i_totalprice, i_quantity, i_image; //order_items
            
            Order order = new Order();
            
            User user = new User();
            
            OrderItems ord_itm = new OrderItems();
            ArrayList order_items = new ArrayList();
            //DATABASE
            //Get details information of the order from database - Database Connection
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/leoClinic?", "root", "");
                Statement st = con.createStatement(); 
                ResultSet rs = st.executeQuery("SELECT * FROM orders WHERE orderid = '"+orderid+"'");//Get order (Orders) details
                while(rs.next())    { 
                    o_id = String.valueOf(rs.getInt(1));
                    o_date = rs.getString(2);
                    o_total = String.valueOf(rs.getDouble(3));
                    o_status = rs.getString(4);
                    o_payment = rs.getString(5);
                    o_courier = rs.getString(6);
                    o_trackingno = rs.getString(7);
                    o_email = rs.getString(8);
                    //out.println(o_id + " " + o_date + " " + o_total + " " + o_status + " " + o_payment + " " + o_courier + " " + o_trackingno + " " + o_email);
                    order = new Order(o_id, o_date, o_total,o_status,o_payment, o_courier, o_trackingno, o_email);
                }
                ResultSet rs1 = st.executeQuery("SELECT * FROM user WHERE email = '"+o_email+"'");    //Get user (User) details
                while(rs1.next())    {  
                    u_fullname = rs1.getString(1);
                    u_email = rs1.getString(2);
                    u_phone = rs1.getString(3);
                    u_address = rs1.getString(5);
                    user = new User(u_fullname, u_email, u_phone,u_address);
                    //out.println("<br>" + u_fullname + " " + u_email + " " + u_phone + " " + u_address);
                }
                ResultSet rs2 = st.executeQuery("SELECT *  FROM order_items WHERE order_id='"+orderid+"'");    //Get items' (order_items) details
                while(rs2.next())    {  
                    i_id = String.valueOf(rs2.getInt(1));
                    i_name = rs2.getString(4);
                    i_price = String.valueOf(rs2.getDouble(5));
                    i_totalprice = String.valueOf(rs2.getDouble(6));
                    i_quantity = String.valueOf(rs2.getInt(7));
                    i_image = rs2.getString(8);
                    ord_itm = new OrderItems(i_id, i_name, i_price,i_totalprice, i_quantity, i_image);
                    order_items.add(ord_itm);
                    //out.println("<br>" + i_id + " " + i_name + " " + i_price + " " + i_totalprice + " " + i_quantity + " " + i_image);
                }
                
                session.setAttribute("order", order);
                session.setAttribute("user", user);
                session.setAttribute("order_items", order_items);
                
                
                
                RequestDispatcher rd = request.getRequestDispatcher("/orderdetails.jsp");
                rd.include(request, response);
                //sendPage(request, response, "/orderdetails.jsp");
                
                if (null != order.getStatus()) switch (order.getStatus()) {
                case "Pending":
                    pendingButtton(request,response, orderid);
                    break;
                case "Processing":
                    processingButtton(request,response, orderid);
                    break;
                case "Shipped":
                    shippedButtton(request,response, orderid);
                    break;
                case "Complete":
                    break;
                default:
                    break;
                
            }
            /* TODO output your page here. You may use following sample code.
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet orderDetailsController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet orderDetailsController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");*/

        }
        
    }
    
    public void pendingButtton (HttpServletRequest request, HttpServletResponse response, int orderid) throws ServletException, IOException{
        try (PrintWriter out = response.getWriter()) {
            
             ServletContext sc = getServletContext();
            out.println("<center>\n" +
"                <button type=\"button\" style=\"background-color: #888888; border-radius: 4px;width: 1190px; color: white; font-size: 20px;\" onclick=\"location.href='/LeoSkinSpecialist/updateToProcessing?orderid=" + orderid +"'\">Processing Order</button>\n" +
"            </center>");
            out.println("<br><center>\n" +
"                <button type=\"button\" style=\"background-color: #EE3F3F; border-radius: 4px;width: 1190px; color: white; font-size: 20px;\" onclick=\"location.href='/LeoSkinSpecialist/cancelOrder?orderid=" + orderid +"'\">Cancel Order</button>\n" +
"            </center>");
        }
    }
    
    public void processingButtton (HttpServletRequest request, HttpServletResponse response, int orderid) throws ServletException, IOException{
        try (PrintWriter out = response.getWriter()) {
            
            out.println("<center>\n" +
"                <button type=\"button\" style=\"background-color: #E3B104; border-radius: 4px;width: 1190px; color: white; font-size: 20px;\" onclick=\"location.href='/LeoSkinSpecialist/updateToShipped?orderid=" + orderid +"'\">Shipped Order</button>\n" +
"            </center>");
        }
    }
    
    public void shippedButtton (HttpServletRequest request, HttpServletResponse response, int orderid) throws ServletException, IOException{
        try (PrintWriter out = response.getWriter()) {
            
            out.println("<center>\n" +
"                <button type=\"button\" style=\"background-color: #EDEDED; border-radius: 4px;width: 1190px; color: white; font-size: 20px;\" onclick=\"location.href='/LeoSkinSpecialist/orderDetailsController?orderid=" + orderid +"'\">Complete Order</button>\n" +
"            </center>");
        }
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
            Logger.getLogger(orderDetailsController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(orderDetailsController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(orderDetailsController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(orderDetailsController.class.getName()).log(Level.SEVERE, null, ex);
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
