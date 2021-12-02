<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 12/1/2021
  Time: 11:26 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
    <title>User Management Application</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

</head>
<body>
<h1>User Management</h1>
<h3>
    <a href="users?action=users">Back to list all users</a>
</h3>
<h3>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</h3>
<form method="post">
    <legend>User information</legend>
    <div class="row mt-2">
        <div class="col-4">
            <c:if test="${existingUser != null}">
                <div class="row mt-2">
                    <div class="col-4">
                        <label class="col-form-label">Id</label>
                    </div>
                    <div class="col-8">
                        <input type="text" disabled class="form-control" name="id" value="${requestScope["existingUser"].getId()}">
                    </div>
                </div>
            </c:if>
            <div class="row mt-2">
                <div class="col-4">
                    <label class="col-form-label">Name</label>
                </div>
                <div class="col-8">
                    <input type="text" class="form-control" name="name" value="${requestScope["existingUser"].getName()}">
                </div>
            </div>
            <div class="row mt-2">
                <div class="col-4">
                    <label class="col-form-label">Email</label>
                </div>
                <div class="col-8">
                    <input type="text" class="form-control" name="email" value="${requestScope["existingUser"].getEmail()}">
                </div>
            </div>
            <div class="row mt-2">
                <div class="col-4">
                    <label class="col-form-label">Country</label>
                </div>
                <div class="col-8">
                    <input type="text" class="form-control" name="country" value="${requestScope["existingUser"].getCountry()}">
                </div>
            </div>
            <div class="row mt-2">
                <div class="col-4">
                </div>
                <div class="col-6">
                    <!-- Button trigger modal -->
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                        Update user
                    </button>

                    <!-- Modal -->
                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Are you sure to update this user?</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-primary">Yes</button>
                                    <button type="submit" class="btn btn-secondary" data-dismiss="modal">No</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-2">
                </div>
            </div>
        </div>
    </div>
</form>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>

</body>
</html>