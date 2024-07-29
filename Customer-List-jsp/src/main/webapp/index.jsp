<%@ page import="com.example.customerlistjsp.Customer" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
  <title>JSP - Hello World</title>
</head>
<body>
<h1>Danh sách khách hàng</h1>
<table>
  <thead>
  <tr>
    <th>Tên</th>
    <th>Ngày sinh</th>
    <th>Địa chỉ</th>
    <th>Ảnh</th>
  </tr>
  </thead>
  <tbody>
  <c:forEach var="customer" items="${customers}">
    <tr>
      <td>${customer.name}</td>
      <td>${customer.birthdate}</td>
      <td>${customer.address}</td>
      <td><img src="${customer.image}" alt="${customer.name}"></td>
    </tr>
  </c:forEach>
  </tbody>
</table>
</body>
</html>