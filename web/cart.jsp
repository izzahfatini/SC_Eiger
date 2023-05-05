<%-- 
    Document   : cart
    Created on : Jan 21, 2022, 12:17:04 PM
    Author     : EradahAhayatMohamed
--%>

<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%@ page import="model.Cart" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>   

<% 
    if ((User) session.getAttribute("user") == null)
    response.sendRedirect("login.jsp");
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Shopping Cart</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        
        <style>
            body {background-color: #F8F5FF;}
            .cart {
                display: grid;
                grid-template-columns: 1fr 180px 180px 180px 140px;
                grid-template-rows: 1fr;
                width: 1100px;
                background-color: white;
                padding: 30px 30px 30px 50px;
                margin: auto;
                border: 1px solid #E5E4E2;
                border-radius: 0.8em 0.8em 0.8em 0.8em;
                grid-row-gap: 15px;
                text-align:center;
            }
            
            .atas {font-weight: bold; font-size: 18px;}
            
            a, a:hover{
                text-decoration: none;
                color: white;
            }
            
            .msg {
                background-color: #d5ede3;
                padding: 10px;                
                margin: auto;
                grid-column: 1/3;
                width: 500px;
            }
        </style>
    </head>
    <body>
        
        <br>
        <center><h2><b> Cart </b></h2></center>
    
        <br><br>
        
        <div class="cart atas">
            <div> Product </div>
            <div> Unit Price </div>
            <div> Quantity </div>
            <div> Total Price </div>
        </div> <br>
        
        <div class="cart">
            
            <% 
                String msg = request.getParameter("msg"); 
                if("deleted".equals(msg))
                    out.println("<div class='msg'> Product has been removed from cart. </div><div></div><div></div><div></div>"); 
            %>            
            
        <c:forEach items="${requestScope.cartList}" var="cart" varStatus="loop">        
            <div style="text-align:left;"> <img src="images/<c:out value='${cart.image}' />" width="80pixels" height="80pixels" valign="middle"> &emsp;&emsp;&emsp; <c:out value='${cart.name}' /></div>
            <div style="padding-top:30px;"> RM <fmt:formatNumber type = "number" minFractionDigits="2" maxFractionDigits = "2" value = "${cart.price}" />  </div>
            <div style="padding-top:30px;"> <c:out value='${cart.quantity}' /> </div>
            <div style="padding-top:30px;"> RM <fmt:formatNumber type = "number" minFractionDigits="2" maxFractionDigits = "2" value = "${cart.total_price}" /> </div> 
            <div style="padding-top:30px;"> <a href="deleteCartController?id=<c:out value='${cart.id}' />" onClick="return confirm('Are you sure you want to remove this item?')" style='background-color: #7E538D; padding: 12px 18px 12px 18px'> Delete </a> </div>
            <c:set var="totalall" value="${totalall + cart.total_price}" />
        </c:forEach>
        </div> <br>
        
        <div class="cart">
            <div></div><div></div>
            <div> <b style="font-size: 18px;">Total : </b>RM
            <fmt:formatNumber type = "number" minFractionDigits="2" maxFractionDigits = "2" value = "${totalall}" /></div>
            <div style="grid-column: 4/6"> <a href="checkoutController" style="color: white; background-color: #7E538D; padding: 12px 90px 12px 90px; border-radius: 10px"> Check out </a> </div>
        </div>
            <br><br>
    </body>
</html>
