<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Đăng Nhập</title>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body ng-app="myApp">
<%--<h1>Trang chủ </h1><br>${list.id} <br>${list.ten}<br> ${list.manv}<br> ${list.trangthai ? "admin" : "nhân viên"}--%>
<div class="container-fluid">

    <div class="col-3 bg-dark position-fixed top-0 start-0" style="height: 100vh;">

        <div class="">
            <img src="https://th.bing.com/th/id/OIP.kzhzqZad6mq_AhaTmJaIOQHaEo?pid=ImgDet&w=474&h=296&rs=1" style="width: 313px;height: 200px;" alt="">
        </div>
        <div class="list-group mt-4">
            <a href="/San-Pham/SanPham" class="list-group-item">
                Quản lý sản phẩm
            </a>
            <a href="/San-Pham/HoaDon" class="list-group-item ">
                Quản lý hóa đơn
            </a>
            <a href="/San-Pham/ThuocTinh" class="list-group-item ">
                Quản lý thuộc tính
            </a>
            <a href="/San-Pham/NhanVien" class="list-group-item ">
                Quản lý Nhân Viên
            </a>
            <a href="/San-Pham/login" class="list-group-item ">
                đăng xuất
            </a>
        </div>
    </div>
</div>
<div class="col-9 offset-3 p-0 position-relative">
    <div class="bg-Light ps-4 pt-4" style="height: 80px; width: 100%; border-bottom: black 1px;">
        <div class="mb-5">
            <nav class="navbar navbar-expand-lg navbar-light bg-Primary">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#">Dashboard</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarText">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link " aria-current="page" href="#">user</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Settings</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">pages</a>
                            </li>
                        </ul>
                        <span class="navbar-text">

          <a href="#!" class="navbar-brand" style="justify-content: center;display: flex;align-items: center;">${list.ten} <img src="https://th.bing.com/th/id/R.b9e825b0ac409160fee016ff9dce3a22?rik=zkZ5PPCscELfmQ&pid=ImgRaw&r=0" alt="" style="width: 30px;height: 30px; border-radius: 50%;"></a>

            </span>
                    </div>
                </div>
            </nav>
        </div>
    </div>
    <div>
        <div>
            <a href="/San-Pham/hdctForm">HDCT</a>
            <div class="ml-auto"><a href="/San-Pham/khachhang?id=${list.id}" class="btn btn-info ">khách hàng</a></div>
            <div class="text-center mt-3"> <h5>Hóa Đơn</h5></div>
            <div class="ml-auto"><a href="/San-Pham/addHD" class="btn btn-success ">tạo hóa đơn</a></div>
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">stt</th>
                    <th scope="col">id</th>
                    <th scope="col">id nhân viên</th>
                    <th scope="col">id khách hàng</th>
                    <th scope="col">ngaymua </th>
                    <th scope="col">trạng thái </th>
                    <th scope="col">chức năng</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="list" items="${hd}" varStatus="i" >
                    <c:if test="${list.trangthai == false}">
                    <tr>
                        <td>${i.index}</td>
                        <td>${list.id}</td>
                        <td>${list.nhanvien.ten}</td>
                        <td>${list.khachHang.ten}</td>
                        <td>${list.ngaymuahang}</td>
                        <td>${list.trangthai ? "đã thanh toán":"chưa thanh toán"}</td>
                        <td><a href="/San-Pham/SuaHD?id=${list.id}" class="btn btn-info ">sửa</a>
                            <a href="/San-Pham/XoaHDtamthoi?id=${list.id}" class="btn btn-info ">hủy</a>
                            <a href="/San-Pham/showformHD?id=${list.id}" class="btn btn-info ">trọn</a></td>
                    </tr>
                    </c:if>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="container">
            <h1 class="mt-5"> hóa đơn </h1>
            <form action="/San-Pham/thanhtoan" method="POST">
                <div class="form-group">
                    <label for="HoaDon">Mã HD:</label>
                    <input type="text" class="form-control" id="HoaDon" name="HoaDon" value="${listformhd.id}" required>
                </div>
                <div class="form-group">
                    <label for="soLuong">Số Lượng:</label>
                    <input type="number" class="form-control" id="soLuong" name="soluong" value="${soluong}" required>
                </div>
                <div class="form-group">
                    <label for="donGia">Đơn Giá:</label>
                    <input type="number" class="form-control" id="donGia" name="donGia" value="${donGia}" step="0.01" required>
                </div>
                <button type="submit" class="btn btn-primary">thanh toán</button>
            </form>
        </div>
<%--        //////////////////////////////--%>
        <h5>giỏ hàng</h5>
        <table class="table">
            <thead>
            <tr>
                <th scope="col">stt</th>
                <th scope="col">id</th>
                <th scope="col">mã SPCT</th>
                <th scope="col">mã Kích thước</th>
                <th scope="col">mã màu</th>
                <th scope="col">mã sản phẩm</th>
                <th scope="col">số lượng</th>
                <th scope="col">đơn giá</th>
                <th scope="col">chức năng</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="list" items="${gio}" varStatus="i" >

                <tr>
                    <td>${i.index}</td>
                    <td>${list.id}</td>
                    <td>${list.maspct}</td>
                    <td>${list.idkichthuoc.ten}</td>
                    <td>${list.idmausac.ten}</td>
                    <td>${list.idsanpham.ten}</td>
                    <td>${list.soluong}</td>
                    <td>${list.dongia}</td>
                    <td><a href="/San-Pham/SuaHD?id=${list.id}" class="btn btn-info ">sửa</a>
                        <a href="/San-Pham/xoaSPCT?id=${list.id}" class="btn btn-info ">xóa</a></td>
                </tr>

            </c:forEach>

            </tbody>
        </table>
    </div>
    <div class="container mt-5">
<%--        <h2>Chi Tiết Hóa Đơn</h2>--%>
<%--        <form:form action="/chi-tiet-hoa-don/save" method="post" modelAttribute="chiTietHoaDon">--%>
<%--            <div class="mb-3">--%>
<%--                <label for="ID" class="form-label">ID</label>--%>
<%--                <form:input path="id" type="text" class="form-control" id="id" readonly="true"/>--%>
<%--                <div style="color: red"><form:errors path="id"/></div>--%>
<%--            </div>--%>
<%--            <div class="mb-3">--%>
<%--                <label for="IDHoaDon" class="form-label">ID Hóa Đơn</label>--%>
<%--                <form:input path="idhoadon" type="text" class="form-control" id="idhoadon"/>--%>
<%--                <div style="color: red"><form:errors path="idhoadon"/></div>--%>
<%--            </div>--%>
<%--            <div class="mb-3">--%>
<%--                <label for="idhoadon" class="form-label">ID Sản Phẩm Chi Tiết</label>--%>
<%--                <form:input path="idsanpham" type="text" class="form-control" id="idsanpham"/>--%>
<%--                <div style="color: red"><form:errors path="idsanpham"/></div>--%>
<%--            </div>--%>
<%--            <div class="mb-3">--%>
<%--                <label for="SoLuong" class="form-label">Số Lượng</label>--%>
<%--                <form:input path="soluong" type="number" class="form-control" id="soluong"/>--%>
<%--                <div style="color: red"><form:errors path="soluong"/></div>--%>
<%--            </div>--%>
<%--            <div class="mb-3">--%>
<%--                <label for="DonGia" class="form-label">Đơn Giá</label>--%>
<%--                <form:input path="dongia" type="number" step="0.01" class="form-control" id="dongia"/>--%>
<%--                <div style="color: red"><form:errors path="dongia"/></div>--%>
<%--            </div>--%>
<%--            <div class="mb-3">--%>
<%--                <label for="TrangThai" class="form-label">Trạng Thái</label>--%>
<%--                <form:input path="trangthai" type="text" class="form-control" id="trangthai"/>--%>
<%--                <div style="color: red"><form:errors path="trangthai"/></div>--%>
<%--            </div>--%>
<%--            <button type="submit" class="btn btn-primary">Lưu</button>--%>
<%--        </form:form>--%>
<%--    </div>--%>
<%--        ////////////////////////////--%>
        <div class="text-center mt-3"> <h5>sản phẩm </h5>
        <table class="table">
            <thead>
            <tr>
                <th scope="col">stt</th>
                <th scope="col">id</th>
                <th scope="col">mã SPCT</th>
                <th scope="col">mã Kích thước</th>
                <th scope="col">mã màu</th>
                <th scope="col">mã sản phẩm</th>
                <th scope="col">số lượng</th>
                <th scope="col">đơn giá</th>
                <th scope="col">chức năng</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="list" items="${spct}" varStatus="i" >

                    <tr>
                        <td>${i.index}</td>
                        <td>${list.id}</td>
                        <td>${list.maspct}</td>
                        <td>${list.idkichthuoc.ten}</td>
                        <td>${list.idmausac.ten}</td>
                        <td>${list.idsanpham.ten}</td>
                        <td>${list.soluong}</td>
                        <td>${list.dongia}</td>
                        <td><a href="/San-Pham/tronSPCT?id=${list.id}" class="btn btn-info ">trọn</a></td>
                    </tr>

            </c:forEach>
            </tbody>
        </table>
    </div>

    </div>
    <div class="bg-warning ps-4 pt-3 position-absolute end-0" style="height: 60px; width: 100%;">
        <h5 class="text-light">
            chức vụ : <input type="text" style="border: none" value="${list.trangthai ? "admin" : "nhân viên"}" name="chucvu" readonly>
        </h5>
    </div>
</div>


</body>

</html>
