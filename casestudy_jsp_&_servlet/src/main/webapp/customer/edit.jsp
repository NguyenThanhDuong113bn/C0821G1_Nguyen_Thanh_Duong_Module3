<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 12/7/2021
  Time: 9:22 AM
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

<h1 ><a href="/customers?action=customer"> list customer </a></h1>
<div align="center">
    <form action="/customers?action=edit" method="post">

        <table border="1" cellpadding="5">
            <tr>

                <td>
                    <input type="hidden" name="id"  size="45" value="${customer.id}"/>
                </td>
            </tr>

            <tr>
                <th>Customer Name:</th>
                <td>
                    <input type="text" name="name" id="name" size="45" value="${customer.name}"/>
                </td>
            </tr>
            <tr>
                <th>Customer Birthday:</th>
                <td>
                    <input type="date" name="birthday" id="birthday" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Gender:</th>
                <td>
                    <input type="radio" name="gender" value="0" size="15"/>Female
                    <input type="radio" name="gender" value="1" size="15"/>Male
                    <input type="radio" name="gender" value="2" size="15"/>LGBT
                </td>
            </tr>
            <tr>
                <th>Customer ID Card:</th>
                <td>
                    <input type="text" name="idCard" id="idCard" size="45" value="${customer.idCard}"/>
                </td>
            </tr>
            <tr>
                <th>Customer Number Phone:</th>
                <td>
                    <input type="text" name="phone" id="phone" size="45" value="${customer.phone}" />
                </td>
            </tr>
            <tr>
                <th>Customer Email:</th>
                <td>
                    <input type="text" name="email" id="email" size="45" value="${customer.email}"/>
                </td>
            </tr>
            <tr>
                <th>Customer Address:</th>
                <td>
                    <input type="text" name="address" id="address" size="45" value="${customer.address}"/>
                </td>
            </tr>
            <tr>
                <th>Customer Type:</th>
                <td>
                    <select class="form-select" name="customer_type_id" aria-label="Default select example">
                        <option selected>Choose type of customer</option>
                        <c:forEach var="type" items="${customerTypeList}">
                            <option value="${type.customer_type_id}">${type.customer_type_name}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input class="bg-success" type="submit" name="action" value="edit"/>
                </td>
            </tr>



        </table>

    </form>
</div>

<script src="/assert/jquery/jquery-3.5.1.min.js"></script>
<script src="/assert/bootstrap413/js/popper.min.js"></script>
<script src="/assert/datatables/js/jquery.dataTables.min.js"></script>
<script src="/assert/datatables/js/dataTables.bootstrap4.min.js"></script>
<script src="/assert/bootstrap413/js/bootstrap.min.js"></script>
<script src="/assert/bootstrap413/js/bootstrap.bundle.js"></script>
</body>
</html>