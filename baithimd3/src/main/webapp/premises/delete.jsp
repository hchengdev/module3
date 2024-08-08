<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Delete Premises</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<style>
    .btn-margin-top {
        margin-top: 10px;
    }
</style>
<body>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<div class="container mt-4">
    <h2>Delete Premises</h2>

    <form method="post" action="${pageContext.request.contextPath}/delete-premises">

        <input type="hidden" name="id" value="${requestScope["premises"].getId()}" />

        <div class="form-group">
            <label for="premises_code">Premises Code:</label>
            <input type="text" id="premises_code" class="form-control" name="premises_code" value="${requestScope["premises"].getPremisesCode()}" readonly>
        </div>

        <div class="form-group">
            <label for="status">Status:</label>
            <input type="text" class="form-control" id="status" name="status" value="${requestScope["premises"].getStatus()}" readonly>
        </div>

        <div class="form-group">
            <label for="area">Area (m²):</label>
            <input id="area" type="number" step="0.01" class="form-control" name="area" value="${requestScope["premises"].getArea()}" readonly>
        </div>

        <div class="form-group">
            <label for="floor">Floor:</label>
            <input type="number" id="floor" class="form-control" name="floor" value="${requestScope["premises"].getFloor()}" readonly>
        </div>

        <div class="form-group">
            <label for="type">Type:</label>
            <input type="text" id="type" class="form-control" name="type" value="${requestScope["premises"].getType()}" readonly>
        </div>

        <div class="form-group">
            <label for="price">Price:</label>
            <input type="number" step="0.01" id="price" class="form-control" name="price" value="${requestScope["premises"].getPrice()}" readonly>
        </div>

        <div class="form-group">
            <label for="start_date">Start Date:</label>
            <input type="date" id="start_date" class="form-control" name="start_date" value="${requestScope["premises"].getStartDate()}" readonly>
        </div>

        <div class="form-group">
            <label for="end_date">End Date:</label>
            <input type="date" id="end_date" class="form-control" name="end_date" value="${requestScope["premises"].getEndDate()}" readonly>
        </div>

        <div class="form-group btn-margin-top">
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">Delete Premises</button>
            <a href="${pageContext.request.contextPath}/list-premises" class="btn btn-secondary">Back to Premises List</a>
            <div class="modal fade" id="staticBackdrop" data-bs-keyboard="true" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="staticBackdropLabel">Confirm</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            Are you sure you want to delete this premises?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Delete</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
