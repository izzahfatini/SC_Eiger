<%-- 
    Document   : admin_doctor
    Created on : Jan 23, 2022, 11:30:50 PM
    Author     : ALYA
--%>

<%@page import="model.User"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="admin_header.jsp" %>
<%@ page import="model.Doctor" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<% 
    if ((User) session.getAttribute("user") == null)
    response.sendRedirect("login.jsp");
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Doctors</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/doctor_info.css">
        <link rel="stylesheet" type="text/css" href="css/sidebar.css">
        
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"  crossorigin="anonymous"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </head>
    <style>
        body{ background-color: #F8F5FF; }
            .item { width: 500px; }
            .btn1 { width: 48%;}
            a, a:hover { text-decoration: none; color: white;}
            
            .content {
                align-items: center;
                justify-content: center;
            }

            .btn2 {
                background-color: white;
                border: 2px solid #7E538D;
                width: 48%;
                height: 35px;
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
            <div style="width:500px"> <h2><b> Our Doctors </b></h2> </div>
            <div style="width:500px"> <button class="btn1" style="width:200px; float: right;"> <a href="admin_doctor_add.jsp">Add Doctor</a> </button></div>
        </div><br><br>
        
        <% 
            String msg = request.getParameter("msg"); 
            if("added".equals(msg))
                out.println("<div class='msg'> New Doctor has been added successfully! </div><br>");
            if("updated".equals(msg))
                out.println("<div class='msg'> New Doctor has been updated successfully! </div><br>");
            if("deleted".equals(msg))
                out.println("<div class='msg'> New Doctor has been deleted successfully! </div><br>");
        %>
        
        <div class="parent">
             
            <%
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/leoClinic?", "root", "");
                Statement st = con.createStatement(); 
                ResultSet rs = st.executeQuery("SELECT * FROM doctor"); 
                while(rs.next()) {
            %>
            
            <div class="elKotak">
                <img src="images/<%=rs.getString(7) %>" width="150px" height="150px"><br>
                <h3 style="color: #7E538D; text-align: center"> <%=rs.getString(1) %> </h3><br>
                <h3> <%=rs.getString(5) %> </h3><br>
                <p> <%=rs.getString(6) %> </p>
                <p> <%=rs.getString(3) %> </p>
            </div> 
                
            <% } %>
   
        </div>
    </body>
</html>
