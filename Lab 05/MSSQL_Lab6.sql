
CREATE DATABASE Lab05

GO

USE Lab05

GO

CREATE TABLE PhongBan (
	MaPB varchar(7) Primary key,
	TenPB nvarchar(50) 
)
GO

CREATE TABLE Nhanvien (
	MaNV varchar(7) Primary key,
	TenNV nvarchar(50)
	NgaySinh datetime check(NgaySinh < Getdate()),
	SoCMND char(9) check(SoCMND not like '%[^0-9]%'),
	GioiTinh char(1) check(GioiTinh = 'M' or GioiTinh = 'F') default('M'),
	DiaChi nvarchar(100), 
	NgayVaoLam datetime,
	Constraint year20 check(Datediff(year, NgaySinh, NgayVaoLam) > 20),
	Constraint fk_PhongBan Foreign key (MaPB) References PhongBan(MaPB)
);

CREATE TABLE LuongDA (
	MaDA varchar(8) Primary key,
	MaNV varchar(7) Primary key
	NgayNhan datetime NOT NULL default(getdate()),
	SoTien money check (SoTien>0),

--1.Thực hiện chèn dữ liệu vào các bảng vừa tạo (ít nhất 5 bản ghi cho mỗi bảng).
INSERT INTO PhongBan values ('A1', N'Hành chính')
INSERT INTO PhongBan values ('A2', N'Kế Toán')
INSERT INTO PhongBan values ('A3', N'Nhân Sự')
INSERT INTO PhongBan values ('A4', N'Kinh Doanh')
INSERT INTO PhongBan values ('A5', N'Dự Án')

INSERT INTO Nhanvien values ('B1', N'Đào Duy A','1997-10-09','0123456789','M',N'Hà Nội','2000-05-22','A1')
INSERT INTO Nhanvien values ('B2', N'Đào Duy B','1997-10-10','0333456789','M',N'Hà Nội','2001-05-23','A2')
INSERT INTO Nhanvien values ('B3', N'Đào Duy C','1997-10-11','0444456789','M',N'Hà Nội','2002-05-24','A3')
INSERT INTO Nhanvien values ('B4', N'Đào Duy D','1997-10-12','0555456789','M',N'Hà Nội','2003-05-25','A5')
INSERT INTO Nhanvien values ('B5', N'Đào Duy E','1997-10-13','0666456789','M',N'Hà Nội','2004-05-26','A6')

INSERT INTO LuongDA values ('C1','B1','1990-06-20',3000)
INSERT INTO LuongDA values ('C2','B2','1991-06-21',3002)
INSERT INTO LuongDA values ('C3','B3','1992-06-22',3004)
INSERT INTO LuongDA values ('C4','B4','1993-06-23',3006)
INSERT INTO LuongDA values ('C5','B5','1994-06-24',3008)

--2.Viết một query để hiển thị về các bảng lương LuongDA, NhanVien, PhongBan.
SELECT * FROM PhongBan
SELECT * FROM Nhanvien
SELECT * FROM LuongDA

--3.Viết một query để hiển thị những nhân viên có giới tính là 'F'.
SELECT MaNV, TenNV, GioiTinh, NgaySinh, SoCMND, DiaChi, NgayVaoLam, MaPB
FROM Nhanvien
WHERE GioiTinh = 'F'

--4.Hiển thị tất cả các dự án, mỗi dự án một dòng.
SELECT MaDA As 'ALL DA'
FROM LuongDA

--5.Hiển thị tổng lương của từng nhân viên (dùng mệnh đề GROUP BY).
SELECT MaDA, MaNV, NgayNhan, SoTien
FROM LuongDA
GROUP BY MaDA, MaNV, NgayNhan;

--6.Hiển thị tất cả các nhân viên trên một phòng ban cho trước (VD: ‘Hành chính’).
SELECT MaNV, TenNV, GioiTinh, NgaySinh, SoCMND, DiaChi, NgayVaoLam, MaPB
FROM Nhanvien
WHERE MaPB='A1'

--7.Hiển thị mức lương của những nhân viên phòng hành chính.
SELECT TenNV, GioiTinh, SoTien, 
FROM Nhanvien
	JOIN LuongDA
		ON Nhanvien.MaNV = LuongDA.MaNV
	JOIN PhongBan
        ON PhongBan.MaPB = NhanVien.MaPB
WHERE TenPB = N'Hành Chính'

--8.Hiển thị số lượng nhân viên của từng phòng.
--Phòng Hành Chính
SELECT COUNT(*) SoLuong
FROM NhanVien
	JOIN LuongDA
		ON NhanVien.MaNV = LuongDA.MaNV
	JOIN PhongBan
		ON PhongBan.MaPB = NhanVien.MaPB
WHERE TenPB = N'Hành Chính'

--Phòng Kế Toán
SELECT COUNT(*) SoLuong
FROM NhanVien
	JOIN LuongDA
		ON NhanVien.MaNV = LuongDA.MaNV
	JOIN PhongBan
		ON PhongBan.MaPB = NhanVien.MaPB
WHERE TenPB = N'Kế Toán'

--Phòng Nhân Sự
SELECT COUNT(*) SoLuong
FROM NhanVien
	JOIN LuongDA
		ON NhanVien.MaNV = LuongDA.MaNV
	JOIN PhongBan
		ON PhongBan.MaPB = NhanVien.MaPB
WHERE TenPB = N'Nhân Sự'

--Phòng Kinh Doanh
SELECT COUNT(*) SoLuong
FROM NhanVien
	JOIN LuongDA
		ON NhanVien.MaNV = LuongDA.MaNV
	JOIN PhongBan
		ON PhongBan.MaPB = NhanVien.MaPB
WHERE TenPB = N'Kinh Doanh'

--Phòng Dự Án
SELECT COUNT(*) SoLuong
FROM NhanVien
	JOIN LuongDA
		ON NhanVien.MaNV = LuongDA.MaNV
	JOIN PhongBan
		ON PhongBan.MaPB = NhanVien.MaPB
WHERE TenPB = N'Dự Án'

--9.Viết một query để hiển thị những nhân viên mà tham gia ít nhất vào một dự án.
SELECT * FROM LuongDA WHERE MaDA !='';

--10.Viết một query hiển thị phòng ban có số lượng nhân viên nhiều nhất.
SELECT MAX(MaPB) as NVMAX FROM phongban;

--11.Tính tổng số lượng của các nhân viên trong phòng Hành chính.
SELECT COUNT (*) N'Tổng Số Lượng Nhân Viên'
FROM NhanVien
	JOIN PhongBan
	ON PhongBan.MaPB = NhanVien.MaPB
WHERE TenPB = N'Hành Chính'

--12.Hiển thị tổng lương của các nhân viên có số cmnd tận cùng bằng 9.
SELECT right(SoCMND, 1), SoCMND
FROM NhanVien
WHERE right(SoCMND, 1) = '9'

--13.Tìm nhân viên có số lương cao nhất.
SELECT MAX(SoTien) as N'Lương Cao Nhất'
FROM LuongDA
	JOIN NhanVien
	ON NhanVien.MaNV = LuongDA.MaNV

--14. Tìm nhân viên ở phòng Hành chính có giới tính bằng 'F' và có mức lương > 1200000.
SELECT TenNV
FROM NhanVien
	JOIN PhongBan 
		ON PhongBan.MaPB = NhanVien.MaPB
	JOIN LuongDA
		ON LuongDA.MaNV = NhanVien.MaNV
WHERE TenPB = N'Hành Chính' and GioiTinh = 'F' and SoTien > 1200000

--15.Tìm tổng lương trên từng phòng.
SELECT SUM(SoTien)
FROM NhanVien
JOIN LuongDA
          ON NhanVien.MaNV = LuongDA.MaNV
     JOIN PhongBan
          ON PhongBan.MaPB = NhanVien.MaPB
 WHERE TenPB =  N'Hành Chính'

 SELECT SUM(SoTien)
FROM NhanVien
JOIN LuongDA
          ON NhanVien.MaNV = LuongDA.MaNV
     JOIN PhongBan
          ON PhongBan.MaPB = NhanVien.MaPB
 WHERE TenPB =  N'Kế Toán'
 SELECT SUM(SoTien)
FROM NhanVien
JOIN LuongDA
          ON NhanVien.MaNV = LuongDA.MaNV
     JOIN PhongBan
          ON PhongBan.MaPB = NhanVien.MaPB
 WHERE TenPB =  N'Kinh Doanh'
 SELECT SUM(SoTien)
FROM NhanVien
JOIN LuongDA
          ON NhanVien.MaNV = LuongDA.MaNV
     JOIN PhongBan
          ON PhongBan.MaPB = NhanVien.MaPB
 WHERE TenPB =  N'Nhân Sự'
 SELECT SUM(SoTien)
FROM NhanVien
JOIN LuongDA
          ON NhanVien.MaNV = LuongDA.MaNV
     JOIN PhongBan
          ON PhongBan.MaPB = NhanVien.MaPB
 WHERE TenPB =  N'Dự Án'

 --18. Hiển thị thông tin chi tiết của nhân viên được nhận tiền dự án trong năm 2003
SELECT * FROM LuongDA 
WHERE NgayNhan= '2003-04-25';
--19. Hiển thị thông tin chi tiết của nhân viên không tham gia bất cứ dự án nào.
SELECT * FROM LuongDA WHERE MaDA='';
--20. Xoá dự án có mã dự án là DXD02.
DELETE FROM LuongDA WHERE MaDA='DXD02';
--21. Xoá đi từ bảng LuongDA những nhân viên có mức lương 2000000.
DELETE FROM LuongDA WHERE SoTien='2000000';
--22. Cập nhật lại lương cho những người tham gia dự án XDX01 thêm 10% lương cũ.
UPDATE LuongDA
SET SoTien = '900000000'
WHERE MaDA = 'XDX101';
SELECT * FROM LuongDA;
--23. Xoá các bản ghi tương ứng từ bảng NhanVien đối với những nhân viên không có mã nhân viên  tồn tại trong bảng LuongDA.
DELETE FROM NhanVien WHERE MaNV not in (SELECT MaNV FROM LuongDA );
--24. Viết một truy vấn đặt lại ngày vào làm của tất cả các nhân viên thuộc phòng hành chính là ngày 12/02/1999
UPDATE nhanvienhanhchinh
SET NgayVaoLam = 2019-04-29;
select * from nhanvienhanhchinh;






















