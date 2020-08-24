CREATE DATABASE MyBlog2
--
CREATE TABLE Users
(
	UserID INT identity
	CONSTRAINT PK_UserID_User PRIMARY KEY(UserID),
	UserName VARCHAR(20),
	Password VARCHAR(30) ,
	Email VARCHAR(30) UNIQUE,
	ADDRESS	NVARCHAR(200)
)
CREATE TABLE Posts
(
	PostID INT Identity
	CONSTRAINT PK_PostID_Posts PRIMARY KEY(PostID),
	Title	NVARCHAR(200),
	Content	NVARCHAR(100),
	Tag	NVARCHAR(100) ,
	Status	bit,
	CreateTime	DATETIME Default Current_timestamp,
	UpdateTime	DATETIME,
	UserID	INT,
	CONSTRAINT FK_Users_Posts FOREIGN KEY (UserID) REFERENCES Users

)
CREATE TABLE Comments
(
	CommentID	INT Identity
	CONSTRAINT PK_CommentID_Commnents PRIMARY KEY(CommentID),
	Content	NVARCHAR(500),
	Status	BIT,
	CreateTime	DATETIME Default Current_timestamp ,
	Author	NVARCHAR(30),
	Email	VARCHAR(50) NOT NULL,
	PostID	INT,
	CONSTRAINT FK_Posts_Comments FOREIGN KEY (PostID) REFERENCES Posts
)

--3. Create a constraint (CHECK) to ensure value of Email column (on the Users table and the Comments table) always contain the ‘@’ character.
--Create a constraint (CHECK) to ensure value of Email column (on the Users table
--and the Comments table) always contain the ‘@’ character.
ALTER TABLE USERS
ADD CONSTRAINT Users_check CHECK(Emai like '%@')

--4. Create an unique, none-clustered index named IX_UserName on UserName columon table Users.
CREATE UNIQUE CLUSTERED INDEX IX_UserName
ON Users(Username)

--5. Insert into above tables at least 3 records per table.
--Bang Users
INSERT INTO Users Values ('DB001','bach123','daobach20091997@gmail.com',N'Hà Nội')
INSERT INTO Users Values ('DB002','dao1234','daole6886@gmail.com',N'Hà Nội')
INSERT INTO Users Values ('DB003','huy3456','huynguyen2309@gmail.com',N'Hà Nội')
INSERT INTO Users Values ('DB004','ngoc999','ngocdao1201mail.com',N'Nam Định')
INSERT INTO Users Values ('DB005','phat668','phatnguyen98@gmail.com',N'Nam Định')


--Bang Posts
INSERT INTO Posts Values(N'HTML',N'Học Lập trinh','CNTT',1,'1997-09-20','1999-6-7',1)
INSERT INTO Posts Values(N'SQL',N'Học Lập Trình','CNTT',2,'1999-09-20','1999-6-7',2)
INSERT INTO Posts Values(N'Java',N'Học Lập trinh','CNTT',3,'1997-09-20','1999-6-7',3)
INSERT INTO Posts Values(N'CSS',N'Học Lập trinh','CNTT',4,'1997-09-20','1999-6-7',4)
INSERT INTO Posts Values(N'PHP',N'Học Lập trinh','CNTT',5,'1997-09-20','1999-6-7',5)

--Bang Comment
INSERT INTO Comments Values('HTML',1,'1997-09-20',n'ok','hayday01@gmail.com',1)
INSERT INTO Comments Values('SQL',2,'1997-09-20',n'ok','hayday02@gmail.com',2)
INSERT INTO Comments Values('Java',3,'1997-09-20',n'ok','hayday03@gmail.com',3)
INSERT INTO Comments Values('CSS',4,'1997-09-20',n'ok','hayday04@gmail.com',4)
INSERT INTO Comments Values('PHP',5,'1997-09-20',n'ok','hayday05@gmail.com',5)

--6 Create a query to select the postings has the ‘Social’ tag.
SELECT Tag
FROM Posts
WHERE Tag = 'Social'

--7 Create a query to select the postings that have author who has ‘abc@gmail.com’
--email.
SELECT  Title,Content,Status,CreateTime,UpdateTime
FROM Posts
WHERE PostID IN (SELECT PostID from Comments
WHERE email='abc@gmail.com')
--8 Create a query to count the total comments of the posting.
SELECT COUNT(*) AS Total
FROM Comments
Group By PostID

--9.Create a view named v_NewPost, this view includes Title, UserName and
--CreateTime of two lastest posting.
CREATE VIEW v_NewPost AS
SELECT Title,Username
FRom Posts as P
join Users AS u
On p.UserID = u.UserID

--10.Create a stored procedure named sp_GetComment that accepts PostID as given
--input parameter and display all comments of the posting. [3 marks]

CREATE Procedure sp_GetComment 
	@PostID int AS
BEGIN
	select * from Comments where PostID = @PostID
END
GO

--11.Create a trigger nammed tg_UpdateTime to automatic update UpdateTime column in the Posts table to current time when the record in this table is updated. [2 marks]
CREATE TRIGGER tg_UpdateTime
ON Posts
AFTER  INSERT,UPDATE AS
BEGIN
   UPDATE Posts 
   SET UpdateTime = GETDATE()
   FROM Posts
   JOIN deleted ON Posts.PostID = deleted.PostID    
END

