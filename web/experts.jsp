<%-- 
    Document   : experts
    Created on : Jan 18, 2022, 12:54:38 PM
    Author     : farhah
--%>

<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
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
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/astyle.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <style>
            body{ background-color: #F8F5FF; }
            
            .parent {
                display: flex;
                align-items: center;
                justify-content: center;
                flex-wrap: wrap;
            }
            
            .elKotak{
                width: 420px;
                height: 450px;
                background-color: white;
                border: 1px solid #E5E5E5;
                border-radius: 10px;
                padding: 40px;
                margin: 0 70px 60px 70px;
            }
            
            .kotak{ margin: auto;}
            
            img {
              display: block;
              margin-left: auto;
              margin-right: auto;
            }
            
        </style>
    </head>
    <body>
        <br><br><br>
        <div><h1 style="text-align: center"> Meet the Experts </h1></div><br><br>
        <div class="parent">
            
            <c:forEach items="${requestScope.doctorList}" var="doctor" varStatus="loop">   
            <div class="elKotak">
                
                <img src="images/<c:out value="${doctor.image}" />" width="150px" height="150px"><br>
                <h3 style="color: #7E538D; text-align: center"> <c:out value="${doctor.name}" /> </h3><br>
                <h3> <c:out value="${doctor.specialties}" /> </h3><br>
                <p> <c:out value="${doctor.qualification}" /> </p>
                <p> <c:out value="${doctor.email}" /> </p>
                
            </div>
            </c:forEach>
            
        </div>
    </body>
</html>

