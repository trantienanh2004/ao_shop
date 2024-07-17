<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý Kích Thước</title>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<div class="container mt-5">
    <h2>Quản lý Kích Thước</h2>
    <form:form action="/San-Pham/AddTk" modelAttribute="kichThuoc" method="post">

        <div class="mb-3">
            <label for="ma" class="form-label">Mã </label>
            <form:input path="ma" type="text" class="form-control" id="ma"/>
        </div>
        <div class="mb-3">
            <label for="ten" class="form-label">Tên </label>
            <form:input path="ten" type="text" class="form-control" id="ten"/>
        </div>
        <div class="mb-3">
            <label for="trangthai" class="form-label">Trạng thái</label>
            <form:select path="trangthai" class="form-select" id="trangthai">
                <form:option value="true">Hoạt động</form:option>
                <form:option value="false">Ngừng hoạt động</form:option>
            </form:select>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form:form>
</div>
</body>
</html>
