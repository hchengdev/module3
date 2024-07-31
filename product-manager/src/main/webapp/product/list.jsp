<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Products List</title>
</head>
<body>
<h1>Products</h1>
<p>
    <a href="product?action=create">Create new customer</a>
    <a href="product">Back to customer list</a>

</p>
<form method="get" >
    <input type="text" name="action" value="search" style="display: none">
    <input type="text" name="query" placeholder="Search">
    <button type="submit" name="searchBtn" value="Search">Search</button>

</form>

<table border="1">
    <tr>
        <td>Name</td>
        <td>Email</td>
        <td>Address</td>
        <td>Edit</td>
        <td>Delete</td>
    </tr>
    <c:forEach items="${products}" var="product">
        <tr>
            <td><a href="?action=view&id=${product.getId()}">${product.getName()}</a></td>
            <td>${product.getPrice()}</td>
            <td>${product.getDescription()}</td>
            <td>${product.getManufacturer()}</td>
            <td><a href="?action=edit&id=${product.getId()}">edit</a></td>
            <td><a href="?action=delete&id=${product.getId()}">delete</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>