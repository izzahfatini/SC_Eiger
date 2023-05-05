<%-- 
    Document   : descriptionProduct
    Created on : Jan 26, 2022, 6:41:54 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%@ page import="java.sql.*" %>
<%@page import="model.User"%>

<% 
    if ((User) session.getAttribute("user") == null)
    response.sendRedirect("login.jsp");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Leo Vitamin Glow Serum</title>
        <link rel=\"stylesheet\" type=\"text/css\" href=\"css/style.css\">
        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3\" crossorigin=\"anonymous\">
        <style>
            body {background-color: #F8F5FF;}
            .content {
                height: auto;
                padding-left: 30px;
                padding-right: 30px;
                background-color: white;
                width: 80%;
                border-radius: 15px;
            </style>
    </head>
    <body>
        
        <%
            int item_id = Integer.parseInt(request.getParameter("id"));
        
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/leoClinic?", "root", ""); 
            Statement st = con.createStatement(); 
            ResultSet rs = st.executeQuery("SELECT * FROM product where id = '"+item_id+"'");
            while(rs.next()) {
        %>
        
        <br>
        <center><h2><b> <%=rs.getString(2)%> </b></h2></center> <br>
        <center>
        <div class="content">
            <br><br>
            <img src="images/<%=rs.getString(8)%>" width="180px" height="260px"><br><br><br>
            <img src="images/product.png" width="30px" height="30px">
            <b>Description </b><br><br>
            <div> <%=rs.getString(5)%> </div> <br><br>
            <img src="images/product.png" width="30px" height="30px">
            <b>Instruction </b><br><br>
            <div> <%=rs.getString(6)%> </div> <br><br><br>
        </div>
        </center>
        
        <%  } 
            st.close();
            con.close();
        %>
    </body>
</html>