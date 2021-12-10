<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 12/9/2021
  Time: 11:21 AM
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
<p class="text-center">
    <c:if test='${requestScope["message"] != null}'>
        <span class="message  text-success">${requestScope["message"]}</span>
    </c:if>
</p>
<h1 ><a href="/service?action=service"> list customer </a></h1>
<div align="center">
    <form action="/service?action=create_service" method="post">

        <table border="1" cellpadding="5">
            <tr>
                <th>service name :</th>
                <td>
                    <input type="text" name="service_name" id="service_name" size="45"/>
                </td>
            </tr>
            <tr>
                <th>service area :</th>
                <td>
                    <input type="text" name="service_area" id="service_area" size="45"/>
                </td>
            </tr>
            <tr>
                <th>service cost :</th>
                <td>
                    <input type="text" name="service_cost" id="service_cost" size="45"/>
                </td>
            </tr>
            <tr>
                <th>service max people :</th>
                <td>
                    <input type="text" name="service_max_people" id="service_max_people" size="45"/>
                </td>
            </tr>

            <tr>
                <th>Rent Type:</th>
                <td>
                    <select class="form-select" name="rent_type_id" aria-label="Default select example">
                        <option selected>Choose type of rent</option>
                        <c:forEach var="type" items="${rentTypeList}">
                            <option value="${type.rent_type_id}">${type.rent_type_name}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <th>Customer Type:</th>
                <td>
                    <select class="form-select" name="service_type_id" aria-label="Default select example">
                        <option selected>Choose type of service</option>
                        <c:forEach var="type" items="${serviceTypeList}">
                            <option value="${type.service_type_id}">${type.service_type_name}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <th>standard room :</th>
                <td>
                    <input type="text" name="standard_room" id="standard_room" size="45"/>
                </td>
            </tr>
            <tr>
                <th>description :</th>
                <td>
                    <input type="text" name="description" id="description" size="45"/>
                </td>
            </tr>
            <tr>
                <th>pool area :</th>
                <td>
                    <input type="text" name="pool_area" id="pool_area" size="45"/>
                </td>
            </tr>
            <tr>
                <th>number of floors :</th>
                <td>
                    <input type="text" name="number_of_floors" id="number_of_floors" size="45"/>
                </td>
            </tr>

            <tr>
                <td colspan="2" align="center">
                    <input class="bg-success" type="submit" name="action" value="Create"/>
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
