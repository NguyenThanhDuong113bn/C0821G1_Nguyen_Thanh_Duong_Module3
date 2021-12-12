<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>List Mặt Bằng</title>
    <%--    <link rel="stylesheet" href="style_list.css">--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <style>
        * {
            box-sizing: border-box;
        }

        table, th, td {
            text-align: center;
            border: 1px solid #868585;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table tr:nth-child(odd) {
            background-color: #eee;
        }

        table tr:nth-child(even) {
            background-color: white;
        }

        table tr:nth-child(1) {
            background-color: skyblue;
        }


        body {
            font-family: Arial, serif;
            margin: 0;
            padding: 0;
        }

        .body {
            margin-bottom: 10px;
        }

        .footer {
            padding: 10px;
            color: white;
            background-color: deepskyblue;
            height: 60px;
            margin-bottom: 10px;
        }

        a {
            color: black;
        }

        a:hover {
            color: red;
        }

        .center {
            text-align: center;
        }

        .left {
            text-align: left;
        }

        .right {
            text-align: right;
        }

        .menu, .header {
            padding: 10px;
            color: white;
            background-color: deepskyblue;
            margin-bottom: 10px;
        }

        .summit {
            background-color: #20c997;
            color: white;
        }


    </style>
</head>
<body>

<div class="container-fluid">
    <div class="row header">
        <div class="col-lg-4 left">
            <h4>List Mặt bằng</h4>
        </div>
        <div class="col-lg-4 center">
            <h3 style="color: red"><c:out value="${messenger}"/></h3>
        </div>
        <div class="col-lg-4 right">
            <h4>
                Welcome, <%=request.getSession().getAttribute("usernameSession")%>
            </h4>
        </div>

    </div>
</div>


<div class="container-fluid">
    <div class="row menu">
        <div class="col-lg-2 page-item">
            <a href="/tcomplex_servlet?choose=create">
                <button class="summit">Create mặt bằng</button>
            </a>
        </div>
        <div class="col-lg-2 ">
            <form method="post" action="/tcomplex_servlet">
                <table>
                    <input type="hidden" name="choose" value="search">
                    <tr>
                        <td>loaiMatBang</td>
                        <td>
                            <select name="loaiMatBang">
                                <option value="Văn phòng chia sẻ">Văn phòng chia sẻ</option>
                                <option value="Văn phòng trọn gói">Văn phòng trọn gói</option>
                            </select>
                        </td>
                    </tr>
                    <td>soTang </td>
                    <td>
                        <select name="soTang" >
                            <option value="1">Tầng 1</option>
                            <option value="2">Tầng 2</option>
                            <option value="3">Tầng 3</option>
                            <option value="4">Tầng 4</option>
                            <option value="5">Tầng 5</option>
                            <option value="6">Tầng 6</option>
                            <option value="7">Tầng 7</option>
                            <option value="8">Tầng 8</option>
                            <option value="9">Tầng 9</option>
                            <option value="10">Tầng 10</option>
                            <option value="11">Tầng 11</option>
                            <option value="12">Tầng 12</option>
                            <option value="13">Tầng 13</option>
                            <option value="14">Tầng 14</option>
                            <option value="15">Tầng 15</option>
                        </select>
                    </td>
                    <input type="text" name="giaThue">
                    <button class="summit">Search</button>
                </table>
            </form>
        </div>
        <div class="col-lg-2 page-item">
        </div>
        <div class="col-lg-2 page-item">
        </div>
        <div class="col-lg-2 page-item">
        </div>
        <div class="col-lg-2 page-item">
        </div>
    </div>
</div>
<div class="container-fluid body">
    <div class="row">
        <div class="col-12">
            <table>
                <tr>
                    <th>maMatBang</th>
                    <th>trangThai</th>
                    <th>dienTich</th>
                    <th>soTang</th>
                    <th>loaiMatBang</th>
                    <th>giaThue</th>
                    <th>ngayBatDau</th>
                    <th>ngayKetThuc</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
                <c:forEach var="matBang" items="${matBangList}">
                    <tr>
                        <td><c:out value="${matBang.maMatBang}"/></td>
                        <td><c:out value="${matBang.trangThai}"/></td>
                        <td><c:out value="${matBang.dienTich}"/></td>
                        <td><c:out value="${matBang.soTang}"/></td>
                        <td><c:out value="${matBang.loaiMatBang}"/></td>
                        <td><c:out value="${matBang.giaThue}"/></td>
                        <td><c:out value="${matBang.ngayBatDau}"/></td>
                        <td><c:out value="${matBang.ngayKetThuc}"/></td>


                        <td><a href="/customer_servlet?choose=edit&customerCode=${matBang.maMatBang}">edit</a></td>

                        <td>
                            <form action="/tcomplex_servlet" method="post">
                                <input type="hidden" name="choose" value="delete">
                                <input type="hidden" name="maMatBang" value="${matBang.maMatBang}">
                                <input type="submit" value="delete"
                                       onclick="return confirm('Are you sure you want to delete this <c:out
                                               value="${matBang.maMatBang}"/>?')" class="summit">
                            </form>
                        </td>

                    </tr>
                </c:forEach>
            </table>
        </div>

    </div>
</div>

<div class="container-fluid">
    <div class="row footer">
        <div class="col-12">
            <p>&copy; Bản quyền thuộc Mr.Duy C0821G1</p>
        </div>
    </div>
</div>


</body>
</html>

