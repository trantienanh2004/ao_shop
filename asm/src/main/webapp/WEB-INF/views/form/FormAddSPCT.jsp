<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thông tin sản phẩm chi tiết</title>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<div class="container mt-5">
    <h2>Thông tin sản phẩm chi tiết</h2>
    <form:form action="/San-Pham/addSPCT" method="post" modelAttribute="sanPhamChiTiet">

        <div class="mb-3">
            <label for="maspct" class="form-label">Mã sản phẩm chi tiết</label>
            <form:input path="maspct" type="text" class="form-control" id="maspct"/>
            <div style="color: red"><form:errors path="maspct" /></div>
        </div>
        <div class="mb-3">
            <label for="idkichthuoc" class="form-label">Kích thước</label>
            <form:select path="idkichthuoc" class="form-select" id="idkichthuoc">
                <c:forEach var="kt" items="${kichthuoc}">
                    <option value="${kt.id}">${kt.ten}</option>
                </c:forEach>
            </form:select>
        </div>
        <div class="mb-3">
            <label for="id" class="form-label">ID sản phẩm</label>
            <form:input path="idsanpham" type="number"  class="form-control" value="${id}" id="id" readonly="true" />
            <div style="color: red"><form:errors path="idsanpham" /></div>
        </div>
        <div class="mb-3">
            <label for="idmausac" class="form-label">Màu sắc</label>
            <form:select path="idmausac" class="form-select" id="idmausac">
                <c:forEach var="ms" items="${mausac}">
                    <option value="${ms.id}">${ms.ten}</option>
                </c:forEach>
            </form:select>
        </div>
        <div class="mb-3">
            <label for="soluong" class="form-label">Số lượng</label>
            <form:input path="soluong" type="number" class="form-control" id="soluong"/>
            <div style="color: red"><form:errors path="soluong" /></div>
        </div>
        <div class="mb-3">
            <label for="dongia" class="form-label">Đơn giá</label>
            <form:input path="dongia" type="number" class="form-control" id="dongia"/>
            <div style="color: red"><form:errors path="dongia" /></div>
        </div>
        <div class="mb-3">
            <label for="trangthai" class="form-label">Trạng thái</label>
            <form:select path="trangthai" class="form-select" id="trangthai">
                <form:option value="true">Hoạt động</form:option>
                <form:option value="false">Ngừng hoạt động</form:option>
            </form:select>
        </div>
        <button type="submit" class="btn btn-primary">Lưu</button>
    </form:form>
</div>
</body>
</html>
