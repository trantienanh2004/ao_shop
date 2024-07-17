-- Create the database
create DATABASE ShopDB;
GO

-- Use the created database
USE ShopDB;
GO

-- Create the SanPham table
CREATE TABLE SAN_PHAM (
    id INT IDENTITY(1,1)  PRIMARY KEY,
    ma NVARCHAR(50),
    ten NVARCHAR(100),
    trangthai BIT
);
GO

-- Create the MauSac table
CREATE TABLE MAU_SAC (
   id INT IDENTITY(1,1) PRIMARY KEY,
    ma NVARCHAR(50),
    ten NVARCHAR(100),
    trangthai BIT
);
GO

-- Create the KichThuoc table
CREATE TABLE KICH_THUOC (
   id INT IDENTITY(1,1) PRIMARY KEY,
    ma NVARCHAR(50),
    ten NVARCHAR(100),
    trangthai BIT
);
GO

-- Create the SPChiTiet table
CREATE TABLE SP_CHI_TIET (
    id INT IDENTITY(1,1) PRIMARY KEY,
    maspct NVARCHAR(50),
    idkichthuoc INT,
    idmausac INT,
    idsanpham INT,
    soluong INT,
    dongia DECIMAL(18, 2),
    trangthai BIT,
    FOREIGN KEY (idkichthuoc) REFERENCES KICH_THUOC(ID),
    FOREIGN KEY (idmausac) REFERENCES MAU_SAC(ID),
    FOREIGN KEY (idsanpham) REFERENCES SAN_PHAM(ID)
);
GO

-- Create the KhachHang table
CREATE TABLE KHACH_HANG (
    id INT IDENTITY(1,1) PRIMARY KEY,
    ten NVARCHAR(100),
    sdt NVARCHAR(15),
    makh NVARCHAR(50),
    trangthai BIT
);
GO

-- Create the NhanVien table
CREATE TABLE NHAN_VIEN (
    id INT IDENTITY(1,1) PRIMARY KEY,
    ten NVARCHAR(100),
    manv NVARCHAR(50),
    tendangnhap NVARCHAR(50),
    matkhau NVARCHAR(255),
    trangthai BIT
);
GO

-- Create the HoaDon table
CREATE TABLE HOA_DON (
    id INT IDENTITY(1,1) PRIMARY KEY,
    idnhanvien INT,
    idkhachhang INT,
    ngaymuahang DATETIME,
    trangthai BIT,
    FOREIGN KEY (idnhanvien) REFERENCES NHAN_VIEN(ID),
    FOREIGN KEY (idkhachhang) REFERENCES KHACH_HANG(ID)
);
GO

-- Create the HoaDonChiTiet table
CREATE TABLE HOA_DON_CHI_TIET (
    id INT IDENTITY(1,1) PRIMARY KEY,
    idhoadon INT,
    idspct INT,
    soluong INT,
    dongia DECIMAL(18, 2),
    TrangThai BIT,
    FOREIGN KEY (idhoadon) REFERENCES HOA_DON(ID),
    FOREIGN KEY (idspct) REFERENCES SP_CHI_TIET(ID)
);
GO

INSERT INTO SAN_PHAM( Ma, Ten, TrangThai)
VALUES 
( 'SP001', N'ÁO ABC', 1),
( 'SP002', N'ÁO GÌ ĐÓ', 1),
('SP003', N'GÌ GÌ ĐÓ', 1);

-- Thêm dữ liệu vào bảng MauSac
INSERT INTO MAU_SAC( Ma, Ten, TrangThai)
VALUES 
( 'MS001', N'Đỏ', 1),
( 'MS002', N'Xanh lá', 1),
( 'MS003', N'TRẮNG', 1);

-- Thêm dữ liệu vào bảng KichThuoc
INSERT INTO KICH_THUOC( Ma, Ten, TrangThai)
VALUES 
( 'KT001', N'Nhỏ', 1),
( 'KT002', N'Vừa', 1),
( 'KT003', N'Lớn', 1);

-- Thêm dữ liệu vào bảng SPChiTiet
INSERT INTO SP_CHI_TIET( MaSPCT, IdKichThuoc, IdMauSac, IdSanPham, SoLuong, DonGia, TrangThai)
VALUES 
( 'SPCT001', 1, 1, 1, 100, 200000.00, 1),
( 'SPCT002', 2, 2, 2, 200, 300000.00, 1),
( 'SPCT003', 3, 3, 3, 150, 250000.00, 1);

-- Thêm dữ liệu vào bảng KhachHang
INSERT INTO KHACH_HANG( Ten, SDT, MaKH, TrangThai)
VALUES 
( 'Nguyễn Văn A', '0909123456', 'KH001', 1),
( 'Trần Thị B', '0912345678', 'KH002', 1),
( 'Lê Văn C', '0922334455', 'KH003', 1);

-- Thêm dữ liệu vào bảng NhanVien
INSERT INTO NHAN_VIEN( Ten, MaNV, TenDangNhap, MatKhau, TrangThai)
VALUES 
(N'haha', 'NV004', 'ADMINka', '1234', 1),
( N'Nhân viên A', 'NV001', 'ADMIN', '1234', 1),
( N'Nhân viên B', 'NV002', 'NHANVIENDZ01', '1234', 0),
( N'Nhân viên C', 'NV003', 'NHANVIENDZ02', '1234', 0);

-- Thêm dữ liệu vào bảng HoaDon
INSERT INTO HOA_DON ( IdNhanVien, IdKhachHang, NgayMuaHang, TrangThai)
VALUES
( 1, null, '2023-01-01', 0),
( 1, 1, '2023-01-01 10:00:00', 1),
( 2, 2, '2023-02-01 11:00:00', 1),
( 3, 3, '2023-03-01 12:00:00', 1);

-- Thêm dữ liệu vào bảng HoaDonChiTiet
INSERT INTO HOA_DON_CHI_TIET( IdHoaDon, IdSPCT, SoLuong, DonGia, TrangThai)
VALUES 
( 1, 1, 10, 200000.00, 1),
( 2, 2, 20, 300000.00, 1),
( 3, 3, 15, 250000.00, 1);
GO
SELECT * FROM NHAN_VIEN
SELECT * FROM SP_CHI_TIET 
SELECT * FROM NHAN_VIEN
SELECT * FROM NHAN_VIEN
select * from HOA_DON_chi_tiet

