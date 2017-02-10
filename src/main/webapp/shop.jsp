<%-- 
    Document   : shop
    Created on : 9 Feb, 2017, 4:51:51 PM
    Author     : zeroadmin
--%>

<%@page language = "java" contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage = "error.jsp" %>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Kelly's Ski Equipment</title>
        <link rel="stylesheet" href = "style.css" type = "text/css" />
    </head>
    <body>
        
        <%-- Set the SQL Connection --%>
        <sql:setDataSource
            var = "myDS"
            driver = "org.postgresql.Driver"
            url = "jdbc:postgresql://localhost:5432:/skistuff"
            user = "fred"
            password = "secret"
            />
        <sql:query var = "listStuff" dataSource = "${myDS}" >
            SELECT * FROM skisEtc ORDER BY id;
        </sql:query>
        
    <center><h3>Kell's Ski Equipment</h3></center>
    <div align="center">
        <form action = "handleOrder" method = "post">
            <table class = "products" border = "1" cellpadding = "5">
                <tr>
                    <th>Buy</th>
                    <th>Qty</th>
                    <th>Id</th>
                    <th>Product</th>
                    <th>Category</th>
                    <th>Price</th>
                </tr>
                <c:set var = 'ind' value = '1' scope = 'page' />
                <c:forEach var = "item" items = "${listStuff.rows}">
                    <tr>
                        <td><input type = "checkbox" name = "check-${ind}" value= "${ind}" /></td>
                        <td><input type = "number" name = "num-${ind}" min = "0" max = "99" step = "1" value = "0"
                                   size = "3" /></td>
                        <td><input type = "text" name = "id-${ind}"
                                   value = "${item.id}" size = "4" readonly/></td>
                        <td><input type = "text" style = "text-align:center;" name = "prod-${ind}"
                                   value = "${item.product}" readonly/></td>
                        <td><input type = "text" style = "text-align:center;" name = "cat-${ind}"
                                   value = "${item.category}" readonly/></td>
                        <td><input type = "text" name = "price-${ind}"
                                   value = "${item.price}" size = "7" readonly /></td>
                        <td><input </td>
                    </tr>
                    <c:set var = 'ind' value = '${ind+1}' />
                </c:forEach>
                <input type = "hidden" value = "${listStuff.rowCount}" name = "rowCount" />
            </table>
            <p><input type = "submit" value = "Submit Order"/></p>
        </form>
    </div>
        
    </body>
</html>
