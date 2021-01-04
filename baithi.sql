CREATE DATABASE BAITHI
GO
CREATE TABLE Categories
(
CateID char(6) PRIMARY KEY,
CateName nvarchar (100) not null,
[Description] nvarchar (200)
)

GO
CREATE TABLE Parts
(
PartID int primary key identity,
PartName nvarchar(100) not null,
CateID char(6),
[Description] nvarchar (1000),
Price money not null default (0),
Quantity int default (0),
Warranty int default (1),
Photo nvarchar (200) default ('photo/nophoto.png'),
CONSTRAINT FK_CateID FOREIGN KEY (CateID) REFERENCES Categories(CateID)
)
GO
INSERT INTO Categories(CateID,CateName) VALUES ('A1','RAM');
INSERT INTO Categories(CateID,CateName) VALUES ('A2','CPU');
INSERT INTO Categories(CateID,CateName) VALUES ('A3','HDD');
GO
INSERT INTO Parts(PartName,CateID,Price,Quantity) VALUES ('RAM 2GNB', 'A1','100','10');
INSERT INTO Parts(PartName,CateID,Price,Quantity) VALUES ('RAM 2GNB', 'A2','200','10');
INSERT INTO Parts(PartName,CateID,Price,Quantity) VALUES ('RAM 2GNB', 'A3','125','10');
INSERT INTO Parts(PartName,CateID,Price,Quantity) VALUES ( 'CPU1','A1','160','10');
INSERT INTO Parts(PartName,CateID,Price,Quantity) VALUES ( 'CPU1','A2','166','10');
INSERT INTO Parts(PartName,CateID,Price,Quantity) VALUES ( 'CPU1','A3','165','10');
SELECT CateName,Price FROM Categories,Parts
WHERE Price > 100
GO
SELECT *FROM Parts
WHERE PartName = 'CPU1' 
CREATE VIEW V_Parts AS
SELECT PartID, PartName, Price, Quantity FROM Categories JOIN Parts on Categories.CateID = Parts.CateID
GO
CREATE VIEW V_TopParts AS
SELECT TOP 5 * FROM Parts ORDER BY Price DESC
