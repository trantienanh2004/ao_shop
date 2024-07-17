<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<H1 class="text-center mt-5">Sản Phẩm Chi Tiết</H1>

<div>tên nhân viên :<p>${checkten.nhanvien.ten}</p></div>
<div>tên khách hàng:<p>${checkten.khachHang.ten}</p></div>

<table class="table mt-5">
    <thead>
    <tr>
        <th scope="col">#</th>
        <th scope="col">id sản phẩm chi tiết</th>
        <th scope="col">id hóa đơn</th>
        <th scope="col">tên sản phẩm</th>
        <th scope="col">số lượng tên sản phẩm</th>
        <th scope="col">đơn giá</th>
        <th scope="col">trạng thái </th>

    </tr>
    </thead>
    <tbody>
    <c:forEach var="hdct" varStatus="i" items="${listhdct}" >
        <tr>
            <th scope="row">${i.index}</th>
            <td>${hdct.id}</td>
            <td>${hdct.hoaDon.id}</td>
            <td>${hdct.idsanPhamct.idsanpham.ten}</td>
            <td>${hdct.soluong}</td>
            <td>
                <fmt:formatNumber value="${hdct.dongia}" type="number" pattern="#,###"/> vnđ
            </td>
            <td>${hdct.trangthai ? "còn hàng" : "hết hàng"}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>