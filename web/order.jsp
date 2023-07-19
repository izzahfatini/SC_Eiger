<%-- 
    Document   : order
    Created on : Jan 19, 2022, 12:19:14 AM
    Author     : izzah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="admin_header.jsp" %>
<%@page import="java.sql.*" %>
<%@page import="model.Order" %>
<%@page import="model.User"%>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Order</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/sidebar.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <style>
            .flex-container {
                display: flex;
                justify-content: center;
              }

            .flex-container > div {
                background-color: #FAFAFA;
                width: 300px;
                padding: 50px;
                margin: 10px 50px 60px 70px;
                font-size: 30px;
                border: 1px solid lightgrey;
                box-shadow: 1px 1px #888888;
              }
        </style>
    </head>
    <body>
            <script>
                <%
                    //String sort = request.getParameter("sort");
                    String sort = (String) session.getAttribute("sort");
                    String sort_ = "";
                    
                    if (sort == null) {
                        sort="today";
                    }
                    if ("today".equals(sort))    {
                        sort_ = "Today";
                    }
                    else if ("month".equals(sort))    {
                        sort_ = "This Month";
                    }
                    else if ("all".equals(sort))    {
                        sort_ = "All";
                    }
                %> 
                /* Set the width of the sidebar to 250px (show it) */
                function openNav() {
                  document.getElementById("mySidepanel").style.width = "15%";
                }

                /* Set the width of the sidebar to 0 (hide it) */
                function closeNav() {
                  document.getElementById("mySidepanel").style.width = "0";
                }
            </script>

        <div style="background-color: #F8F5FF">
            <center><h2><b> View Order </b></h2><h6>(<%= sort_ %>)</h6></center>
            <div style="text-align: right;">
                <form method="get" action="orderController_admin">
                    By: <select id="sort" name="sort" width="100">
                        <option value="none" selected disabled hidden>Select an Option</option>
                        <option value="today">Today</option>
                        <option value="month" >This Month</option>
                        <option value="all">All</option>
                    </select> <input type="submit" name="submit" value="Select" /> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </form>
                
                <button><a href=""><span>Print All</span></a></button>
            </div>
            <%
                String linkall = "orderlist.jsp?sort=" + sort + "&status=all";
                String linkpen = "orderlist.jsp?sort=" + sort + "&status=Pending";
                String linkpro = "orderlist.jsp?sort=" + sort + "&status=Processing";
                String linkship = "orderlist.jsp?sort=" + sort + "&status=Shipped";
                String linkcom = "orderlist.jsp?sort=" + sort + "&status=Complete";
                String linkcan = "orderlist.jsp?sort=" + sort + "&status=Cancel";
                
                User user = (User) session.getAttribute("user");
                String dateString = (String) session.getAttribute("dateString");
                
                ArrayList ords_all = (ArrayList) session.getAttribute("ords_all");
                ArrayList ords_pending = (ArrayList) session.getAttribute("ords_pending");
                ArrayList ords_processing = (ArrayList) session.getAttribute("ords_processing");
                ArrayList ords_shipped = (ArrayList) session.getAttribute("ords_shipped");
                ArrayList ords_complete = (ArrayList) session.getAttribute("ords_complete");
                ArrayList ords_cancel = (ArrayList) session.getAttribute("ords_cancel");
                
                float total_all = Float.parseFloat((String)session.getAttribute("total_all"));
                float total_pending = Float.parseFloat((String)session.getAttribute("total_pending"));
                float total_processing = Float.parseFloat((String)session.getAttribute("total_processing"));
                float total_shipped = Float.parseFloat((String)session.getAttribute("total_shipped"));
                float total_complete = Float.parseFloat((String)session.getAttribute("total_complete"));
                float total_cancel = Float.parseFloat((String)session.getAttribute("total_cancel"));
                
                int i_all = Integer.parseInt((String)session.getAttribute("i_all"));
                int i_pending = Integer.parseInt((String)session.getAttribute("i_pending"));
                int i_processing = Integer.parseInt((String)session.getAttribute("i_processing"));
                int i_shipped = Integer.parseInt((String)session.getAttribute("i_shipped"));
                int i_complete = Integer.parseInt((String)session.getAttribute("i_complete"));
                int i_cancel = Integer.parseInt((String)session.getAttribute("i_cancel"));
            %>
            <br>
            <div class="flex-container">
                <div>
                    <a href="<%= linkall %>" style="color: black;"><center><%= i_all %>&nbsp; (RM<%= total_all %>)</center></a>
                    <a href="<%= linkall %>"><div style="text-align: right; color: #76197E; font-size: 17px;">Total Order <img src="images/arrow 1.png" style="width:17px;height:17px;"></div></a>
                </div>
                <div>
                    <a href="<%= linkpen %>" style="color: black;"><center><%= i_pending %>&nbsp; (RM<%= total_pending %>)</center></a>
                    <a href="<%= linkpen %>"><div style="text-align: right; color: #76197E; font-size: 17px;">Pending Order <img src="images/arrow 1.png" style="width:17px;height:17px;"></div></a>
                </div>
            </div>
            <div class="flex-container">
                <div>
                    <a href="<%= linkpro %>" style="color: black;"><center><%= i_processing %>&nbsp; (RM<%= total_processing %>)</center></a>
                    <a href="<%= linkpro %>"><div style="text-align: right; color: #76197E; font-size: 17px;">Processing Order <img src="images/arrow 1.png" style="width:17px;height:17px;"></div></a>
                </div>
                <div>
                    <a href="<%= linkship %>" style="color: black;"><center><%= i_shipped %>&nbsp; (RM<%= total_shipped %>)</center></a>
                    <a href="<%= linkship %>"><div style="text-align: right; color: #76197E; font-size: 17px;">Shipped Order <img src="images/arrow 1.png" style="width:17px;height:17px;"></div></a>
                </div>
            </div>
            <div class="flex-container">
                <div>
                    <a href="<%= linkcom %>" style="color: black;"><center><%= i_complete %>&nbsp; (RM<%= total_complete %>)</center></a>
                    <a href="<%= linkcom %>"><div style="text-align: right; color: #76197E; font-size: 17px;">Complete Order <img src="images/arrow 1.png" style="width:17px;height:17px;"></div></a>
                </div>
                <div>
                    <a href="<%= linkcan %>" style="color: black;"><center><%= i_cancel %>&nbsp; (RM<%= total_cancel %>)</center></a>
                    <a href="<%= linkcan %>"><div style="text-align: right; color: #76197E; font-size: 17px;">Cancel Order <img src="images/arrow 1.png" style="width:17px;height:17px;"></div></a>
                </div>
            </div>
        </div>
    </body>
</html>