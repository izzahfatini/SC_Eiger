<%-- 
    Document   : myAppointment
    Created on : Jan 15, 2022, 4:42:37 AM
    Author     : farhah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%@page import="java.sql.*" %>
<%@page import="model.User" %>
<%@page import="model.Appointment" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<% 
    if ((User) session.getAttribute("user") == null)
    response.sendRedirect("login.jsp");
%>

<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>My Appointment</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/astyle.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        
        <style>
            body{
                background-color: #F8F5FF;    
            }

            .user_card{
                height: 600px;
                width: 800px;
                padding: 80px;
                margin-bottom: 20px;
            }

            .kotak{ width:800px;}
            .jarak {padding-bottom: 20px;} 
        </style>
    </head>
    <body>
        <br><br><br>
        <h1 style="text-align: center"> My Appointment </h1><br><br>
        <div class="container h-100">
            
            <c:forEach items="${requestScope.appointmentList}" var="app" varStatus="loop">
                
            <div class="d-flex justify-content-center h-100">
                <div class="user_card">
                    <p><h3><img src="images/calendar.png" width="60px" height="60px">&nbsp;&nbsp;&nbsp; Clinic Appointment</h3></p> <br>
                    <div class="row">
                        <div class="col-md-3 jarak"> <b>Full Name</b> </div>
                        <div class="col-md-9 jarak"> <c:out value="${app.fullname}" /> </div> <hr>
                        <div class="col-md-3 jarak"> <b>Email</b> </div>
                        <div class="col-md-9 jarak"> <c:out value="${app.email}" /> </div> <hr>
                        <div class="col-md-3 jarak"> <b>Phone Number</b> </div>
                        <div class="col-md-9 jarak"> <c:out value="${app.phone}" /> </div> <hr>
                        <div class="col-md-3 jarak"> <b>Date</b> </div>
                        <div class="col-md-9 jarak"> <c:out value="${app.date}" /> </div> <hr>
                        <div class="col-md-3 jarak"> <b>Time</b> </div>
                        <div class="col-md-9 jarak"> <c:out value="${app.time}" /> </div> <hr>
                        <div class="col-md-3 jarak"> <b>Treatment</b> </div>
                        <div class="col-md-9 jarak"> <c:out value="${app.treatment}" /> </div> <hr>
                        <div class="col-md-3 jarak"> <b>Status</b> </div>
                        <div class="col-md-9 jarak"> <c:out value="${app.status}" />  </div>
                    </div>
                </div>
            </div>
                    
            </c:forEach>
        </div>
    </body>
</html>

