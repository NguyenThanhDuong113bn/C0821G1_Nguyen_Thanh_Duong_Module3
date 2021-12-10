<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 12/7/2021
  Time: 9:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="/assert/bootstrap413/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assert/datatables/css/dataTables.bootstrap4.min.css">
</head>
<body>

<h2>
    <a href="/customers">Back to list</a>
</h2>
<table class="table table-striped">
    <thead>
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Birthday</th>
        <th>Gender</th>
        <th>Id card</th>
        <th>Phone</th>
        <th>Email</th>
        <th>Address</th>
        <th>Customer type</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${requestScope['customerList']}" var="customer">
        <tr>
            <td>${customer.id}</td>
            <td>${customer.name}</td>
            <td>${customer.birthday}</td>
            <td>
                <c:choose>
                    <c:when test="${customer.gender == 1}">Nam</c:when>
                    <c:when test="${customer.gender == 2}">Nữ</c:when>
                    <c:otherwise>LGBT</c:otherwise>
                </c:choose>
            </td>
            <td>${customer.idCard}</td>
            <td>${customer.phone}</td>
            <td>${customer.email}</td>
            <td>${customer.address}</td>
            <td>
                <c:choose>
                    <c:when test="${customer.customerTypeId == 1}">Diamond</c:when>
                    <c:when test="${customer.customerTypeId == 2}">Platinium</c:when>
                    <c:when test="${customer.customerTypeId == 3}">Gold</c:when>
                    <c:when test="${customer.customerTypeId == 4}">Silver</c:when>
                    <c:when test="${customer.customerTypeId == 5}">Member</c:when>
                </c:choose>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>


<script src="/assert/jquery/jquery-3.5.1.min.js"></script>
<script src="/assert/bootstrap413/js/popper.min.js"></script>
<script src="/assert/datatables/js/jquery.dataTables.min.js"></script>
<script src="/assert/datatables/js/dataTables.bootstrap4.min.js"></script>
<script src="/assert/bootstrap413/js/bootstrap.min.js"></script>
<script src="/assert/bootstrap413/js/bootstrap.bundle.js"></script>
</body>
</html>