create database QLMP 


create table SanPham
(
	MaSP varchar(20) primary key,
	TenSP nvarchar (500),
	Gia int,
	MoTa nvarchar(4000),
)


create table DonHang
(
	MaDH varchar(20) primary key,
	MaSP varchar(20),
	TenSP nvarchar(4000),
	SoLuong int,
	NgayDat date,
	TongTien int,
	
)


create table KhachHang
(
	Email varchar(100) primary key,
	HoTen nvarchar(100),
	SDT varchar(12),
	DiaChi nvarchar(500),
	MatKhau varchar(20),
	MaDH varchar(20),
	
	
)


create table NhapHang
(
	MaNhapHang varchar(20) primary key,
	MaSP varchar(20),
	SoLuong int,
	NgayNhap date,
	Gia int,
)

create table XuatHang
(
	MaXuatHang varchar(20) primary key,
	MaSP varchar(20),
	SoLuong int, 
	NgayXuat date,
	Gia int,
)
create table ThanhToan
(
	MaDH varchar(20),
	MaSP varchar(20),
	TenSP nvarchar(4000),
	TongTien int,
	PhuongThucThanhToan varchar(50)
)
DRop Table  SanPham
Drop table ThanhToan
Drop table DonHang
drop table KhachHang 
drop table NhapHang
drop table XuatHang




ALTER TABLE ThanhToan 
ADD FOREIGN KEY (MaDH) REFERENCES DonHang (MaDH);


ALTER TABLE KhachHang 
ADD FOREIGN KEY (MaDH) REFERENCES DonHang (MaDH);


ALTER TABLE DonHang 
ADD FOREIGN KEY (MaSP) REFERENCES SanPham (MaSP);

ALTER TABLE XuatHang 
ADD FOREIGN KEY (MaSP) REFERENCES SanPham (MaSP);

ALTER TABLE NhapHang 
ADD FOREIGN KEY (MaSP) REFERENCES SanPham (MaSP);

SELECT * FROM SanPham;
SELECT * FROM NhapHang;
SELECT * FROM XuatHang;
SELECT * FROM DonHang;

SELECT * FROM ThanhToan;
SELECT * FROM KhachHang;






DROP PROCEDURE sp_themKhachHang
----------------------San Pham--------------------------
--laysp
CREATE PROC sp_laySP
AS
	SELECT *
	FROM SanPham
-----	them sp
CREATE PROC sp_themSP(@MaSP varchar (20),@TenSP nvarchar (500),@Gia int,@MoTa nvarchar (4000))
AS INSERT INTO SanPham VALUES (@MaSP, @TenSP, @Gia, @MoTa)
-----xoa sp
CREATE PROC sp_xoaSP (@MaSP varchar(20))
AS
DELETE FROM SanPham WHERE MaSP = @MaSP
-----sua sp
CREATE PROC sp_suaSP(@MaSP varchar (20),@TenSP nvarchar (500),@Gia int,@MoTa nvarchar (4000))
AS
UPDATE SanPham
SET MaSP = @MaSP, TenSP = @TenSP, Gia = @Gia ,MoTa = @MoTa
WHERE MaSP = @MaSP


----------------------Khach Hang--------------------------

--laykh
CREATE PROC sp_layKH
AS
	SELECT *
	FROM KhachHang
-----	them kh
CREATE PROC sp_themKH(@Email varchar (100),@HoTen nvarchar (100),@SDT varchar(12),@DiaChi nvarchar (500),@MatKhau varchar (20), @MaDH varchar(20))
AS INSERT INTO KhachHang VALUES (@Email, @HoTen, @SDT, @DiaChi,@MatKhau,@MaDH)
-----xoa kh
CREATE PROC sp_xoaKH (@Email varchar(100))
AS
DELETE FROM KhachHang WHERE Email = @Email
-----sua kh
CREATE PROC sp_suaKH(@Email varchar (100),@HoTen nvarchar (100),@SDT varchar(12),@DiaChi nvarchar (500),@MatKhau varchar (20), @MaDH varchar(20))
AS
UPDATE KhachHang
SET Email = @Email, HoTen = @HoTen, SDT = @SDT ,DiaChi = @DiaChi, MatKhau =@MatKhau, MaDH = @MaDH
WHERE Email = @Email


----------------------DonHang--------------------------

--laydh
CREATE PROC sp_layDH
AS
	SELECT *
	FROM DonHang
-----	them dh
CREATE PROC sp_themDH(@MaDH varchar (20),@MaSP varchar (20),@TenSP nvarchar(4000),@SoLuong int,@NgayDat date, @TongTien int)
AS INSERT INTO DonHang VALUES (@MaDH, @MaSP, @TenSP, @SoLuong,@NgayDat,@TongTien)
-----xoa dh
CREATE PROC sp_xoaDH (@MaDH varchar(20))
AS
DELETE FROM DonHang WHERE MaDH = @MaDH
-----sua dh
CREATE PROC sp_suaDH(@MaDH varchar (20),@MaSP varchar (20),@TenSP nvarchar(4000),@SoLuong int,@NgayDat date, @TongTien int)
AS
UPDATE DonHang
SET MaDH = @MaDH, MaSP = @MaSP, TenSP = @TenSP ,SoLuong = @SoLuong, NgayDat =@NgayDat, TongTien = @Tongtien
WHERE MaDH = @MaDH




----------------------Thanh toan--------------------------

--laytt
CREATE PROC sp_layTT
AS
	SELECT *
	FROM ThanhToan
-----	them tt
CREATE PROC sp_themTT(@MaDH varchar(20),@MaSP varchar(20),@TenSP nvarchar (4000),@TongTien int, @PhuongThucThanhToan varchar (50))
AS INSERT INTO ThanhToan VALUES (@MaDH, @MaSP, @TenSP, @TongTien,@PhuongThucThanhToan)
-----xoa tt
CREATE PROC sp_xoaTT (@MaDH varchar(20))
AS
DELETE FROM ThanhToan WHERE MaDH = @MaDH
-----sua tt
CREATE PROC sp_suaTT(@MaDH varchar(20),@MaSP varchar(20),@TenSP nvarchar (4000),@TongTien int, @PhuongThucThanhToan varchar (50))
AS
UPDATE ThanhToan
SET MaDH = @MaDH, MaSP = @MaSP, TenSP = @TenSP ,TongTien = @TongTien, PhuongThucThanhToan =@PhuongThucThanhToan
WHERE MaDH = @MaDH


----------------------Nhap hang--------------------------

--laynh
CREATE PROC sp_layNH
AS
	SELECT *
	FROM NhapHang
-----	them nh
CREATE PROC sp_themNH(@MaNhapHang varchar(20),@MaSP varchar(20),@SoLuong int, @NgayNhap date, @Gia int)
AS INSERT INTO NhapHang VALUES (@MaNhapHang, @MaSP, @SoLuong, @NgayNhap,@Gia)
-----xoa nh
CREATE PROC sp_xoaNH (@MaNhapHang varchar(20))
AS
DELETE FROM NhapHang WHERE MaNhapHang = @MaNhapHang
-----sua nh
CREATE PROC sp_suaNH(@MaNhapHang varchar(20),@MaSP varchar(20),@SoLuong int, @NgayNhap date, @Gia int)
AS
UPDATE NhapHang
SET MaNhapHang = @MaNhapHang, MaSP = @MaSP, SoLuong = @SoLuong ,NgayNhap = @NgayNhap, Gia =@Gia
WHERE MaNhapHang = @MaNhapHang

----------------------Xuat hang--------------------------

--lay xh
CREATE PROC sp_layXH
AS
	SELECT *
	FROM XuatHang
-----	them xh
CREATE PROC sp_themXH(@MaXuatHang varchar(20),@MaSP varchar(20),@SoLuong int, @NgayXuat date, @Gia int)
AS INSERT INTO NhapHang VALUES (@MaXuatHang, @MaSP, @SoLuong, @NgayXuat,@Gia)
-----xoa xh
CREATE PROC sp_xoaXH (@MaXuatHang varchar(20))
AS
DELETE FROM XuatHang WHERE MaXuatHang = @MaXuatHang
-----sua xh
CREATE PROC sp_suaXH(@MaXuatHang varchar(20),@MaSP varchar(20),@SoLuong int, @NgayXuat date, @Gia int)
AS
UPDATE XuatHang
SET MaXuatHang = @MaXuatHang, MaSP = @MaSP, SoLuong = @SoLuong ,NgayXuat = @NgayXuat, Gia =@Gia
WHERE MaXuatHang = @MaXuatHang

























