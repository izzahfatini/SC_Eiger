<%-- 
    Document   : login
    Created on : Jan 15, 2022, 8:33:51 AM
    Author     : farhah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/astyle.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/a7b35074e7.js" crossorigin="anonymous"></script>
        
        <style> 
            
            body {
                background-color: #F8F5FF;
                color: darkslategray;
                font-size: 15px;
            }

            .Signup .btn {
                width: 100%;
                margin: 10px 0px;
                font-size: 18px;
                background-color: #7E538D;
                border: none;
            }
            
            .user_card{
                position: absolute;
                height: 500px;
                width: 500px;
                padding: 80px;
            }
            
            .top {
                text-align: center;
                justify-content: center;
            }
            
            .errormsg {
                background-color: #f2c9cf;
                color: #750213;
                padding: 15px;
                width: 320px;
            }
            
            .guestbtn {
                background-color: #bebebe;
                border: 1px solid #7E538D;
                color: white; 
                border-radius: 4px; 
                width: 319px;
                height: 45px;
            }
        </style>
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
            </div>
          </nav>
        </header><br>
        
        <div class="container h-100">
            <div class="d-flex justify-content-center h-100">
                <div class="user_card">
                    <!--<form action="loginController" method="post" name="form" class="Signup">-->
                        <div class="container">
                            <div class="row"> 
                                <div class="col-sm">
                                    
                                    <% 
                                        String msg = request.getParameter("msg"); 
                                        if("notexist".equals(msg))
                                            out.println("<div class='errormsg'> Incorrect username or password </div><br>");
                                    %>
                                    
                                    <h1 style="text-align: center"> Login </h1>
                                    <p style="text-align: center; color: gray"> Enter your credentials to continue </p>
                                    <hr class="mb-3">
                                    
                                    <form action="loginController" method="post" name="form" class="Signup">
                                        <label for="email"> <b>Email Address</b> </label>
                                        <input class="form-control" type="email" name="email" required>

                                        <label for="pswd"> <b>Password</b> </label>
                                        <input class="form-control" type="password" name="password" required>

                                        <hr class="mb-3">
                                        <input class="btn btn-primary" type="submit" id="register" name="create" value="Login">
                                    </form>
                                    <a href="guestlogin"><button class="guestbtn">Guest Login</button></a>
                                    
                                    <div class="mt-4">
                                        <div class="d-flex justify-content-center links">
                                            Don't have an account? &nbsp; <a href="signUp.jsp" style="color: #7E538D; text-decoration: none">Sign Up</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <!--</form>-->
                </div>
            </div>
        </div>
    </body>
</html>

