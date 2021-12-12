<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create new Mặt bằng</title>
    <style>

    </style>
</head>
<body>
<h1>Create new product</h1>
<h3 style="color: red"><c:out value="${messenger}"/></h3>
<form action="/tcomplex_servlet" method="post">
    <input type="hidden" name="choose" value="create">
    <fieldset>
        <legend>product information</legend>
        <table>
            <tr>
                <td>maMatBang </td>
                <td><input type="text" name="maMatBang" ></td>
            </tr>
            <tr>
                <td>trangThai </td>
                <td>
                    <select name="trangThai" >
                        <option value="Trống">Trống</option>
                        <option value="Hạ tầng">Hạ tầng</option>
                        <option value="Đầy đủ">Đầy đủ</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>dienTich</td>
                <td><input type="text" name="dienTich" ></td>
            </tr>
            <tr>
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
            </tr>
            <tr>
                <td>loaiMatBang</td>
                <td>
                    <select name="loaiMatBang" >
                        <option value="Văn phòng chia sẻ">Văn phòng chia sẻ</option>
                        <option value="Văn phòng trọn gói">Văn phòng trọn gói</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>giaThue: </td>
                <td><input type="text" name="giaThue" ></td>
            </tr>
            <tr>
                <td>ngayBatDau</td>
                <td><input type="date" name="ngayBatDau"></td>
            </tr>
            <tr>
                <td>ngayKetThuc</td>
                <td><input type="date" name="ngayKetThuc"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Create mặt bằng"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>

