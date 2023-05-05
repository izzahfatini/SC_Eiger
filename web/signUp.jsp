<%-- 
    Document   : signUp
    Created on : Jan 8, 2022, 4:40:17 AM
    Author     : farhah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Sign Up</title>
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
                height: 600px;
                width: 500px;
                padding: 80px;
            }
            
            .top {
                text-align: center;
                justify-content: center;
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
                    <form method="post" action="signUpController" name="form" class="Signup">
                        <div class="container">
                            <div class="row"> 
                                <div class="col-sm">

                                    <h1 style="text-align: center"> Sign Up </h1>
                                    <p style="text-align: center; color: gray"> Enter your credentials to continue </p>
                                    <hr class="mb-3">

                                    <label for="lname"> <b>Full Name</b> </label>
                                    <input class="form-control" type="text" name="fullname" required>

                                    <label for="email"> <b>Email Address</b> </label>
                                    <input class="form-control" type="text" name="email" pattern="^[^ ]+@[^ ]+\.[a-z]{2,3}$" required>

                                    <label for="phoneno"> <b>Phone Number</b> </label>
                                    <input class="form-control" type="text" name="phone" required>

                                    <label for="pswd"> <b>Password</b> </label>
                                    <input class="form-control" type="password" name="password" required>

                                    <hr class="mb-3">
                                    <input class="btn btn-primary" type="submit" id="register" name="create" value="Sign Up">
                                    
                                    <div class="mt-4">
                                        <div class="d-flex justify-content-center links">
                                            Already have an account? &nbsp; <a href="login.jsp" style="color: #7E538D; text-decoration: none">Login</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>


