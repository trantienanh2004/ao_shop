<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Kích Thước</title>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2>Update Kích Thước</h2>
    <form:form action="/San-Pham/updateTk" modelAttribute="kichThuoc" method="post">
        <div class="mb-3">
            <label for="ma" class="form-label">id </label>
            <form:input path="id" type="text" class="form-control" id="ma" readonly="true"/>
        </div>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
