<%-- 
    Document   : myAccount
    Created on : Jan 25, 2022, 12:03:31 AM
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
        <title>My Account</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/astyle.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
     
        <style>
            body{
                background-color: #F8F5FF;     
                height: 100%;
            }

            .user_card{
                height: 600px;
                width: 800px;
                padding: 20px 80px 20px 80px;
                margin-bottom: 20px;
            }
            
            .jarak { padding-bottom: 30px; }
            .kotak{ width:800px;}
            
            .msg {
                background-color: #d5ede3;
                padding: 15px;
                width: 400px;
                margin: auto;
            }
            
        </style>
    </head>
    <body>
        <jsp:useBean id="user" scope="session" class="model.User" />
        <br><br><br>
        <h1 style="text-align: center"> My Account </h1><br><br>
        <div class="container h-100">
            <div class="d-flex justify-content-center h-100">
                <div class="user_card"> 
                    
                    <% 
                        String msg = request.getParameter("msg"); 
                        if("updated".equals(msg))
                            out.println("<div class='msg'> Profile has been updated successfully! </div><br>");
                        if("noAddress".equals(msg))
                            out.println("<div class='msg' style='background-color: #f2c9cf'> Please fill in your address. </div><br>");
                    %>

                    <form method="post" action="editProfileController">
                        
                    <p><h3><img src="images/user.png" width="60px" height="60px">&nbsp;&nbsp;&nbsp; <jsp:getProperty name="user" property="fullname"/></h3></p> <br>
                    <div class="row">
                        <div class="col-md-3 jarak"> <b>Full name</b> </div>
                        <div class="col-md-9 jarak"> <input class="form-control" type="text" name="fullname" value="<jsp:getProperty name="user" property="fullname"/>"> </div>
                        <div class="col-md-3 jarak"> <b>Email</b> </div>
                        <div class="col-md-9 jarak"> <input class="form-control" type="text" name="email" value="<jsp:getProperty name="user" property="email"/>" readonly> </div>
                        <div class="col-md-3 jarak"> <b>Phone Number</b> </div>
                        <div class="col-md-9 jarak"> <input class="form-control" type="text" name="phone" value="<jsp:getProperty name="user" property="phone"/>"> </div>
                        <div class="col-md-3 jarak"> <b>Address</b> </div>
                        <div class="col-md-9 jarak"> <textarea class="form-control" name="address"><jsp:getProperty name="user" property="address"/></textarea> </div>
                    </div><br>
                    <input type="submit" class="btnAll" style="margin-left: 450px" value="Update Profile">
                    
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>

