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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author farhah
 */
public class loginController extends HttpServlet {

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
        String email = request.getParameter("email"); 
        String password = request.getParameter("password"); 
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/leoClinic?", "root", "");
        
        if(isAdmin(email, password))
        {
            Statement st = con.createStatement(); 
            ResultSet rs = st.executeQuery("SELECT * FROM user where email='"+email+"' and password='"+password+"'");
            while(rs.next())
            {
                User user = new User(); 
                user.setFullname(rs.getString(1)); 
                user.setEmail(email); 
                user.setPhone(rs.getString(3));
                user.setPassword(password); 
                if(rs.getString(5) != null)
                    user.setAddress(rs.getString(5));
                session.setAttribute("user", user);
                RequestDispatcher rd = request.getRequestDispatcher("/admin_doctor.jsp");
                rd.forward(request,response);
            }
            st.close();
        }
        else
        {
            int z=0;
            Statement st = con.createStatement(); 
            ResultSet rs = st.executeQuery("SELECT * FROM user where email='"+email+"' and password='"+password+"'");
            while(rs.next())
            {
                z=1;
                User user = new User(); 
                user.setFullname(rs.getString(1)); 
                user.setEmail(email); 
                user.setPhone(rs.getString(3));
                user.setPassword(password);
                if(rs.getString(5) != null)
                    user.setAddress(rs.getString(5));
                session.setAttribute("user", user);
                
                RequestDispatcher rd = request.getRequestDispatcher("/home.jsp");
                rd.forward(request,response);
            }
            st.close();
            if(z==0)
            {
                response.sendRedirect("login.jsp?msg=notexist");
            }
        }
        con.close();
    }

    public boolean isAdmin(String e, String p)  {
        if(e.equals("admin@gmail.com") && p.equals("admin")) {
            return true;
        }
        return false;
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
            Logger.getLogger(loginController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(loginController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(loginController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(loginController.class.getName()).log(Level.SEVERE, null, ex);
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
