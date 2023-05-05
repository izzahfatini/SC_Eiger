<%-- 
    Document   : admin_products
    Created on : Jan 18, 2022, 12:51:36 PM
    Author     : farhah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@include file="admin_header.jsp" %>
<%@page import="model.User"%>
<%@ page import="model.Product" %>
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
        <title>Products</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/sidebar.css">
        <link rel="stylesheet" type="text/css" href="css/products_style.css">
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        
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
    </head>
    <body>
        <div class="content">
            <div style="width:500px"> <h2><b> Products </b></h2> </div>
            <div style="width:500px"> <button class="btn1" style="width:200px; float: right;"> <a href="admin_addProduct.jsp">Add product</a> </button></div>
        </div><br><br>
        
        <% 
            String msg = request.getParameter("msg"); 
            if("added".equals(msg))
                out.println("<div class='msg'> Product has been added successfully! </div><br>");
            if("updated".equals(msg))
                out.println("<div class='msg'> Product has been updated successfully! </div><br>");
            if("deleted".equals(msg))
                out.println("<div class='msg'> Product has been deleted successfully! </div><br>");
        %>
        
        <div class="content">
            <c:forEach items="${requestScope.productList}" var="product" varStatus="loop">
            
            <div class="item">          
                <h5 style="color: #7E538D"><b> <c:out value="${product.name}" /> </b></h5><br>
                <center><img src="images/<c:out value="${product.image}" />" width="120px" height="200px"></center>
                <b>Recommended to all skin types </b><br>
                <c:out value="${product.packing}" /><br> <br>
                <center><b style="font-size: 22px; color: #7E538D""> MYR <c:out value="${product.price}" /> </b></center> <br>
                
                <button class="btn1"> <a href="admin_editProduct.jsp?id=<c:out value="${product.id}" />"> Delete product </a> </button>
                <button class="btn2"> <a href="deleteProductController?id=<c:out value="${product.id}" />" style="color:#7E538D" onclick="return confirm('Are you sure you want to delete the product?')"> Edit product</a> </button>
           
<!--                <button class="btn1"> <a href="admin_editProduct.jsp?id=<c:out value="${product.id}" />"> Edit product</a> </button>
                <button class="btn2"> <a href="deleteProductController?id=<c:out value="${product.id}" />" style="color:#7E538D" onclick="return confirm('Are you sure you want to delete the product?')"> Delete product</a> </button>-->
            </div> 
                
            </c:forEach>
        </div>
    </body>
</html>

