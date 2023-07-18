<%-- 
    Document   : header
    Created on : Jan 18, 2022, 12:28:01 PM
    Author     : farhah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User"%>
<%@page import="model.NullUser"%>
<% User u = (User) session.getAttribute("user"); %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/astyle.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </head>
    <body>
        <header class="header">
            <nav class="navbar navbar-expand-lg navbar-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="index.html"><img src="images/name.png" width="350px" height="100px"></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span></span>
                <span></span>
                <span></span>
                </button>
                <div class="collapse navbar-collapse justify-content-between" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0" style="margin-right: 30px;">
                        <li class="nav-item">
                            <a class="nav-link" href="home.jsp">Home</a>
                        </li>
                        <li class="nav-item" style="padding-left: 30px;">
                            <a class="nav-link" href="viewDoctorController">Our Experts</a>
                        </li>
                        <li class="nav-item" style="padding-left: 30px;">
                            <a class="nav-link" href="viewProductsController">Products</a>
                        </li>
                        <li class="nav-item" style="padding-left: 30px;">
                            <a class="nav-link" href="bookAppointment.jsp">Appointment</a>
                        </li>
                        <li class="nav-item" style="padding-left: 30px;">
                            <a class="nav-link" href="aboutUs.jsp">About</a>
                        </li>
                    </ul>
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item" style="padding-left: 30px;">
                            <% if (u.isNull()) { %>
                                <a class="nav-link" href="login.jsp"><img src="images/cart.png" width="70%"></a>
                            <% } else { %>
                                <a class="nav-link" href="viewCartController"><img src="images/cart.png" width="70%"></a>
                            <% } %>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img src="images/user.png" width="40%">
                            </a>
                            <% if (u.isNull()) { %>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="logoutControler">Log out</a>
                                </div>
                            <% } else { %>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="myAccount.jsp">My Account</a>
                                    <a class="dropdown-item" href="orderController">My Order</a>
                                    <a class="dropdown-item" href="logoutControler">Log out</a>
                                </div>
                            <% } %>
                        </li>
                    </ul>  
                </div>
            </div>
            </nav>
        </header>
    </body>
</html>
