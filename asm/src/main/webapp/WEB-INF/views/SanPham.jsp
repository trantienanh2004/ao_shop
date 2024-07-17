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
    <div >
        <div>
            <div class="text-center mt-3"> <h5>Sản Phẩm</h5></div>
            <div class="ml-auto"><a href="/San-Pham/formSanPham" class="btn btn-success ">ADD</a></div>
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">stt</th>
                    <th scope="col">id</th>
                    <th scope="col">mã</th>
                    <th scope="col">tên</th>
                    <th scope="col">trạng thái</th>
                    <th scope="col">chức năng</th>
                </tr>
                </thead>
                <tbody>


                <c:forEach var="list" items="${sp.content}" varStatus="i" >
                    <tr>
                        <td>${i.index}</td>
                        <td>${list.id}</td>
                        <td>${list.ma}</td>
                        <td>${list.ten}</td>
                        <td>${list.trangthai ? "hoạt động":"không hoạt động"}</td>
                        <td><a href="/San-Pham/formupdateSP?id=${list.id}" class="btn btn-info ">sửa</a>
                            <a href="/San-Pham/tableSPCT?id=${list.id}" class="btn btn-info ">SPCT</a></td>
                    </tr>
                </c:forEach>
                <nav aria-label="Page navigation">
                    <ul class="pagination ">
                        <li class="page-item">
                            <a class="page-link" href="/San-Pham/SanPham">về đầu</a>
                        </li>
                        <li class="page-item disabled">
                            <a class="page-link" href="#" tabindex="-1" aria-disabled="true">...</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="/San-Pham/SanPham?x=${sp.first ? 0 : sp.number - 1}">"<<<"</a>
                        </li>
                        <li class="page-item">
                        <li class="page-item">
                            <a class="page-link text-dark disabled" href="#">${sp.number + 1}</a>
                        </li>

                        </li>
                        <li class="page-item">
                            <a class="page-link" href="/San-Pham/SanPham?x=${sp.last ? sp.totalPages - 1 : sp.number + 1}">">>>"</a>
                        </li>
                        <li class="page-item disabled">
                            <a class="page-link" href="#" tabindex="-1" aria-disabled="true">...</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="/San-Pham/SanPham?x=${sp.totalPages - 1}">${sp.totalPages}</a>
                        </li>
                    </ul>
                </nav>

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

<%--<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>--%>
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/angular-route/1.8.3/angular-route.min.js"--%>
<%--        integrity="sha512-y1qD3hz/IAf8W4+/UMLZ+CN6LIoUGi7srWJ3r1R17Hid8x0yXe+1B5ZelkaL1Mjzedzu0Cg3HBvDG02SAgSzBw=="--%>
<%--        crossorigin="anonymous" referrerpolicy="no-referrer"></script>--%>
<%--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"--%>
<%--        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"--%>
<%--        crossorigin="anonymous"></script>--%>
<%--<script>var app = angular.module("myApp", ["ngRoute"]);--%>
<%--app.config(function ($routeProvider) {--%>
<%--    $routeProvider--%>
<%--        .when("/trangchu", {--%>
<%--            templateUrl: "/San-Pham/trangchu"--%>
<%--        })--%>

<%--        .otherwise({--%>
<%--            template: "<h1>lỗi 404</h1><p>không tồn tại</p>"--%>
<%--        });--%>
<%--});</script>--%>

</html>
