create database QLMP

create table SanPham
(
IdSanPham int IDENTITY(1,1) PRIMARY KEY ,
IdDanhMucSanPham int,
TenSanPham nvarchar(200),
DuLieuHinhSanPham image,
MoTa nvarchar(MAX),
Gia int
)


drop table SanPham


drop table GioHang
drop table ChiTietDonHang


create table KhachHang
(
IdKhachHang int IDENTITY(1,1) PRIMARY KEY ,
HoTen nvarchar(100),
TenDangNhap nvarchar(100),
MatKhau varchar(100),
DiaChi nvarchar (100),
SoDienThoai int,


)

create table GioHang
(
IdGioHang int IDENTITY(1,1) PRIMARY KEY ,
IdSanPham int,
SoLuong int

)

create table TinhTrangDonHang
(
IdTinhTrangDonHang int IDENTITY(1,1) PRIMARY KEY ,
TenTinhTrangDonHang nvarchar(50)
)

create table DonHang
(
IdDonHang int IDENTITY(1,1) PRIMARY KEY ,
IdKhachHang int,
IdTinhTrangDonHang int,
NgayTaoDonHang date,
NgayXuLyDonHang date,


)


create table DanhMucSanPham
(
IdDanhMucSanPham int IDENTITY(1,1) PRIMARY KEY ,
TenDanhMucSanPham nvarchar(50)
)

create table ChiTietDonHang
(
IdChiTietDonHang int IDENTITY(1,1) primary key,
IdSanPham int,
IdDonHang int,
SoLuongSanPham int

)



ALTER TABLE SanPham
ADD FOREIGN KEY (IdDanhMucSanPham) REFERENCES DanhMucSanPham(IdDanhMucSanPham);

ALTER TABLE ChiTietDonHang
ADD FOREIGN KEY (IdSanPham) REFERENCES SanPham(IdSanPham);

ALTER TABLE GioHang
ADD FOREIGN KEY (IdSanPham) REFERENCES SanPham(IdSanPham);


ALTER TABLE ChiTietDonHang
ADD FOREIGN KEY (IdDonHang) REFERENCES DonHang(IdDonHang);





----------------------San Pham--------------------------
--laysp
CREATE PROC sp_laySP
AS
	SELECT *
	FROM SanPham
-----	them sp
CREATE PROC sp_themSP(@IdDanhMucSanPham int,@TenSanPham nvarchar(200),@DuLieuHinhSanPham image,@MoTa nvarchar (MAX) ,@Gia int)
AS INSERT INTO SanPham VALUES ( @IdDanhMucSanPham, @TenSanPham, @DuLieuHinhSanPham,@MoTa,@Gia)
-----xoa sp
CREATE PROC sp_xoaSP (@IdSanPham int)
AS
DELETE FROM SanPham WHERE IdSanPham = @IdSanPham
-----sua sp
CREATE PROC sp_suaSP(@IdSanPham int,@IdDanhMucSanPham int,@TenSanPham nvarchar(200),@DuLieuHinhSanPham image,@MoTa nvarchar (MAX) ,@Gia int)
AS
UPDATE SanPham
SET  IdDanhMucSanPham = @IdDanhMucSanPham, TenSanPham = @TenSanPham ,DuLieuHinhSanPham = @DuLieuHinhSanPham, Mota = @MoTa,Gia = @Gia
 WHERE IdSanPham = @IdSanPham
 
 




----------------------Khach hang--------------------------
--lay kh
CREATE PROC sp_layKH
AS
	SELECT *
	FROM KhachHang
-----	them kh
CREATE PROC sp_themKH(@HoTen nvarchar (100),@TenDangNhap nvarchar(100),@MatKhau varchar (100),@DiaChi nvarchar (100) ,@SoDienThoai int)
AS INSERT INTO KhachHang VALUES ( @HoTen, @TenDangNhap, @MatKhau,@DiaChi,@SoDienThoai)
-----xoa kh
CREATE PROC sp_xoaKH (@IdKhachHang int)
AS
DELETE FROM KhachHang WHERE IdKhachHang = @IdKhachHang
-----sua kh
CREATE PROC sp_suaKH(@IdKhachHang int,@HoTen nvarchar (100),@TenDangNhap nvarchar(100),@MatKhau varchar (100),@DiaChi nvarchar (100) ,@SoDienThoai int)
AS
UPDATE KhachHang
SET  HoTen = @HoTen, TenDangNhap = @TenDangNhap ,MatKhau = @MatKhau, DiaChi = @DiaChi,SoDienThoai = @SoDienThoai
 WHERE IdKhachHang = @IdKhachHang 
 




----------------------Gio Hang--------------------------
--lay gh
CREATE PROC sp_layGH
AS
	SELECT *
	FROM GioHang
-----	them gh
CREATE PROC sp_themGH(@IdSanPham int,@SoLuong int)
AS INSERT INTO GioHang VALUES ( @IdSanPham, @SoLuong)
-----xoa gh
CREATE PROC sp_xoaGH (@IdGioHang int)
AS
DELETE FROM GioHang WHERE IdGioHang = @IdGioHang
-----sua gh
CREATE PROC sp_suaGH(@IdGioHang int ,@IdSanPham int , @SoLuong int)
AS
UPDATE GioHang
SET  IdSanPham =@IdSanPham ,SoLuong = @SoLuong
 WHERE IdGioHang = @IdGioHang 
 
 
 
 ----------------------Don Hang--------------------------
--lay dh
CREATE PROC sp_layDH
AS
	SELECT *
	FROM DonHang
-----	them dh
CREATE PROC sp_themDH(@IdKhachHang int,@IdTinhTrangDonHang int, @NgayTaoDonHang date ,@NgayXuLyDonHang date)
AS INSERT INTO DonHang VALUES ( @IdKhachHang, @IdTinhTrangDonHang, @NgayTaoDonHang, @NgayXuLyDonHang)
-----xoa dh
CREATE PROC sp_xoaDH (@IdDonHang int)
AS
DELETE FROM DonHang WHERE IdDonHang = @IdDonHang
-----sua dh
CREATE PROC sp_suaDH(@IdDonHang int ,@IdKhachHang int , @IdTinhTrangDonHang int, @NgayTaoDonHang date, @NgayXuLyDonHang date)
AS
UPDATE DonHang
SET  IdKhachHang =@IdKhachHang ,IdTinhTrangDonHang = @IdTinhTrangDonHang , NgayTaoDonHang =@NgayTaoDonHang , NgayXuLyDonHang = @NgayXuLyDonHang
 WHERE IdDonHang = @IdDonHang 
 





----------------------danh muc sp--------------------------

CREATE PROC sp_layDM
AS
	SELECT *
	FROM DanhMucSanPham

CREATE PROC sp_themDM(@TenDanhMucSanPham nvarchar(50))
AS INSERT INTO DanhMucSanPham VALUES (  @TenDanhMucSanPham)

CREATE PROC sp_xoaDM (@IdDanhMucSanPham int)
AS
DELETE FROM DanhMucSanPham WHERE IdDanhMucSanPham = @IdDanhMucSanPham

CREATE PROC sp_suaDM(@IdDanhMucSanPham int ,@TenDanhMucSanPham nvarchar (50))
AS
UPDATE DanhMucSanPham
SET  TenDanhMucSanPham = @TenDanhMucSanPham
 WHERE IdDanhMucSanPham = @IdDanhMucSanPham 
 
 
 ----------------------chi tiet don hang--------------------------

CREATE PROC sp_layCTDH
AS
	SELECT *
	FROM ChiTietDonHang

CREATE PROC sp_themCTDH(@IdSanPham int ,@IdDonHang int, @SoLuongSanPham int)
AS INSERT INTO ChiTietDonHang VALUES (  @IdSanPham, @IdDonHang, @SoLuongSanPham)

CREATE PROC sp_xoaCTDH (@IdChiTietDonHang int)
AS
DELETE FROM ChiTietDonHang WHERE IdChiTietDonHang = @IdChiTietDonHang

CREATE PROC sp_suaCTDH(@IdChiTietDonHang int, @IdSanPham int, @IdDonHang int , @SoLuongSanPham int)
AS
UPDATE ChiTietDonHang
SET  IdSanPham = @IdSanPham , IdDonHang = @IdDonHang ,SoLuongSanPham = @SoLuongSanPham
 WHERE IdChiTietDonHang = @IdChiTietDonHang 
 
 
 
 Select P.* from SanPham P,DanhMucSanPham T
 where P.IdDanhMucSanPham = T.IdDanhMucSanPham AND T.IdDanhMucSanPham = 2
 
 
 