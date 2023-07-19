<%-- 
    Document   : placeorder
    Created on : Jan 21, 2022, 2:52:48 PM
    Author     : EradahAhayatMohamed
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%@page import="model.User"%>

<% 
    if ((User) session.getAttribute("user") == null)
    response.sendRedirect("login.jsp");
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Order Placed</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        
        <style>
            body {background-color: #F8F5FF;}
            .base {
                width: 600px;
                background-color: white;
                padding: 20px 0 20px 0;
                margin: auto;
                border: 1px solid #E5E4E2;
                border-radius: 0.8em 0.8em 0.8em 0.8em;
                line-height: 2.0;
                text-align: center;
            }
            
            .atas {
                border-bottom: none; 
                border-radius: 0.8em 0.8em 0 0; 
                background-image:url(images/back.jpg);
            }
            
            .bawah {border-radius: 0 0 0.8em 0.8em;}
            
        </style>
        

    </head>
    <body>
        
        <br><br><br><br>
        
        <div class="base atas"> 
            <b> Thank you ! <br> Your order has been received. <br></b>
        </div>
        
        <div class="base bawah">
            Your items has been placed and is on it's way to being processed. <br><br>
            
            <a href="orderController" style="color: white; background-color: #7E538D; padding: 12px 60px 12px 60px; border-radius: 10px"> View my order </a>
        </div>
    
        
        
    </body>
</html>
