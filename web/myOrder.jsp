<%-- 
    Document   : myOrder
    Created on : Jan 21, 2022, 3:09:55 PM
    Author     : EradahAhayatMohamed
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="model.User" %>
<%@page import="model.Order" %>
<%@page import="model.OrderItems" %>

<% 
    if ((User) session.getAttribute("user") == null)
    response.sendRedirect("login.jsp");
%>

<!DOCTYPE html>
<html>
    <head>
        <title>My Order</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        
        <style>
            body {background-color: #F8F5FF;}
            .cart {
                display: grid;
                grid-template-columns: 1fr 150px 150px 150px;
                grid-template-rows: 1fr;
                grid-row-gap: 15px;
                width: 850px;
            }
            
            .base {
                background-color: white;
                padding: 20px 0px 20px 50px;
                margin: auto;
                border: 1px solid #E5E4E2;
                border-radius: 0.8em 0.8em 0.8em 0.8em;
                line-height: 2.0;
            }
            
            .atas {border-bottom: none; border-radius: 0.8em 0.8em 0 0; font-size: 18px; font-weight: bold;}
            .tengah{border-bottom: none; border-radius: 0 0 0 0; font-size: 18px; font-weight: bold;}
            .bawah {border-radius: 0 0 0.8em 0.8em}
            
            
        </style>
    </head>
    <body>
        
        
        <br>
        <center><h2><b> My Order </b></h2></center>
    
        <br><br>
        
        <div class="base cart atas">
            <div> <img src="images/order.png" width="40px" height="40px"> </div>
            <div> Order Details </div>
        </div>
        
        <jsp:useBean id="user" scope="session" class="model.User" />
        <jsp:useBean id="order" scope="request" class="model.Order" />
        <div class="base tengah" style="width: 850px">
            <pre style="font-size: 15px">
Name                : <jsp:getProperty name="user" property="fullname"/>
Delivery Address    : <jsp:getProperty name="user" property="address"/>
Contact Number      : <jsp:getProperty name="user" property="phone"/>
Total Payment       : RM <jsp:getProperty name="order" property="total"/>
Status              : <jsp:getProperty name="order" property="status"/> 
Payment Method      : <jsp:getProperty name="order" property="payment"/>
Courier             : <jsp:getProperty name="order" property="courier"/>
Tracking Number     : <jsp:getProperty name="order" property="trackingno"/>

            </pre>
        </div>
        
        <div class="base cart tengah">
            <div> Product Ordered </div>
            <div> Unit Price </div>
            <div> Quantity </div>
            <div> Item subtotal </div>
        </div>
        
        <div class="base cart" style="border-bottom: none; border-radius: 0 0 0 0">
        <c:forEach items="${requestScope.orderItemsList}" var="orderitem" varStatus="loop">        
            <div style="text-align:left;"> <img src="images/<c:out value='${orderitem.image}' />" width="80pixels" height="80pixels" valign="middle"> &emsp;&emsp;&emsp; <c:out value='${orderitem.name}' /></div>
            <div style="padding-top:30px;"> RM <c:out value='${orderitem.price}' />  </div>
            <div style="padding-top:30px;"> <c:out value='${orderitem.quantity}' /> </div>
            <div style="padding-top:30px;"> RM <c:out value='${orderitem.total_price}' /> </div> 
        </c:forEach>
        </div> 
        
        <br><br><br><br><br>
    
        
        
    </body>
</html>
