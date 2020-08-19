CREATE DATABASE MSSQL01
GO

USE MSSQL01
GO

CREATE TABLE KhachHang01(
	MaKH INT
	CONSTRAINT PK_KhachHang01_MaKH PRIMARY KEY,
	NguoiDH NVARCHAR(20)
	DiaChi NVARCHAR(50)
	SoDT VARCHAR(10)
	NgayDH VARCHAR(12)
)
GO

CREATE TABLE LoaiHang01(
	MaLoaiHang	VARCHAR(5)
	CONSTRAINT PK_LoaiHang01_MaLoaiHang PRIMARY KEY(MaLoaiHang),
	TenLoaiHang NVARCHAR(30),
)

CREATE TABLE MatHang01(
	MaHang CHAR(4)
	CONSTRAINT PK_MatHang01_MaHang PRIMARY KEY(MaHang)
	TenHang NVARCHAR(30),
	MaLoaiHang CHAR(4),
	MoTa NVARCHAR(30),
	DonViTinh NVARCHAR(10),
	SoLuong INT,
	ThanhTien NUMERIC(10,2),
	CONSTRAINT FK_LoaiHang01_MatHang01 FOREIGN KEY (MaLoaiHang)
)

CREATE TABLE DonDatHang01(
	SoHoaDon INT
	CONSTRAINT PK_DonDatHang01_SoHoaDon PRIMARY KEY,
	MaKhachHang		INT,
	NgayDatHang		DATETIME,
	NgayGiaohang	DATETIME,
	NgayChuyenHang	DATETIME,
	NoiGiaohang		NVARCHAR(80),
	CONSTRAINT FK_DonDatHang01_MaKhachHang FOREIGN KEY(MaKhachHang) REFERENCES KhachHang01(MaKhachHang)
	)

CREATE TABLE ChiTietDonDatHang01(
	SoHoaDon	INT,
	MaHang		CHAR(4),
	GiaBan		NUMERIC(10,2),
	SoLuong		INT,
	MucGiamGia	NUMERIC(10,2),
	CONSTRAINT PK_ChiTietDonDatHang01_SoHoaDon_MaHang PRIMARY KEY(SoHoaDon),
	CONSTRAINT FK_ChiTietDonDatHang01_SoHoaDon FOREIGN KEY (SoHoaDon)
	REFERENCES DonDatHang01(SoHoaDon),
	CONSTRAINT FK_ChiTietDonDatHang01_MaHang FOREIGN KEY(MaHang) REFERENCES MatHang01(MaHang)
	)

--3. Viết các câu lệnh để thêm dữ liệu vào các bảng
	Cho vào hai dữ liệu tưng tự như bảng đề bài trên

--Bảng LoaiHang01
INSERT INTO LoaiHang01 VALUES('IP01',N'Iphone')
INSERT INTO LoaiHang01 VALUES('IM01',N'Imac 2018')
INSERT INTO LoaiHang01 VALUES('IPad01',N'Ipad 2019')

--Bảng MatHang01
INSERT INTO MatHang01 VALUES('MH01',N'Máy Tính T450','MT01','1',N'Chiếc',1000,N'Máy nhập mới')
INSERT INTO MatHang01 VALUES('MH02',N'Điện Thoại Nokia 5670','DT01','2',N'Chiếc',200,N'Điện thoại đang hot')
INSERT INTO MatHang01 VALUES('MH03',N'Máy in Samsung 450','MI01','1',N'Chiếc',100,N'Máy in đang ế')

--Bảng DonDatHang01
INSERT INTO DonDatHang01 VALUES(001,'123','2018-4-4','2018-6-8','2018-7-8',N'Hà Nội')
INSERT INTO DonDatHang01 VALUES(002,'123','2018-5-5','2018-8-6','2018-6-7',N'Hà Nội')
INSERT INTO DonDatHang01 VALUES(003,'123','2017-6-6','2017-8-9','2017-7-8',N'Hà Nội')

--Bảng ChiTietDonDatHang01
INSERT INTO ChiTietDonDatHang01 VALUES(001,'DH01',500,'1',0)
INSERT INTO ChiTietDonDatHang01 VALUES(002,'DH02',200,'2',0)
INSERT INTO ChiTietDonDatHang01 VALUES(003,'DH03',300,'1',0)
INSERT INTO ChiTietDonDatHang01 VALUES(004,'DH02',400,'2',0)

--4.
	--a
	SELECT * FROM KhachHang01
	--b
	SELECT * FROM MatHang01
	--C
	SELECT * FROM DonDatHang01
	SELECT * FROM ChiTietDonDatHang01

--5.
	--a
	SELECT * FROM KhachHang01 
	ORDER BY TenKhachHang ASC
	--b
	SELECT * FROM MatHang01
	ORDER BY SoLuong DESC
	--c
	SELECT DISTINCT S.MaHang, TenHang
	FROM MATHANG1 S INNER JOIN ChiTietDonDatHang01 C
	ON S.MaHang = C.MaHang
	AND EXISTS(SELECT *
	FROM CHITIETDATHANG1 C INNER JOIN DONDATHANG1 H
	ON C.SoHoaDon = H.SoHoaDon
	and MaKhachHang IN(SELECT H.MaKhachHang
	FROM DONDATHANG1 H INNER JOIN KHACHHANG1 K
	ON H.MaKhachHang = K.MaKhachhang
	WHERE TenKhachHang = N'Nguyễn Văn An') AND S.MaHang = C.MaHang)
















