<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<div>
    <div class="text-center mt-3"> <h5>SPCT</h5></div>
    <div > ${loi}</div>
    <div style="color: red">${tb}</div>
    <div class="ml-auto"><a href="/San-Pham/quaylai" class="btn btn-success ">quay về</a></div>
    <div class="ml-auto"><a href="/San-Pham/addSPCT?id=${id}" class="btn btn-success ">ADD</a></div>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">stt</th>
            <th scope="col">id</th>
            <th scope="col">mã SPCT</th>
            <th scope="col">kích thước</th>
            <th scope="col">màu sắc</th>
            <th scope="col">sản phẩm</th>
            <th scope="col">số lượng</th>
            <th scope="col">đơn giá</th>
            <th scope="col">trạng thái</th>
            <th scope="col">chức năng</th>
        </tr>
        </thead>
        <tbody>


        <c:forEach var="list" items="${spct}" varStatus="i" >
            <c:if test="${list.idsanpham.id == id}">
            <tr>
                <td>${i.index}</td>
                <td>${list.id}</td>
                <td>${list.maspct}</td>
                <td>${list.idkichthuoc.ten}</td>
                <td>${list.idmausac.ten}</td>
                <td>${list.idsanpham.ten}</td>
                <td>${list.soluong}</td>
                <td>${list.dongia}</td>
                <td>${list.trangthai ? "hoạt động":"ngưng hoạt động"}</td>
                <td><a href="/San-Pham/updateSPCT?id=${list.id}" class="btn btn-info ">sửa</a>
                    <a href="/San-Pham/xoaSPCT?id=${list.id}" class="btn btn-info ">xóa</a></td>
            </tr>
        </c:if>
        </c:forEach>
        <nav aria-label="...">
            <ul class="pagination">
                <li class="page-item disabled">
                    <span class="page-link">Previous</span>
                </li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item active" aria-current="page">
                    <span class="page-link">2</span>
                </li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item">
                    <a class="page-link" href="#">Next</a>
                </li>
            </ul>
        </nav>
        </tbody>
    </table>
</div>
</body>
</html>