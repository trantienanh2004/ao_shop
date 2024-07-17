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
    <div class="text-center mt-3"> <h5>khách hàng</h5></div>
    <div style="color: red">${tb}</div>
    <div class="ml-auto"><a href="/San-Pham/quaylaiHD" class="btn btn-success ">quay về</a></div>
    <div class="ml-auto"><a href="/San-Pham/addkh" class="btn btn-success ">ADD</a></div>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">stt</th>
            <th scope="col">id</th>
            <th scope="col">tên</th>
            <th scope="col">mã</th>
            <th scope="col">SĐT</th>
            <th scope="col">trạng thái</th>
            <th scope="col">chức năng</th>
        </tr>
        </thead>
        <tbody>


        <c:forEach var="list" items="${kh}" varStatus="i" >
            <tr>
                <td>${i.index}</td>
                <td>${list.id}</td>
                <td>${list.ten}</td>
                <td>${list.makh}</td>
                <td>${list.sdt}</td>
                <td>${list.trangthai ? "hoạt động":"ngưng hoạt động"}</td>
                <td><a href="/San-Pham/deleteKH?id=${list.id}" class="btn btn-info ">xóa</a>
                    <a href="/San-Pham/formUpdateKT?id=${list.id}" class="btn btn-info ">sửa</a></td>
            </tr>
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

</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
