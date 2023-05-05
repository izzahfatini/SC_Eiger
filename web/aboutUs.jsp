<%-- 
    Document   : aboutUs.jsp
    Created on : Jan 18, 2022, 12:30:44 PM
    Author     : farhah
--%>

<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>

<% 
    if ((User) session.getAttribute("user") == null)
    response.sendRedirect("login.jsp");
%>

<!DOCTYPE html>
<html>
    <head>
        <title>About Us</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/astyle.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <style>
            body {background-color: #F8F5FF;}
            
            .parent {
                display: flex;
                align-items: center;
                justify-content: center;
            }
            
            .elKotak{
                width: 600px;
                height: 420px;
                margin: 50px;
            }
            
            .gridAll {
                display: grid;
                grid-template-columns: 95px 300px;
                grid-template-rows: 3fr;
                line-height: 2;
                height: 200px;
                grid-row-gap: 40px;
            }
        </style>
    </head>
    <body>

        <br><br><br>
        <div><h1 style="text-align: center"> About Us </h1></div><br><br>
        <div style="margin: auto; width: 1000px"><p style="text-align: center"> Leo Skin Specialist Clinic is one of the best dermatology and aesthetic clinic in Johor Bahru. Embark with us on a journey to discover your beauty potential and regain your confidence. Aside from modern equipment and techniques, we also have experienced personnel with a positive and willing attitude. An accurate understanding of your condition will lead you to the best possible treatment and outcome.</p></div>

        <div class="parent">
            <div class="elKotak gridAll" style="width:400px">
                <div> <img src="images/map.png" width="60%"> </div>
                <div> 10A-24B, Jalan Sejahtera, Taman Sejahtera, 81300 Skudai, Johor</div>
                <div> <img src="images/phone.png" width="60%"> </div>
                <div> Tel  :  07-12345567 <br> Tel  :  07-7654321 </div>
                <div> <img src="images/clock.png" width="60%"> </div>
                <div> Consultation Hours : <br> Monday - Saturday  10am - 6pm </div>
            </div>
            <div class="elKotak"><img src="images/clinic2.png"></div> 
        </div>

    </body>
</html>

