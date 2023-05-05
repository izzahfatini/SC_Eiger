<%-- 
    Document   : admin_doctor_add
    Created on : Jan 24, 2022, 12:00:50 AM
    Author     : ALYA
--%>

<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="admin_header.jsp" %>

<% 
    if ((User) session.getAttribute("user") == null)
    response.sendRedirect("login.jsp");
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Add Doctor</title>
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
        <h1 style="text-align: center"> Add New Doctor </h1><br><br>
        <div class="cont">
            <div class="user_card">
                <form method="post" action="addDoctorController" enctype="multipart/form-data">
                    <div class="bahagi">
                        <div> Doctor Name </div>
                        <div> <input type="text" name="name" required> </div>
                        <div> Staff ID </div>
                        <div> <input type="text" name="staffID" required> </div>
                        <div> E-mail </div>
                        <div> <input type="text" name="email" required> </div>
                        <div> Phone No </div> 
                        <div> <input type="number" name="phone" required> </div>
                        <div> Specialties </div>
                        <div> <input type="text" name="specialties" required> </div>
                        <div> Qualification </div> 
                        <div> <input type="text" name="qualification" required> </input> </div>
                        <div> Doctor Image </div>
                        <div> <input type="file" name="image1" style="background-color: white; border: none" required> </div>
                        <div> Status </div> 
                        <div> <select name="status" required>
                                    <option value="Active">Active</option>
                                    <option value="In-Active">In-Active</option>
                              </select> 
                        </div>
                    </div><br>
                <div><input type="submit" class="btnAll" style="margin-left: 350px" value="Add Doctor"> </div>
                </form>
            </div>
        </div>
    </body>
</html>

