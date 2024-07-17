<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>update Hóa Đơn</title>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<div class="container mt-5">
    <h2>Thông tin Hóa Đơn</h2>
    <form:form action="/San-Pham/SuaHD" method="post" modelAttribute="hoaDon">
        <div class="mb-3">
            <label for="id" class="form-label">nhân viên</label>
            <form:input path="idnhanvien" type="text" class="form-control" id="id" readonly="true"/>
            <div style="color: red"><form:errors path="id"/></div>
        </div>
        <div class="mb-3">
            <label for="id" class="form-label">khách hàng</label>
            <form:input path="idkhachhang" type="text" class="form-control" id="id" readonly="true"/>
            <div style="color: red"><form:errors path="id"/></div>
        </div>
        <div class="mb-3">
            <label for="ngaymua" class="form-label">Ngày Mua</label>
            <form:input path="ngaymua" type="text" class="form-control" id="ngaymua"/>
            <div style="color: red"><form:errors path="ngaymua"/></div>
        </div>
        <div class="mb-3">
            <label for="trangthai" class="form-label">Trạng Thái</label>
            <form:select path="trangthai" class="form-select" id="trangthai">
                <form:option value="true" > đã thanh toán</form:option>
                <form:option value="false">chưa thanh toán</form:option>
            </form:select>
            <div style="color: red"><form:errors path="trangthai"/></div>
        </div>
        <button type="submit" class="btn btn-primary">Lưu</button>
    </form:form>
</div>
</body>
</html>
