<%-- 
    Document   : admin_appointment_edit
    Created on : Jan 24, 2022, 6:54:01 PM
    Author     : ALYA
--%>

<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="admin_header.jsp" %>
<%@ page import="java.sql.*" %>

<% 
    if ((User) session.getAttribute("user") == null)
    response.sendRedirect("login.jsp");
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Edit Doctor</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/sidebar.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/astyle.css">
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    
        <style>
            
            body{background-color: #F8F5FF;}
            
            .cont {
                display: flex;
                justify-content: center;
            }
            
            .user_card {
                height: 700px;
                width: 710px;
                padding: 0 80px 0 80px;
                margin-bottom: 20px;
                margin-top: 20px;
            }
            
            .bahagi {
                display: grid;
                grid-template-columns: 150px 350px;
                grid-template-rows: 40px 40px 40px 40px 40px 40px 40px;
                grid-row-gap: 30px;
            }
            
            input, textarea {
                border: 1px solid darkgray;
                border-radius: 3px;
                height: 40px;
                width: 400px;
                background-color: #fafafa;
            }
            
        </style>
    </head>
    <body>
        <h1 style="text-align: center"> Appointment Approval </h1>
        <div class="cont">
            <div class="user_card">
                <%
                    String appointment_id = request.getParameter("id");
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/leoClinic?", "root", "");
                    Statement st = con.createStatement(); 
                    ResultSet rs = st.executeQuery("SELECT * FROM appointment WHERE id = '"+appointment_id+"'");
                    while(rs.next()) {
                %>
                
                <form method="post" action="editAppointmentController" enctype="multipart/form-data">
                    <div class="bahagi">
                        <div hidden> ID </div>
                        <div hidden><%=rs.getString(1)%></div>
                        <div> Patient Name </div>
                        <div><%=rs.getString(2)%></div>
                        <div> E-mail </div>
                        <div><%=rs.getString(3)%></div>
                        <div> Phone No </div> 
                        <div><%=rs.getString(4)%></div>
                        <div> Date </div>
                        <div><%=rs.getString(5)%></div>
                        <div> Time </div> 
                        <div><%=rs.getString(6)%> </div>
                        <div> Treatment </div> 
                        <div> <%=rs.getString(7)%></div>
                        <div> Status </div> 
                        <div> <select name="status" required>
                                    <option value="Approved">Approve</option>
                                    <option value="Rejected">Reject</option>
                              </select> 
                        </div>
                        <input type="hidden" name="id" value="<%=appointment_id %>" readonly>
                        <input type="hidden" name="imagebfr" value="<%=rs.getString(1)%>" readonly>
                        </div>
                <br><br>
                <% } %>
                <div><input type="submit" class="btnAll" style="margin-left: 350px" value="Submit"></div>
                </form>
            </div>
        </div>
    </body>
</html>


