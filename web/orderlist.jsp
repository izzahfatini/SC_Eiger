<%-- 
    Document   : orderlist
    Created on : Jan 26, 2022, 10:01:24 PM
    Author     : izzah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="admin_header.jsp" %>
<%@page import="model.Order" %>
<%@page import="model.User"%>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Order List</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/sidebar.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <style>
            table, th, td {
                border: 1px solid black;
                text-align: center;
                margin: 10px 50px 60px 70px;
            }
            th  {
                background-color: #FAFAFA;
            }
            td  {
                background-color: white;
            }
            .block-container    {
                display: block;
                justify-content: center;
            }
        </style>
        
        <%
            User user = (User) session.getAttribute("user");
            String dateString = (String) session.getAttribute("dateString");
            
            String sort = request.getParameter("sort");
            String status = request.getParameter("status");
            
            ArrayList orders = new ArrayList(); 
            if("all".equals(status)) {
                ArrayList ords_all = (ArrayList) session.getAttribute("ords_all");
                orders = ords_all;
            }
            else if("Pending".equals(status)) {
                ArrayList ords_pending = (ArrayList) session.getAttribute("ords_pending");
                orders = ords_pending;
            }
            else if("Processing".equals(status)) {
                ArrayList ords_processing = (ArrayList) session.getAttribute("ords_processing");
                orders = ords_processing;
            }
            else if("Shipped".equals(status)) {
                ArrayList ords_shipped = (ArrayList) session.getAttribute("ords_shipped");
                orders = ords_shipped;
            }
            else if("Complete".equals(status)) {
                ArrayList ords_complete = (ArrayList) session.getAttribute("ords_complete");
                orders = ords_complete;
            }
            else if("Cancel".equals(status)) {
                ArrayList ords_cancel = (ArrayList) session.getAttribute("ords_cancel");
                orders = ords_cancel;
            }
            pageContext.setAttribute("orders", orders);
            //session.setAttribute("order_list", orders);
        %>
    </head>
    <body>
        <div style="background-color: #F8F5FF;">
             <center><h2><b> Order List </b></h2></center>
             <br><br>
             
             <center>
                 <c:choose>
                     <c:when test="${empty orders}">
                         <h3>List is empty !</h3>
                     </c:when>
                     <c:otherwise>
                    <table style="width: 70%;">
                        <tr>
                            <th>Order ID</th>
                            <th>Order Date</th>
                            <th>Total Price</th>
                            <th>Payment Method</th>
                            <th>Email</th>
                            <th></th>
                        </tr>
                        <c:forEach items="${orders}" var="order">
                        <tr>
                           <td><c:out value="${order.id}" /></td>
                           <td><c:out value="${order.date}" /></td>
                           <c:set var="orderid" value="${order.id}"  />
                           <%
                               String link = "orderDetailsController?orderid=" + pageContext.getAttribute("orderid");
                           %>
                           <td>RM <c:out value="${order.total}" /></td>
                           <td><c:out value="${order.payment}" /></td>
                           <td><c:out value="${order.email}" /></td>
                           
                           <c:set var="status" scope="session" value="${order.status}"/> 
                           <c:if test="${'Pending'.equals(status)}">
                               <td><button type="submit" style="background-color: #76197E; border-radius: 4px;width: 100px;" onclick="location.href='<%= link %>';"><c:out value="${order.status}" /></button></td>
                           </c:if>
                           <c:if test="${'Processing'.equals(status)}">
                               <td><button type="submit" style="background-color: #888888; border-radius: 4px;width: 100px;" onclick="location.href='<%= link %>';"><c:out value="${order.status}" /></button></td>
                           </c:if>
                           <c:if test="${'Shipped'.equals(status)}">
                               <td><button type="submit" style="background-color: #E3B104; border-radius: 4px;width: 100px;" onclick="location.href='<%= link %>';"><c:out value="${order.status}" /></button></td>
                           </c:if>
                           <c:if test="${'Complete'.equals(status)}">
                               <td><button type="submit" style="background-color: #20B225; border-radius: 4px;width: 100px;" onclick="location.href='<%= link %>';"><c:out value="${order.status}" /></button></td>
                           </c:if>
                           <c:if test="${'Cancel'.equals(status)}">
                               <td><button type="submit" style="background-color: #EE3F3F; border-radius: 4px;width: 100px;" onclick="location.href='<%= link %>';"><c:out value="${order.status}" /></button></td>
                           </c:if>
                        </tr>
                        
                        </c:forEach>
                    </c:otherwise>
                 </c:choose>
             </table>
             </center>
        </div>
    </body>
</html>
