<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 12/7/2021
  Time: 9:24 AM
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

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-uWxY/CJNBR+1zjPWmfnSnVxwRheevXITnMqoEIeG1LJrdI0GlVs/9cVSyPYXdcSF" crossorigin="anonymous">

    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
          integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>

</head>
<body>
<h4>
    <a href="/">Trang chủ</a>
</h4>
<div class="row">
    <div class="col-8">
        <h1>Customer Management</h1>
    </div>
</div>
<h4>
    <a href="/customers?action=create_customer">Create Customer</a>
</h4>
<h4>
    <a href="/">Home</a>
</h4>
<h4>
    <p>Search Customer</p>

    <form><input type="text" id="find_id" name="id">
        <input type="hidden" name="action" value="search">
        <input type="submit" value="search">
    </form>
</h4>
<c:if test="${message!=null}"><p>${message}</p></c:if>
<div align="center">
    <table id="customer" border="1" cellpadding="5">
        <caption><h2>List of Customer</h2></caption>
        <thead>
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Birthday</th>
            <th>Gender</th>
            <th>IdCard</th>
            <th>Phone</th>
            <th>Email</th>
            <th>Address</th>
            <th>Customer type</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="customer" items="${listCustomer}">
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
                        <c:when test="${customer.customer_type_id == 1}">Diamond</c:when>
                        <c:when test="${customer.customer_type_id == 2}">Platinium</c:when>
                        <c:when test="${customer.customer_type_id == 3}">Gold</c:when>
                        <c:when test="${customer.customer_type_id == 4}">Silver</c:when>
                        <c:when test="${customer.customer_type_id == 5}">Member</c:when>
                    </c:choose>
                </td>
                <td>
                    <a href="/customers?action=edit&id=${customer.id}">Edit</a>

                </td>
                <td>
                    <button onclick="setValueFormDelete('${customer.id}')" class="btn btn-danger" data-toggle="modal"
                            data-target="#modalDelete">Delete
                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<!-- Modal delete-->
<div class="modal fade" id="modalDelete" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="formDelete">
                    <input type="text" name="idCustomer" value="" id="idCustomer">
                    <input type="hidden" name="action" value="delete">
                </form>
                Bạn có chắc muốn xoá sản phẩm <span class="text-danger" id="nameProduct"></span> ?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                <button type="button" class="btn btn-danger" onclick="submitForm()">Xoá</button>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kQtW33rZJAHjgefvhyyzcGF3C5TFyBQBA13V1RKPf4uH+bwyzQxZ6CmMZHmNBEfJ"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
        integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.min.js"
        integrity="sha384-PsUw7Xwds7x08Ew3exXhqzbhuEYmA2xnwc8BuD6SEr+UmEHlX8/MCltYEodzWA4u"
        crossorigin="anonymous"></script>
<script src="/assert/jquery/jquery-3.5.1.min.js"></script>
<script src="/assert/bootstrap413/js/popper.min.js"></script>
<script src="/assert/datatables/js/jquery.dataTables.min.js"></script>
<script src="/assert/datatables/js/dataTables.bootstrap4.min.js"></script>
<script src="/assert/bootstrap413/js/bootstrap.min.js"></script>
<script src="/assert/bootstrap413/js/bootstrap.bundle.js"></script>

<script>
    $(document).ready(function () {
        $('#customer').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 2
        })
    })
</script>
<script>
    function setValueFormDelete(id) {
        document.getElementById("idCustomer").value = id;
    }
    function submitForm() {
        document.getElementById("formDelete").submit();
    }
</script>

</body>
</html>