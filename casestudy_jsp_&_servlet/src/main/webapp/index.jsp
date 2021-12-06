<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 12/6/2021
  Time: 10:20 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>Furama Resort</title>
  <!-- Required meta tags -->
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="/assert/bootstrap413/css/bootstrap.min.css">
  <link rel="stylesheet" href="/assert/datatables/css/dataTables.bootstrap4.min.css">
</head>
<body>
<div class="row">
  <div class="col-12">
    <nav class="navbar navbar-default">
      <div class="container-fluid">
        <div class="navbar-header">
          <a class="navbar-brand" href="#">
            <img alt="Brand" style="width: 80px; height: 85px;"
                 src="https://cdn.nhanlucnganhluat.vn/uploads/images/051D288B/logo/2018-12/Logo-FURAMA-RESORT.jpg">
            <button style="margin-left: 1000px">Login</button>
          </a>
        </div>
      </div>

    </nav>
  </div>
</div>
<div class="row" style="background-color: #0f574b">
  <div class="col-12">
    <ul class="nav justify-content-center">
      <li class="nav-item">
        <a class="nav-link active" aria-current="page" href="/">Home</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Employee</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/customers?action=customer">Customer</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/service?action=service">Service</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Contract</a>
      </li>
      <li class="nav-item">
        <form class="d-flex">
          <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
          <button class="btn btn-outline-primary" type="submit">Search</button>
        </form>
      </li>
    </ul>
  </div>
</div>

<div class="row">
  <div class="col-3 container-fluid">
    <div class="row">
      <div class="col-12">
        <iframe width="100%" height="280" src="https://www.youtube.com/embed/PgvSSl4jm1U" title="YouTube video player"
                frameborder="0"
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                allowfullscreen></iframe>
      </div>
      <p>Furama Resort Đà Nẵng</p>
    </div>
    <div class="row">
      <div class="col-12">
        <iframe width="100%" height="280" src="https://www.youtube.com/embed/jpe3qx5Y4UE"
                title="YouTube video player" frameborder="0"
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                allowfullscreen></iframe>
      </div>
      <p>Furama Resort Danang Introduction - Japanese Language</p>
    </div>
    <div class="row">
      <div class="col-12">
        <iframe width="100%" height="280" src="https://www.youtube.com/embed/TQhkRndQxAI"
                title="YouTube video player" frameborder="0"
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                allowfullscreen></iframe>
      </div>
    </div>
    <p>Vietnam Folklore Night 2016 - New Year Gala Dinner at Furama Resort Danang</p>

  </div>
  <div class="col-9 container-fluid">
    <div class="row">
      <iframe width="100%" height="400" src="https://www.youtube.com/embed/VzDrgGaXBjY"
              title="YouTube video player" frameborder="0"
              allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
              allowfullscreen></iframe>

      <div class="col-12"><h3>KHU NGHỈ DƯỠNG ĐẲNG CẤP THẾ GIỚI FURAMA ĐÀ NẴNG, TỰ HÀO LÀ KHU NGHỈ DƯỠNG ẨM THỰC
        TẠI VIỆT NAM</h3>
        <p>Hướng ra bãi biển Đà Nẵng trải dài cát trắng, Furama Resort Đà Nẵng là cửa ngõ đến với 3 di sản văn
          hoá thế giới: Hội An (20 phút), Mỹ Sơn (90 phút) và Huế (2 tiếng. 196 phòng hạng sang cùng với 70
          căn biệt thự từ hai đến bốn phòng ngủ có hồ bơi riêng đều được trang trí trang nhã, theo phong cách
          thiết kế truyền thống của Việt Nam và kiến trúc thuộc địa của Pháp, biến Furama thành khu nghỉ dưỡng
          danh giá nhất tại Việt Nam – vinh dự được đón tiếp nhiều người nổi tiếng, giới hoàng gia, chính
          khách, ngôi sao điện ảnh và các nhà lãnh đạo kinh doanh quốc tế.</p>
        <p>Ẩm thực tại khu nghỉ dưỡng là trải nghiệm kết hợp giữa các món ăn Việt Nam, châu Á, Ý và châu Âu cùng
          các món bít tết nhập khẩu hảo hạng. Khu nghỉ dưỡng mang đến cho quý khách những không gian ẩm thực
          đa dạng bao gồm – quầy bar nhìn ra biển, hồ bơi Lagoon được bao quanh bởi khu vườn nhiệt đới, ẩm
          thực truyền thống Ý tại nhà hàng Don Cipriani’s, chất Á Đông tại Café Indochine hay nhà hàng bít tết
          “The Fan – Cái Quạt” nằm ngay trên bãi biển. Khu nghỉ dưỡng Furama Đà Nẵng còn gây ấn tượng và tạo
          nhiều thích thú cho khách thông qua các chương trình vui chơi đầy thú vị như các chuyến du ngoạn,
          thể thao trên nước, lặn biển và chơi golf cũng như các dịch vụ chăm sóc sức khoẻ và sắc đẹp.

          Nằm tại vị trí đắc địa gần trung tâm Đà Nẵng và là nơi kết nối quốc tế thuận tiện đến Singapore,
          Bangkok, Xiêm Riệp, Kuala Lumpur, Đài Loan, Tokyo, Osaka, Busan, Seoul, Tokyo, Osaka và Hồng Kông –
          Ma Cao, Trung Quốc bao gồm: Bắc Kinh, Thượng Hải, Hàng Châu, Quảng Châu, Thành Đô bằng các chuyến
          bay trực tiếp, khu nghỉ dưỡng Furama Đà Nẵng là điểm đến lý tưởng cho các đại lý du lịch, doanh
          nghiệp, công ty tổ chức sự kiện. Cung Hội nghị có thể chứa tới 3000 người, cùng với 10 phòng chức
          năng khác có sức chứa từ 50 đến 300 người. Cung hội nghị Ariyana Convention Centre (ACC) được xây
          dựng để tổ chức sự kiện APEC 2017, kết nối với Cung hội nghị Furama (ICP) tạo thành quần thể MICE
          lớn nhất Việt Nam có sức chứa lên tới 5,000 khách.

          Một loạt các bữa tiệc theo chủ đề trên bãi biển hoặc xung quanh hồ Lagoon, trong phòng đại tiệc hoặc
          bên ngoài khu nghỉ dưỡng, kết hợp các dịch vụ đặc biệt như VIP xuất hiện từ trực thăng đáp xuống bãi
          đáp riêng của khu nghỉ dưỡng; Thêm vào đó là các hoạt động nhóm và thể thao trên nước, “Trung tâm
          lặn” đạt tiêu chuẩn lặn biển quốc tế, 2 sân golf 18 lỗ, cũng như các dịch vụ chăm sóc sức khoẻ và
          sắc đẹp đã khiến Furama Đà Nẵng trở thành địa điểm lý tưởng cho các nhóm MICE.</p>
      </div>
    </div>

  </div>

</div>

<div class="row"  style="background-color: #0f574b">
  <div class="col-12  text-center text-light" >
    COVID 19 UPDATE: The safety and well-being are our utmost priority
  </div>
</div>

<script src="/assert/jquery/jquery-3.5.1.min.js"></script>
<script src="/assert/bootstrap413/js/popper.min.js"></script>
<script src="/assert/datatables/js/jquery.dataTables.min.js"></script>
<script src="/assert/datatables/js/dataTables.bootstrap4.min.js"></script>
<script src="/assert/bootstrap413/js/bootstrap.min.js"></script>
<script src="/assert/bootstrap413/js/bootstrap.bundle.js"></script>
</body>
</html>