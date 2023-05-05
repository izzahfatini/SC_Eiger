/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import model.Order;
import java.util.Date;

/**
 *
 * @author izzah
 */
@WebServlet(name = "orderController_admin", urlPatterns = {"/orderController_admin"})
public class orderController_admin extends HttpServlet {

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
        
        try (PrintWriter out = response.getWriter()) { //
                
        HttpSession session = request.getSession(true);
        User user = (User) session.getAttribute("user");

        ArrayList ords = new ArrayList(); //Temp variables
        String o_id, o_date, o_total, o_payment, o_status, o_email;
        
        //Variable for list of sorted order & total (default - TODAY)
        ArrayList ords_all = new ArrayList();
        ArrayList ords_pending = new ArrayList();
        ArrayList ords_processing = new ArrayList();
        ArrayList ords_shipped = new ArrayList();
        ArrayList ords_complete = new ArrayList();
        ArrayList ords_cancel = new ArrayList();
        float total_all = 0;
        float total_pending = 0;
        float total_processing = 0;
        float total_shipped = 0;
        float total_complete = 0;
        float total_cancel = 0;
        int i_all = 0;
        int i_pending = 0;
        int i_processing = 0;
        int i_shipped = 0;
        int i_complete = 0;
        int i_cancel = 0;
        
        //Get current Date
        Date currentDate = new Date();  
        SimpleDateFormat formatter = new SimpleDateFormat ("yyyy/MM/dd");
        String dateString = formatter.format(currentDate);
        String monthString = dateString.substring(5,7);
        
        String sort = request.getParameter("sort");
        if (sort == null) {
            sort="today";
        }
                
        //DATABASE
        //Get list of sorted order from database - Database Connection
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/leoClinic?", "root", "");
        Statement st = con.createStatement(); 
        // Sort - TODAY, Status - All
        ResultSet rs = st.executeQuery("SELECT * FROM orders");
        while(rs.next())    {
            Order ord;
                    
            o_id = rs.getString("orderid");
            o_date = rs.getString("order_date");
            o_total = rs.getString("total");
            o_status = rs.getString("order_status");
            o_payment = rs.getString("payment");
            o_email = rs.getString("usermail_order");
            ord = new Order(o_id, o_date, o_total,o_status,o_payment, o_email);
            ords.add(ord);
        }
            switch (sort) {
                case "today":
                    {
                        Order o = new Order();
                        String date, status;
                        float total;
                        for(int i=0;i<ords.size();i++){ 
                            o = (Order) ords.get(i);
                            date = o.getDate();
                            status = o.getStatus();
                            
                            if (date.equals(dateString))   {
                                ords_all.add(o);
                                i_all++;
                                
                                if (null != status)   switch (status) {
                                    
                                    case "Pending":{
                                        i_pending++;
                                        ords_pending.add(o);
                                        
                                        total = o.totalToFloat();
                                        total_pending += total;
                                        total_all += total;
                                        break;
                                    }
                                    case "Processing":{
                                        i_processing++;
                                        ords_processing.add(o);
                                        
                                        total = o.totalToFloat();
                                        total_processing += total;
                                        total_all += total;
                                        break;
                                    }
                                    case "Shipped":{
                                        i_shipped++;
                                        ords_shipped.add(o);
                                        
                                        total = o.totalToFloat();
                                        total_shipped += total;
                                        total_all += total;
                                        break;
                                    }
                                    case "Complete":{
                                        i_complete++;
                                        ords_complete.add(o);
                                        
                                        total = o.totalToFloat();
                                        total_complete += total;
                                        total_all += total;
                                        break;
                                    }
                                    case "Cancel":{
                                        i_cancel++;
                                        ords_cancel.add(o);
                                        
                                        total = o.totalToFloat();
                                        total_cancel += total;
                                        total_all += total;
                                        break;
                                    }
                                    default:
                                        break;
                                }
                            }
                        }               break;
                    }
                case "month":
                    {
                        Order o = new Order();
                        String date, date_month, status;
                        float total;
                        for(int i=0;i<ords.size();i++){ 
                            o = (Order) ords.get(i); 
                            date = o.getDate();
                            date_month = date.substring(5,7);
                            
                            status = o.getStatus();
                            
                            if (date_month.equals(monthString))   {
                                ords_all.add(o);
                                i_all++;
                                
                                if (null != status)   switch (status) {
                                    
                                    case "Pending":{
                                        i_pending++;
                                        ords_pending.add(o);
                                        
                                        total = o.totalToFloat();
                                        total_pending += total;
                                        total_all += total;
                                        break;
                                    }
                                    case "Processing":{
                                        i_processing++;
                                        ords_processing.add(o);
                                        
                                        total = o.totalToFloat();
                                        total_processing += total;
                                        total_all += total;
                                        break;
                                    }
                                    case "Shipped":{
                                        i_shipped++;
                                        ords_shipped.add(o);
                                        
                                        total = o.totalToFloat();
                                        total_shipped += total;
                                        total_all += total;
                                        break;
                                    }
                                    case "Complete":{
                                        i_complete++;
                                        ords_complete.add(o);
                                        
                                        total = o.totalToFloat();
                                        total_complete += total;
                                        total_all += total;
                                        break;
                                    }
                                    case "Cancel":{
                                        i_cancel++;
                                        ords_cancel.add(o);
                                        
                                        total = o.totalToFloat();
                                        total_cancel += total;
                                        total_all += total;
                                        break;
                                    }
                                    default:
                                        break;
                                }
                            }
                        }               break;
                    }
                case "all":
                    {
                        Order o = new Order();
                        String status;
                        float total;
                        for(int i=0;i<ords.size();i++){  
                            o = (Order) ords.get(i); 
                            status = o.getStatus();
                            ords_all.add(o);
                            i_all++;
                            
                            if (null != status)   switch (status) {
                                
                                case "Pending":{
                                    i_pending++;
                                    ords_pending.add(o);
                                    
                                    total = o.totalToFloat();
                                    total_pending += total;
                                    total_all += total;
                                    break;
                                }
                                case "Processing":{
                                    i_processing++;
                                    ords_processing.add(o);
                                    
                                    total = o.totalToFloat();
                                    total_processing += total;
                                    total_all += total;
                                    break;
                                }
                                case "Shipped":{
                                    i_shipped++;
                                    ords_shipped.add(o);
                                    
                                    total = o.totalToFloat();
                                    total_shipped += total;
                                    total_all += total;
                                    break;
                                }
                                case "Complete":{
                                    i_complete++;
                                    ords_complete.add(o);
                                    
                                    total = o.totalToFloat();
                                    total_complete += total;
                                    total_all += total;
                                    break;
                                }
                                case "Cancel":{
                                    i_cancel++;
                                    ords_cancel.add(o);
                                    
                                    total = o.totalToFloat();
                                    total_cancel += total;
                                    total_all += total;
                                    break;
                                }
                                default:
                                    break;
                            }
                        }               break;
                    }
                default:
                    break;
            }
        
        // Set as session attributes 
        session.setAttribute("sort", sort);
        session.setAttribute("dateString", dateString);
        
        session.setAttribute("ords_all", ords_all);
        session.setAttribute("total_all", String.valueOf(total_all));
        session.setAttribute("i_all", String.valueOf(i_all));
        
        session.setAttribute("ords_pending", ords_pending);
        session.setAttribute("total_pending", String.valueOf(total_pending));
        session.setAttribute("i_pending", String.valueOf(i_pending));
        
        session.setAttribute("ords_processing", ords_processing);
        session.setAttribute("total_processing", String.valueOf(total_processing));
        session.setAttribute("i_processing", String.valueOf(i_processing));
        
        session.setAttribute("ords_shipped", ords_shipped);
        session.setAttribute("total_shipped", String.valueOf(total_shipped));
        session.setAttribute("i_shipped", String.valueOf(i_shipped));
        
        session.setAttribute("ords_complete", ords_complete);
        session.setAttribute("total_complete", String.valueOf(total_complete));
        session.setAttribute("i_complete", String.valueOf(i_complete));
        
        session.setAttribute("ords_cancel", ords_cancel);
        session.setAttribute("total_cancel", String.valueOf(total_cancel));
        session.setAttribute("i_cancel", String.valueOf(i_cancel));
        
        RequestDispatcher rd = request.getRequestDispatcher("/order.jsp");
        rd.include(request,response);
        
        }
        /*
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. 
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet orderController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet orderController at " + request.getContextPath() + "</h1>");
            out.println(all);
            
            out.println("</body>");
            out.println("</html>");
        }*/
   
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
            Logger.getLogger(orderController_admin.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(orderController_admin.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(orderController_admin.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(orderController_admin.class.getName()).log(Level.SEVERE, null, ex);
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
