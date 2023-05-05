/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
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
import model.User;

/**
 *
 * @author acer
 */
public class checkout2Controller extends HttpServlet {

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
        
        double totalAll = Double.parseDouble(request.getParameter("totalAll"));
        String order_date = request.getParameter("purchasedate"); 
        String payment = request.getParameter("pay"); 
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/leoClinic?", "root", "");
        
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("select Max(orderid) from orders");
        rs.next();
            int newid = rs.getInt("Max(orderid)");
        st.close();
        newid++;
        
        String query = "INSERT INTO orders(orderid, order_date, total, order_status, payment, courier, trackingno, usermail_order) VALUES(?,?,?,?,?,?,?,?)";
        PreparedStatement st2 = con.prepareStatement(query);
        
        st2.setInt(1, newid);
        st2.setString(2, order_date);
        st2.setDouble(3, totalAll);
        st2.setString(4, "Pending");
        st2.setString(5, payment);
        st2.setString(6, "-");
        st2.setString(7, "-");
        st2.setString(8, user.getEmail());
        st2.executeUpdate();
        st2.close(); 
        
        ArrayList cartList = new ArrayList();
        Statement st3 = con.createStatement(); 
        ResultSet rs3 = st3.executeQuery("SELECT * FROM cart WHERE usermail_cart = '"+user.getEmail()+"'"); 
        
        while(rs3.next()) {
            Cart cart = new Cart();
            cart.setId(rs3.getInt(2));
            cart.setName(rs3.getString(3));
            cart.setPrice(rs3.getDouble(4));
            cart.setTotal_price(rs3.getDouble(5));
            cart.setQuantity(rs3.getInt(6));
            cart.setImage(rs3.getString(7));
            cartList.add(cart);
        }
        
        st3.close();
        PreparedStatement st4 = null;
        
        for(int i=0 ; i<cartList.size(); i++)
        {
            Cart cart = (Cart)cartList.get(i);
            st4 = con.prepareStatement("INSERT INTO order_items(order_id, item_id, name, price, total_price, quantity, image) VALUES(?,?,?,?,?,?,?)");
          
            st4.setInt(1, newid);
            st4.setInt(2, cart.getId());
            st4.setString(3, cart.getName());
            st4.setDouble(4, cart.getPrice());
            st4.setDouble(5, cart.getTotal_price());
            st4.setInt(6, cart.getQuantity());
            st4.setString(7, cart.getImage());
            st4.executeUpdate();        
        }
        st4.close();
        
        PreparedStatement st5 = con.prepareStatement("DELETE FROM cart WHERE usermail_cart = ?");        
        st5.setString(1, user.getEmail());
        st5.executeUpdate();         
        st5.close();
        
        con.close();

        sendPage(request, response, "/placeorder.jsp");
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
            Logger.getLogger(checkout2Controller.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(checkout2Controller.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(checkout2Controller.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(checkout2Controller.class.getName()).log(Level.SEVERE, null, ex);
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
