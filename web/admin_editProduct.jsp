<%-- 
    Document   : admin_editProduct
    Created on : Jan 18, 2022, 12:50:05 PM
    Author     : farhah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="admin_header.jsp" %>
<%@ page import="java.sql.*" %>
<%@page import="model.User"%>

<% 
    if ((User) session.getAttribute("user") == null)
    response.sendRedirect("login.jsp");
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Edit Product</title>
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
        <h1 style="text-align: center"> Edit Product </h1><br><br>
        <div class="cont">
            <div class="user_card">
                
                <%
                    String product_id = request.getParameter("id");
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/leoClinic?", "root", "");
                    Statement st = con.createStatement(); 
                    ResultSet rs = st.executeQuery("SELECT * FROM product WHERE id = '"+product_id+"'");
                    while(rs.next()) {
                %>
                
                <form method="post" action="editProductController" enctype="multipart/form-data">
                    <div class="bahagi">
                        <div> Product name </div>
                        <div> <input type="text" name="name" value="<%=rs.getString(2)%>"> </div>
                        <div> Price </div>
                        <div> <input type="text" name="price" value="<%=rs.getString(3)%>"> </div>
                        <div> Stock Quantity </div> 
                        <div> <input type="number" name="quantity" value="<%=rs.getString(4)%>"> </div>
                        <div> Description </div> 
                        <div> <textarea name="description"><%=rs.getString(5)%></textarea> </div>
                        <div> Instruction </div> 
                        <div> <textarea name="instruction"><%=rs.getString(6)%></textarea> </div>
                        <div> Packing Size </div>
                        <div> <input type="text" name="packing" value="<%=rs.getString(7)%>"> </div>
                        <div> Product Image </div>
                        <div> <input type="file" name="image" style="background-color: white; border: none"> </div>
                        <input type="hidden" name="id" value="<%=product_id %>" readonly>
                        <input type="hidden" name="imagebfr" value="<%=rs.getString(8)%>" readonly>
                    </div>
                <br><br>
                
                <%  } 
                    st.close();
                    con.close();
                %>
                
                <div><input type="submit" class="btnAll" style="margin-left: 350px" value="Update Product"></div>
                </form>
            </div>
        </div>
    </body>
</html>

