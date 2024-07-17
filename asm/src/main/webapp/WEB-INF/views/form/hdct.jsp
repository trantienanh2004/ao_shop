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
<div class="text-center mt-3"> <h5>sản phẩm </h5>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">stt</th>
            <th scope="col">id</th>
            <th scope="col">tên nhân viên</th>
            <th scope="col">tên khách hàng</th>
            <th scope="col">ngày mua hàng</th>
            <th scope="col">chức năng</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="item" items="${list}" varStatus="i" >
            <c:if test="${item.trangthai == true }" >
            <tr>
                <td>${i.index}</td>
                <td>${item.id}</td>
                <td>${item.nhanvien.ten}</td>
                <td>${item.khachHang.ten}</td>
                <td>${item.ngaymuahang}</td>
                <td>${item.trangthai ? "thanh toán":"chưa thanh toán"}</td>
                <td><a href="/San-Pham/detailSPCT?id=${item.id}" class="btn btn-info ">trọn</a></td>
            </tr>
            </c:if>
        </c:forEach>
        </tbody>
    </table>
</div>
</div>
</body>
</html>