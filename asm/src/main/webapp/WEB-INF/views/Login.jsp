<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
<body>
<div style="justify-content: center; align-items: center; display: flex"><H1>Đăng Nhập</H1></div>

<div>
    <form:form method="post" action="/San-Pham/login" modelAttribute="DangNhap">
        <div style="display: flex; flex-direction: column; align-items: center; width: 300px; margin: 0 auto;">

            <div style="margin-bottom: 1em; width: 100%;">
                <label for="TenDangNhap" class="mt-3">Tên Đăng Nhập:</label>
                <form:input path="tendangnhap" id="tendangnhap" class="form-control"/>
                <div style="color: red" class="mt-2">
                    <form:errors path="tendangnhap"/>
                </div>
            </div>
            <div style="margin-bottom: 1em; width: 100%;">
                <label for="MatKhau" class="mt-3">Mật Khẩu:</label>
                <form:input path="matkhau" id="matkhau" type="password" class="form-control"/>
                <div style="color: red" class="mt-2">
                    <form:errors path="matkhau"/>
                </div>
            </div>
            <div>
                <button type="submit" class="btn btn-primary">Gửi</button>
            </div>
        </div>
    </form:form>
    <div style="justify-content: center; align-items: center; display: flex ;color: red"> ${errors}</div>

</div>
</body>
</html>
