<%-- 
    Document   : bookAppointment
    Created on : Jan 10, 2022, 12:10:08 AM
    Author     : farhah
--%>

<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>

<%@page import="model.NullUser"%>
<% User usr = (User) session.getAttribute("user"); %>

<% 
    if ((User) session.getAttribute("user") == null)
    response.sendRedirect("login.jsp");
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Book Appointment</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/astyle.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
 
        <style>
            body { background-color: #F8F5FF;}
            
            .user_card{
                height: 900px;
                width: 800px;
                padding: 80px;
                margin-bottom: 20px;
            }
            
            .top {
                text-align: center;
                justify-content: center;
            }
            
            a {
                text-decoration: none;
                color: white;
            }
            
            .parent {
                width: 800px;
                margin: auto;
            }
            
            .btn2 {
                background-color: white;
                color: black;
                border: 2px solid #7E538D;
                width: 300px;
                height: 40px;
            }
        </style>
    </head>
    <body>
        
        <jsp:useBean id="user" scope="session" class="model.User" />  
        <br><br><br>
        <div class="parent"><button class="btn2" style="float:right;"><a href="myAppointmentController" style="color:#7E538D">  My Appointments </a></button></div><br><br><br>
        <div class="container h-100">
            <div class="d-flex justify-content-center h-100">
                <div class="user_card">
                    
                    <form method="post" action="bookAppController">
                        <div class="container">
                            <div class="row"> 
                                <div class="col-sm">
                                    
                                    <h1 style="text-align: center"> Book an Appointment </h1>
                                    <p style="text-align: center; color: gray"> Please complete the following in its entirety </p>
                                    <hr class="mb-3"><br><br>
                                    
                                    <label for="email"> <b>Full Name</b> </label>
                                    <input class="form-control" type="text" name="fullname" value="<jsp:getProperty name="user" property="fullname"/>" required><br>

                                    <label for="email"> <b>Email Address</b> </label>
                                    <input class="form-control" type="text" name="email" value="<jsp:getProperty name="user" property="email"/>" pattern="^[^ ]+@[^ ]+\.[a-z]{2,3}$" required><br>

                                    <label for="phone"> <b>Phone Number</b> </label>
                                    <input class="form-control" type="text" name="phone" value="<jsp:getProperty name="user" property="phone"/>" required><br>
                                    
                                    <label for="date"> <b>Preferred Date</b> </label>
                                    <input class="form-control" type="date" name="appdate" id="appdate" required><br>
                                    
                                    <label for="time"> <b>Preferred Time</b> </label>
                                    <input class="form-control" type="time" name="apptime" min="09:00" max="18:00" required><br>
                                    
                                    <label for="treatment"> <b>Select Treatment</b> </label><br>
                                    <select class="form-control" name="treatment">
                                        <option>Acne Treatment</option>
                                        <option>Birthmark / Skin Tag / Warts / Oil Seeds / Milia Seeds Treatment</option>
                                        <option>Facial Sculpting / Conturing Treatement</option>
                                        <option>Fungal Infection Treatement</option>
                                    </select><br>
                                    <hr class="mb-3">
<!--                                    <input class="btnAll" name="submit" type="submit" value="Submit"/>-->
                                    <% if (usr.isNull()) { %>
                                        <button class="btnAll"><a href="login.jsp">Login</a></button>
                                    <% } else { %>
                                        <input class="btnAll" name="submit" type="submit" value="Submit"/>
                                    <% } %>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        
        <script>
            var date = new Date();
            var tdate = date.getDate();
            var month = date.getMonth() + 1;
            var year = date.getUTCFullYear();
            
            if(tdate < 10){
                tdate = '0' + tdate;
            }
            if(month < 10){
                month = '0' + month;
            }

            var minDate = year + "-" + month + "-" + tdate;
            document.getElementById("appdate").setAttribute('min',minDate);
            console.log(minDate);
        </script>
        
    </body>
</html>
