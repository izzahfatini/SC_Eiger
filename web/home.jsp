<%-- 
    Document   : home
    Created on : Jan 20, 2022, 9:39:22 PM
    Author     : farhah
--%>

<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%@page import="model.NullUser"%>
<% User usr = (User) session.getAttribute("user"); %>
<% 
    if ((User) session.getAttribute("user") == null)
    response.sendRedirect("login.jsp");
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Home</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/astyle.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <style>
            body {background-color: #F8F5FF;}
            a {
                text-decoration: none;
                color: white;
            }
        </style>
    </head>
    <body>
        <br>
        <div class="kotak">
            <div class="KotakAtas" style="width:400px">
                <p><h1>Best Skin Specialist in Johor Bahru</h1> <br>
                We are dedicated to deliver the high level of skin and aesthetic treatments you desire, reliably through modern medical technologies
                </p>
            </div>
            <div class="KotakAtas"><img src="images/clinic1.png"></div>
        </div>
        
        <div class="kotak">
            <div class="KotakBawah">
                <p> <img src="images/calendar.png"><br>
                <h2>Book Visit</h2>
                Book a visit to our clinic to check your condition and receive our treatment.<br><br><br>
                <% if (usr.isNull()) { %>
                    <button class="btnAll"><a href="login.jsp">Book Appointment</a></button>
                <% } else { %>
                    <button class="btnAll"><a href="bookAppointment.jsp">Book Appointment</a></button>
                <% } %>
                </p>
            </div>
            <div class="KotakBawah">
                <p> <img src="images/map.png"><br>
                <h2>Our Centre</h2>
                Know where you can meet your Doctor. We’d love to hear from you.<br><br><br>
                <button class="btnAll"><a href="aboutUs.jsp"> About Us </a></button>
                </p>
            </div>
            <div class="KotakBawah">
                <p> <img src="images/prod.png"><br>
                <h2>Our Products</h2>
                Our products are formulated by our own professionals, tailored for your skin.<br><br><br>
                <button class="btnAll"><a href="viewProductsController"> Shop Now </a></button>
                </p>
            </div>
        </div>
    </body>
</html>

