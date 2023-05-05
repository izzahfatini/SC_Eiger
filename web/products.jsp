<%-- 
    Document   : products
    Created on : Jan 21, 2022, 10:34:03 AM
    Author     : EradahAhayatMohamed
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%@ page import="model.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="model.User"%>

<% 
    if ((User) session.getAttribute("user") == null)
    response.sendRedirect("login.jsp");
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Products</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/products_style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        
        <script type="text/javascript">
            
            function addedtocart() {
                alert("Item added to cart!");
            }
            
        </script>
        
        <style>
            body {background-color: #F8F5FF;}
        </style>
    </head>
    <body>
    <br>
    <center><h2><b> Products </b></h2></center> <br>
        
        <div class="content">
            <c:forEach items="${requestScope.productList}" var="product" varStatus="loop">  
            <div class="item"
                <h5 style="color: #7E538D"><b><c:out value="${product.name}" /></b></h5>
                <center><img src="images/<c:out value="${product.image}" />" width="120px" height="200px"></center>
                <b>Recommended to all skin types </b><br>
                
                <a class="nav-link" href="descriptionProduct.jsp?id=${product.id}" style="color: grey; font-size: 14px">See product description > </a>
                <c:out value="${product.packing}" /> <br> <br>
                <center><b style="font-size: 22px; color: #7E538D">RM <c:out value="${product.price}" /> </b></center> <br>
           
                <form action="addtocartController" method="post" class="item_input" onsubmit="addedtocart()"> 
                        <input type="number" name="qty" value="1" class="quantity">
                        <input type="hidden" name="id" value="${product.id}">
                        <input type="submit" name="add" style="border-radius: 12px" class="btn1" value="Add To Cart">
                </form>
            </div>
            </c:forEach>
            
        </div>
    </body>
</html>
