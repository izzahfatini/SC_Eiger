<%-- 
    Document   : checkout
    Created on : Jan 21, 2022, 2:29:52 PM
    Author     : EradahAhayatMohamed
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%@ page import="model.Cart" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  
<%@page import="model.User"%>

<% 
    if ((User) session.getAttribute("user") == null)
    response.sendRedirect("login.jsp");
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Checkout</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
         
        <style>
            body {background-color: #F8F5FF;}
            .cart {
                display: grid;
                grid-template-columns: 1fr 200px 200px 200px;
                grid-template-rows: 1fr;
                grid-row-gap: 15px;
                width: 1100px;
            }
            
            .base {
                background-color: white;
                padding: 20px 0px 20px 50px;
                margin: auto;
                border: 1px solid #E5E4E2;
                border-radius: 0.8em 0.8em 0.8em 0.8em;
                line-height: 2.0;
            }

            .paymenthod {
                width: 1100px;
                background-color: white;
                margin: auto;
                grid-template-columns: 230px 230px;
                grid-template-rows: 1fr;
                border: 1px solid #E5E4E2;
                border-radius: 0 0 0.8em 0.8em;
                padding: 20px 20px 20px 20px;
                line-height: 2.0;
            }
            
            .atas {
                border-bottom: none; 
                border-radius: 0.8em 0.8em 0 0; 
                font-size: 18px; 
                font-weight: bold;
            }
            
            .btn{
                background-color: #53B175; 
                padding: 12px 120px 12px 120px; 
                border: none; 
                color: white;
                font-family: serif;
                font-size: 16px;
            }
            
            .btn:hover {text-decoration: underline;}
            .bawah {border-radius: 0 0 0.8em 0.8em}
            .satu { grid-area: 1/1/2/3; padding: 0 0 0 20px;}
            .option { width: 450px; }
        </style>
        
        <script type="text/javascript">
            
            function isEmpty() {
                var groupChecked; 

                for (var i=0; i<document.form.pay.length; i++) {
                   if (document.form.pay[i].checked) {
                       groupChecked = document.form.pay[i].value;
                }}
                
                if(funcgroup(groupChecked, "Please choose your payment method.")) {
                    return true;
                }
                return false;
            }

            function funcgroup(elem, helperMsg){
                if(!elem){
                    alert(helperMsg);
                    return false;
                }
                return true;
            }

    
        </script>
        
    </head>
    <body>
        
        <br>
        <center><h2><b> Checkout </b></h2></center>
    
        <br><br><br>
        
        <div class="base cart atas">
            <div> Product Ordered </div>
            <div> Unit Price </div>
            <div> Quantity </div>
            <div> Item subtotal </div>
        </div>

        <div class="base cart" style="border-bottom: none; border-radius: 0 0 0 0">       
        <c:forEach items="${requestScope.cartList}" var="cart" varStatus="loop">        
            <div style="text-align:left;"> <img src="images/<c:out value='${cart.image}' />" width="80pixels" height="80pixels" valign="middle"> &emsp;&emsp;&emsp; <c:out value='${cart.name}' /></div>
            <div style="padding-top:30px;"> RM <fmt:formatNumber type = "number" minFractionDigits="2" maxFractionDigits = "2" value = "${cart.price}" /> </div>
            <div style="padding-top:30px;"> <c:out value='${cart.quantity}' /> </div>
            <div style="padding-top:30px;"> RM <fmt:formatNumber type = "number" minFractionDigits="2" maxFractionDigits = "2" value = "${cart.total_price}" /> </div> 
            <c:set var="totalall" value="${totalall + cart.total_price}" />
        </c:forEach>
        </div> 
        
        
        <div class="base cart bawah">
            <div></div><div></div>
            <div><b> Order Total : </b></div>
            <div> RM <fmt:formatNumber type = "number" minFractionDigits="2" maxFractionDigits = "2" value = "${totalall}" /> </div>
        </div> <br><br>
        
        <form name="form" method="post" action="checkout2Controller" onsubmit="isEmpty()">       
        <div>
            <div class="base atas paymenthod"> Payment Method </div>
            
            <div class="paymenthod">
                <input type="radio" name="pay" value="VISA / Master Card"> VISA / Master Card <br>
                <input type="radio" name="pay" value="FPX / Online Banking"> FPX / Online Banking 

                <select name="pay">
                    <option value="Maybank2u">Maybank2u </option>
                    <option value="CIMB Clicks">CIMB Clicks </option>
                    <option value="RHB Now">RHB Now </option>
                </select> 
    
            </div> 
            
        </div> <br><br>    
        
        <input type="hidden" name="totalAll" value="<c:out value='${totalall}' />">
        <input type="hidden" name="purchasedate" id="purchasedate">           
        <center> <input type="submit" value="Place Order" style="color: white; background-color: #7E538D; padding: 12px 510px 12px 510px; border-radius: 10px"/></center>

        </form>
        <br><br><br><br>
        
        <script>
            var date = new Date();
            var tdate = date.getDate();
            var month = date.getMonth()+1;
            var year = date.getUTCFullYear();
            
            if (month < 10) {
                var pDate = year + "/0" + month + "/" + tdate;
            }
            else    {
                var pDate = year + "/" + month + "/" + tdate;
            }
            
            document.getElementById("purchasedate").value = pDate;
            console.log(pDate);
        </script>
        
    </body>
</html>
