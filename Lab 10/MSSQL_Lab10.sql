CREATE DATABASE Lab10
GO
USE Lab10
GO

CREATE TABLE Toyz(
	ProductCode		varchar(5)
	Constraint PK_Toys_ProductCode Primary key(ProductCode),
	Name			varchar(30),
	Category		varchar(30),
	Manufacturer	varchar(40),
	AgeRange		varchar(15)
	UnitPrice		money,
	Netweight		int,
	QtyOnHand		int,
)
--1. Tạo bảng 
INSERT INTO Toyz VALUES('SP01','Xep hinh Duligo','Lap Ghep','TaoBao','3-5','25000',500,2000)
INSERT INTO Toyz VALUES('SP02','Xep hinh Shozuku','Lap Ghep','TaoBao1','3-6','26000',501,200)
INSERT INTO Toyz VALUES('SP03','Xep hinh Lego','Lap Ghep','TaoBao2','3-9','27000',502,201)
INSERT INTO Toyz VALUES('SP04','Mickey','Hoat Hinh','TaoBao3','3-7','55000',503,202)
INSERT INTO Toyz VALUES('SP05','Doraemon','Hoat Hinh','TaoBao4','3-8','15000',504,203)
INSERT INTO Toyz VALUES('SP06','Pokemon','Hoat Hinh','TaoBao5','3-10','35000',505,204)
INSERT INTO Toyz VALUES('SP07','Alita','Cong Chua','TaoBao6','3-11','16000',506,205)
INSERT INTO Toyz VALUES('SP08','Donal Trump','Chien Thuat','TaoBao7','3-12','28000',507,206)
INSERT INTO Toyz VALUES('SP09','Pikachu','Tri Tue','TaoBao8','3-12','65000',508,207)
INSERT INTO Toyz VALUES('SP10','Gunny Go','Chien Thuat','TaoBao9','3-13','75000',509,208)
INSERT INTO Toyz VALUES('SP11','William','Hanh Dong','TaoBao10','3-14','84000',510,209)
INSERT INTO Toyz VALUES('SP12','Snake Snake','Giai Tri','TaoBao11','3-15','9400',511,209)
INSERT INTO Toyz VALUES('SP13','Baiduu','Phuu Luu','TaoBao12','3-16','35300',512,210)
INSERT INTO Toyz VALUES('SP14','Tank GoPro','Hanh Dong','TaoBao13','3-17','86000',513,211)
INSERT INTO Toyz VALUES('SP15','CatMan','Chien Thuat','TaoBao14','3-18','74000',514,212)

--2.
SELECT * FROM Toyz

CREATE PROCEDURE HeavyToys AS
SELECT ProcductCode, Category FROM Toyz 
WHERE Netweight > 500

--3.
CREATE PROCEDURE PriceIncrease AS
SELECT ProductCode, Name, UnitPrice+10 AS SAUTANGGIA FROM Toys

--4.
CREATE PROCEDURE QtyOnHand AS
SELECT  ProductCode, Name, QtyOnHand-5 AS SAUGIAMSOLUONG FROM Toyz

--5.
EXECUTE HeavyToys
EXECUTE PriceIncrease
EXECUTE QtyOnHand



--1, Ta đã có 3 thủ tục lưu trữ tên là HeavyToys,PriceIncrease, QtyOnHand. Viết các câu lệnh xem định nghĩa củacác thủ tục trên dùng 3 cách sau:
	- Thủ tục lưu trữ hệ thống sp_helptext
	- Khung nhìn hệ thống sys.sql_modules
	- Hàm OBJECT_DEFINITION()

sp_helptext HeavyToys
sp_helptext PriceIncrease
sp_helptext QtyOnHand

SELECT OBJECT_DEFINITION (OBJECT_ID('HeavyToys')) AS ThucHien;
SELECT OBJECT_DEFINITION (OBJECT_ID('PriceIncrease')) AS ThucHien;
SELECT OBJECT_DEFINITION (OBJECT_ID('QtyOnHand')) AS ThucHien;

--2, Viết câu lệnh hiển thị các đối tượng phụ thuộc của mỗi thủ tục lưu trữ trên
EXECUTE sp_depends HeavyToys
EXECUTE sp_depends PriceIncrease
EXECUTE sp_depends QtyOnHand
GO

--3, Chỉnh sửa thủ tục PriceIncreasevà QtyOnHandthêm câu lệnh cho phép hiển thị giá trị mới đã được cập nhật của các trường (UnitPrice,QtyOnHand).
ALTER PROCEDURE PriceIncrease AS
UPDATE Toyz SET UnitPrice = UnitPrice + 500
GO
ALTER PROCEDURE QtyOnHand AS
UPDATE Toyz SET QtyOnHand = QtyOnHand - 5
GO
SELECT * FROM Toyz
GO

--4. Viết câu lệnh tạo thủ tục lưu trữ có tên là SpecificPriceIncrease thực hiện cộng thêm tổng số sản phẩm (giá trị trường QtyOnHand)vào giá của sản phẩm đồ chơi tương ứng.
ALTER PROCEDURE SpecificPriceIncrease AS
UPDATE Toyz SET UnitPrice = UnitPrice + QtyOnHand
GO

--5.Chỉnh sửa thủ tục lưu trữ SpecificPriceIncrease cho thêm tính năng trả lại tổng số các bản ghi được cập nhật.
ALTER PROCEDURE SpecificPriceIncrease @number int OUTPUT AS
UPDATE Toyz SET UnitPrice = UnitPrice + QtyOnHand
SELECT ProductCode, Name, UnitPrice as Price, QtyOnHand FROM Toyz
WHERE QtyOnHand > 0
SELECT @number = @@ROWCOUNT
GO
DECLARE @num int 
EXECUTE SpecificPriceIncrease @num OUTPUT
PRINT @num

--6. Chỉnh sửa thủ tục lưu trữ SpecificPriceIncrease cho phép gọi thủ tục HeavyToysbên trong nó
ALTER PROCEDURE SpecificPriceIncrease @number int OUTPUT AS
UPDATE Toyz SET UnitPrice=UnitPrice+QtyOnHand
SELECT ProductCode, Name, UnitPrice as Price, QtyOnHand FROM Toyz
WHERE QtyOnHand > 0
SELECT @number = @@Rowcount
EXECUTE HeavyToys

--7. Thực hiện điều khiển xử lý lỗi cho tất cả các thủ tục lưu trữ được tạo ra
CREATE PROCEDURE usp_GetErrorInfo
AS
SELECT
	ERROR_NUMBER() AS ErrorNumber
	,ERROR_SEVERITY() AS ErrorSeverity  
    ,ERROR_STATE() AS ErrorState  
    ,ERROR_PROCEDURE() AS ErrorProcedure  
    ,ERROR_LINE() AS ErrorLine  
    ,ERROR_MESSAGE() AS ErrorMessage; 
GO
BEGIN TRY
SELECT 1/0;
END TRY
BEGIN CATCH

EXECUTE usp_GetErrorInfo;
END CATCH

--8. Xóa bỏ tất cả các thủ tục lưu trữ đã được tạo ra
	DROP PROCEDURE HeavyToys
	DROP PROCEDURE PriceIncreasecho
	DROP PROCEDURE QtyOnHand




















