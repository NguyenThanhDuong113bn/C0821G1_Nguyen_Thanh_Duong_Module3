

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>List Mat Bang</title>
</head>
<body>
<div>
    <h2 style="text-align: center">List Mat Bang</h2>
</div>
<center>

<div>
    <a href="/matbang?choose=create">
        <button class="summit">Create mặt bằng</button>
    </a>
</div>
<div >
    <form method="post" action="/matbang">
        <table>
            <input type="hidden" name="choose" value="search">
            <tr>
                <td>loaiMatBang</td>
                <td>
                    <select name="loaiMatBang">
                        <option value="Van phong chia se">Văn phòng chia sẻ</option>
                        <option value="Van phong tron goi">Văn phòng trọn gói</option>
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
</center>
<center>
<table border="1">
    <tr>
        <th>maMatBang</th>
        <th>trangThai</th>
        <th>dienTich</th>
        <th>soTang</th>
        <th>loaiMatBang</th>
        <th>giaThue</th>
        <th>ngayBatDau</th>
        <th>ngayKetThuc</th>

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




            <td>
                <form action="/matbang" method="post">
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
</center>

</body>
</html>