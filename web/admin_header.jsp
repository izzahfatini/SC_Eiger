<%-- 
    Document   : admin_header
    Created on : Jan 18, 2022, 12:44:58 PM
    Author     : farhah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Header</title>
        <link rel="stylesheet" type="text/css" href="css/sidebar.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </head>
    <body>
        <header class="header">
            <nav class="navbar navbar-expand-lg navbar-light">
                <div class="container-fluid"> 
                <button class="openbtn" onclick="openNav()">&#9776;</button>
                    <a class="navbar-brand" href="#"></a>
                        <div id="mySidepanel" class="sidepanel" ><img src="images/name1.png" width="70%" height="9%">
                            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                            <br><br><br>
                            <a href="admin_doctor.jsp"><i class="fas fa-stethoscope"></i>  Doctor</a>
                            <a href="admin_doctor_list.jsp"><i class="fas fa-stethoscope"></i>  List of Doctors</a>
                            <a href="admin_appointment.jsp"><i class="far fa-calendar-check"></i>  Appointment</a>
                            <a href="viewAdminProductsController"><i class="fas fa-shopping-bag"></i>  Product</a>
                            <a href="orderController_admin"><i class="fas fa-cart-plus"></i>  Orders</a>
                        </div>
                    
                        <div class="collapse navbar-collapse justify-content-between" id="navbarSupportedContent">
                            <ul class="navbar-nav ms-auto" style="padding-right: 50px">
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <img src="images/user.png" width="40%">
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="logoutControler">Log out</a>
                                    </div>
                                </li>
                            </ul> 
                        </div>
                </div>
            </nav>
            <script>
                /* Set the width of the sidebar to 250px (show it) */
                function openNav() {
                  document.getElementById("mySidepanel").style.width = "15%";
                }

                /* Set the width of the sidebar to 0 (hide it) */
                function closeNav() {
                  document.getElementById("mySidepanel").style.width = "0";
                }
            </script>
        </header>
    </body>
</html>
