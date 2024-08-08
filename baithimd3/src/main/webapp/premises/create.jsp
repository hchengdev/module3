<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Create/Edit Premises</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<div class="container mt-4">
    <h2>Create Premises</h2>

    <form method="post" action="${pageContext.request.contextPath}/create-premises">

        <input type="hidden" name="id" value="${requestScope["premises"].getId()}" />

        <div class="form-group">
            <label for="premisesCode">Premises Code:</label>
            <input type="text" id="premisesCode" class="form-control" name="premisesCode" value="${requestScope["premises"].getPremisesCode()}" >
        </div>

        <div class="form-group">
            <label for="status">Status:</label>
            <input type="text" class="form-control" id="status" name="status" value="${requestScope["premises"].getStatus()}" >
        </div>

        <div class="form-group">
            <label for="area">Area (m²):</label>
            <input id="area" type="number" step="0.01" class="form-control" name="area" value="${requestScope["premises"].getArea()}" >
        </div>

        <div class="form-group">
            <label for="floor">Floor:</label>
            <input type="number" id="floor" class="form-control" name="floor" value="${requestScope["premises"].getFloor()}" >
        </div>

        <div class="form-group">
            <label for="type">Type:</label>
            <input type="text" id="type" class="form-control" name="type" value="${requestScope["premises"].getType()}" >
        </div>

        <div class="form-group">
            <label for="price">Price:</label>
            <input type="number" step="0.01" id="price" class="form-control" name="price" value="${requestScope["premises"].getPrice()}" >
        </div>

        <div class="form-group">
            <label for="startDate">Start Date:</label>
            <input type="date" id="startDate" class="form-control" name="startDate" value="${requestScope["premises"].getStartDate()}" >
        </div>

        <div class="form-group">
            <label for="endDate">End Date:</label>
            <input type="date" id="endDate" class="form-control" name="endDate" value="${requestScope["premises"].getEndDate()}" >
        </div>

        <button type="submit" class="btn btn-primary">Create Premises</button>
        <a href="${pageContext.request.contextPath}/list-premises" class="btn btn-secondary">Back to Premises List</a>
    </form>
</div>
</body>
</html>
