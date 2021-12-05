<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 12/5/2021
  Time: 10:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="bootstrap4/css/bootstrap.css">
</head>
<body>
<center>
    <h1>User List Detail</h1>
    <h2>
        <a class="btn btn-primary" href="/users?action=users" role="button">List All Users</a>
    </h2>
</center>
<caption><h2>List of Users</h2></caption>
<table class="table table-striped">
    <thead>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Country</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="user" items="${listUser}">
        <tr>
            <td><c:out value="${user.getId()}"/></td>
            <td><c:out value="${user.getName()}"/></td>
            <td><c:out value="${user.getEmail()}"/></td>
            <td><c:out value="${user.getCountry()}"/></td>
            <td>
                <a  class="btn btn-primary" href="/users?action=edit&id=${user.id}" role="button">Edit</a>
                <a onclick="onDelete('${user.id}','${user.name}')" class="btn btn-danger"
                   role="button" data-toggle="modal" data-target="#modelId">Delete</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<div class="modal fade" id="modelId" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Confirm</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="/users">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="id" value="" id="idProductDel">
                <div class="modal-body">
                    <div class="container-fluid">
                        Bạn có muốn xóa <input style="border: none;outline: none;color: blue"
                                               id="nameProductDel">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-success">Ok</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    function onDelete(id, name) {
        document.getElementById("idProductDel").value = id;
        document.getElementById("nameProductDel").value = name;
    }
</script>
<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="jquery/popper.min.js"></script>
<script src="bootstrap4/js/bootstrap.js"></script>

</body>
</html>
