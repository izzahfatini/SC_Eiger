<%-- 
    Document   : orderdetails
    Created on : Jan 27, 2022, 1:14:37 AM
    Author     : izzah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="admin_header.jsp" %>
<%@page import="model.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.User"%>
<%@page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Home</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/sidebar.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <style>
            .box    {
                display: flex;
                background-color: white;
                width: 1200px;
                padding: 20px;
                margin: 1px 50px 0px 70px;
                font-size: 20px;
                border: 1px solid lightgrey;
                text-align: left;
            }
            
            .element {
                width: 1000px;
            }
        </style>
    </head>
    <body>
            <%
                Order order_details = (Order) session.getAttribute("order");
                User user_details = (User) session.getAttribute("user");
                
                ArrayList order_items = (ArrayList) session.getAttribute("order_items");
                //pageContext.setAttribute("order_items", order_items);
            %>
        <div style="background-color: #F8F5FF">
            <center><h2><b> Order Details </b></h2></center>
            <center>
                <div class="box">
                    <img src="images/od.png" style="width:21px;height:21px;"> <h5>&nbsp; Order Details </h5> 
                </div>
                <div class="box">
<pre>
Username        : <%= user_details.getFullname() %>
Email           : <%= user_details.getEmail() %> 
Phone Number    : <%= user_details.getPhone() %>
Order ID        : #<%= order_details.getId() %> 
Date            : <%= order_details.getDate() %>
Total Price     : RM <%= order_details.getTotal() %>
Status          : <%= order_details.getStatus() %>
Courier Service : <%= order_details.getCourier() %> 
Tracking No     : <%= order_details.getTrackingno() %> 
</pre>
                </div>
            </center>
            <br>
            <center>
                <div class="box">
                    <img src="images/product.png" style="width:21px;height:21px;"> <h5>&nbsp; Product </h5> 
                </div>
                <div class="box">
                    <c:forEach items="${order_items}" var="order">
                        <c:set var="pro_image" value="${order.image}"  />
                        <%
                            String imagelink = "images/" + (String)pageContext.getAttribute("pro_image"); 
                        %>  

                        <img src="<%= imagelink %>" style="width:78px;height:159px;"> 
                        <div style="font-size: 30px; color: #76197E; background-color: white;">
                            <b> <c:out value="${order.name}" /> </b> x<c:out value="${order.quantity}" />
                        </div>
                        <br>
                        <br>
                        MYR <c:out value="${order.price}" />
                        <br><br>
                    </c:forEach>
                        <br>
                </div >
            </center>
            <center>
                <div class="box"><pre>
Merchandise Subtotal        : RM <%= order_details.getTotal() %> <br>
Shipping Fee                : RM 8 <br>
Shipping Discount Subtotal  : RM 0 <br>
Order Total                 : RM <%= (order_details.totalToFloat() + 8) %> 
                        </pre></div>
            </center>
            <center>
                <div class="box" >
                    <b>Payment Method</b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <%= order_details.getPayment() %>
                </div>
            </center>
            
            
            <br>
            <!--
            <center>
                <button type="button" style="background-color: #888888; border-radius: 4px;width: 1190px; color: white; font-size: 20px;">Processing Order</button>
            </center>
            <br>
            <center>
                <button type="button" style="background-color: #EE3F3F; border-radius: 4px;width: 1190px; color: white; font-size: 20px;">Cancel Order</button>
            </center>
            <br><br>
            -->
        </div>
    </body>
</html>
