<%-- 
    Document   : admin_appointment_approval
    Created on : Jan 24, 2022, 6:53:02 PM
    Author     : ALYA
--%>

<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="admin_header.jsp" %>
<%@ page import="java.sql.*" %>

<% 
    if ((User) session.getAttribute("user") == null)
    response.sendRedirect("login.jsp");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Doctor List</title>
        <link rel="stylesheet" type="text/css" href="css/doctor_info.css">
        <link rel="stylesheet" type="text/css" href="css/doctor_table.css">
        <link rel="stylesheet" type="text/css" href="css/sidebar.css">
        
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </head>
            <style>
            body{ background-color: #F8F5FF; }
            .btn1 { width: 48%;}
            a, a:hover { text-decoration: none; color: white;}
            
            .content {
                align-items: center;
                justify-content: center;
            }
            
            .msg {
                background-color: #d5ede3;
                padding: 15px;
                width: 400px;
                margin: auto;
            }
        </style>
    <body>
        <div class="content">
            <div style="width:500px"> <h2><b> List of Appointments </b></h2> </div>
        </div><br><br>
        
        <% 
            String msg = request.getParameter("msg"); 
            if("added".equals(msg))
                out.println("<div class='msg'> New Appointment has been added successfully! </div><br>");
            if("updated".equals(msg))
                out.println("<div class='msg'> Appointment has been updated successfully! </div><br>");
            if("deleted".equals(msg))
                out.println("<div class='msg'> Appointment has been deleted successfully! </div><br>");
        %>
        
        
        <div class="content">
            <table class="table table-striped table-hover table-bordered">
                
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Patient Name</th>
                            <th>E-mail</th>
                            <th>Phone No</th>
                            <th>Date</th>
                            <th>Time</th>
                            <th>Treatment</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
            <%
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/leoClinic?", "root", "");
                Statement st = con.createStatement(); 
                ResultSet rs = st.executeQuery("SELECT * FROM appointment WHERE status='Approved' or status='Rejected'"); 
                while(rs.next()) {
            %>
                            <td><%=rs.getString(1) %></td>  
                            <td><%=rs.getString(2) %></td>      
                            <td><%=rs.getString(3) %></td>
                            <td><%=rs.getString(3) %></td>
                            <td><%=rs.getString(4) %></td>
                            <td><%=rs.getString(5) %></td>
                            <td><%=rs.getString(6) %></td>
                            <td><%=rs.getString(8) %></td>
                        </tr>
                    </tbody>   
            <% } %>
        </table> 
        </div>
    </body>
</html>