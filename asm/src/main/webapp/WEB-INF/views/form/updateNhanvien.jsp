<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
</head>
<body>
<div class="container mt-5">
    <h2>Update Nhân viên</h2>
    <form:form action="/San-Pham/updatenhanvien" method="post" modelAttribute="nhanvien">
        <div class="mb-3">
            <label for="id" class="form-label">ID</label>
            <form:input path="id" type="text" class="form-control" id="id"/>
            <div><form:errors path="id" /> </div>
        </div>
        <div class="mb-3">
            <label for="ten" class="form-label">Tên</label>
            <form:input path="ten" type="text" class="form-control" id="ten"/>
            <div><form:errors path="ten" /> </div>
        </div>
        <div class="mb-3">
            <label for="manv" class="form-label">Mã Nhân viên</label>
            <form:input path="manv" type="text" class="form-control" id="manv"/>
            <div><form:errors path="manv" /> </div>
        </div>
        <div class="mb-3">
            <label for="tendangnhap" class="form-label">Tên đăng nhập</label>
            <form:input path="tendangnhap" type="text" class="form-control" id="tendangnhap"/>
            <div style="color: red"><form:errors path="tendangnhap" /> </div>
        </div>
        <div class="mb-3">
            <label for="matkhau" class="form-label">Mật khẩu</label>
            <form:input path="matkhau" type="password" class="form-control" id="matkhau"/>
            <div style="color: red"><form:errors path="matkhau" /> </div>
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